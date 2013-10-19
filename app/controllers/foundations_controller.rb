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

    respond_to do |format|
      if @foundation.save
        format.html { redirect_to @foundation, notice: 'Foundation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @foundation }
      else
        format.html { render action: 'new' }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @foundation.update(foundation_params)
        format.html { redirect_to @foundation, notice: 'Foundation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @foundation.destroy
    respond_to do |format|
      format.html { redirect_to foundations_url }
      format.json { head :no_content }
    end
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
