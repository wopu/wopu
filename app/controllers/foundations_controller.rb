class FoundationsController < ApplicationController
  before_action :set_foundation, only: [:show, :edit, :update, :destroy]

  def index
    @foundations = Foundation.all
  end

  def show
  end

  def new
    @foundation = Foundation.new
  end

  def edit
  end

  def create
    @foundation = Foundation.new(foundation_params)

    if @foundation.save
      redirect_to @foundation, notice: 'Foundation was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @foundation.update(foundation_params)
      redirect_to @foundation, notice: 'Foundation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @foundation.destroy
    redirect_to foundations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foundation_params
      params[:foundation]
    end
end
