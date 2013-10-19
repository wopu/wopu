class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  def index
    @needs = Need.all
  end

  def show
  end

  def new
    @need = Need.new
  end

  def edit
  end

  def create
    @need = Need.new(need_params)

    if @need.save
      redirect_to @need, notice: 'Need was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @need.update(need_params)
      redirect_to @need, notice: 'Need was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @need.destroy

    redirect_to needs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end

    def need_params
      params.require(:need).permit(:description)
    end
end
