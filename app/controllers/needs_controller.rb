class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  def index
    @foundation = Foundation.find(params[:foundation_id])
  end

  def show
  end

  def new
    foundation = Foundation.find(params[:foundation_id])
    @need = foundation.needs.build
  end

  def edit
  end

  def create
    @need = Need.new(need_params)
    @need.foundation = Foundation.find(params[:foundation_id])

    if @need.save
      redirect_to @need.foundation, notice: 'Need was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @need.update(need_params)
      redirect_to foundation_need_path(@need.foundation, @need), notice: 'Need was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    foundation = @need.foundation
    @need.destroy

    redirect_to foundation_needs_path(foundation)
  end

  def mark_solved
    need = Need.find(params[:need_id])
    need.solve!

    redirect_to foundation_path(need.foundation), notice: 'Great, your need was solved!'
  end

  private
    def set_need
      @need = Need.find(params[:id])
    end

    def need_params
      params.require(:need).permit(:title, :purpose, :description, :beneficiary, :deadline)
    end
end
