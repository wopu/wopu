class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]

  def index
    @helps = Help.available
  end

  def show
  end

  def new
    @help = Help.new
  end

  def edit
  end

  def create
    @help = Help.new(help_params)
    @help.helper = current_user

    if @help.save
      redirect_to @help, notice: 'Help was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @help.update(help_params)
      redirect_to @help, notice: 'Help was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @help.destroy

    redirect_to helps_url
  end

  private
    def set_help
      @help = Help.find(params[:id])
    end

    def help_params
      params.require(:help).permit(:description)
    end
end
