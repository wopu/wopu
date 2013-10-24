class AvailableTagsController < AdminController

  before_action :set_available_tag, only: [:show, :edit, :update, :destroy]

  def index
    @available_tags = AvailableTag.all
  end

  def show
  end

  def new
    @available_tag = AvailableTag.new
  end

  def edit
  end

  def create
    @available_tag = AvailableTag.new(available_tag_params)

    if @available_tag.save
      redirect_to @available_tag, notice: 'Available tag was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @available_tag.update(available_tag_params)
      redirect_to @available_tag, notice: 'Available tag was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @available_tag.destroy
    
    redirect_to available_tags_url
  end

  private
    def set_available_tag
      @available_tag = AvailableTag.find(params[:id])
    end

    def available_tag_params
      params.require(:available_tag).permit(:name)
    end
end
