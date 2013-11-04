class FoundationsController < ApplicationController
  before_action :set_foundation, only: [:show, :edit, :update, :destroy]

  def index
    @my_foundations = current_user.try(:foundations) || []
    if @my_foundations.any? and params[:my_q]
      @my_foundations = @my_foundations.search(params[:my_q])
    end

    @others_foundations = Foundation.others(current_user) || []
    if @others_foundations.any? and params[:others_q]
      @others_foundations = @others_foundations.search(params[:others_q])
    end

  end

  def show
  end

  def new
    @foundation = Foundation.new
    @foundation.build_contact_info
    @foundation.build_user
  end

  def edit
  end

  def create
    @foundation = Foundation.new(foundation_params)
    @foundation.user = current_user if current_user

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
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    def foundation_params
      #params.require(:foundation).permit(:name, :logo, :mission, :population,
       #:start_date, :category_id, :available_tag_ids, contact_info_attributes: [:email, :phone, :address,
       #:representative], user_attributes: [:email, :password ])
      params.require(:foundation).permit!
    end
end
