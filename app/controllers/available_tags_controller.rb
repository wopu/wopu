class AvailableTagsController < AdminController

  before_action :set_available_tag, only: [:show, :edit, :update, :destroy]

  # GET /available_tags
  # GET /available_tags.json
  def index
    @available_tags = AvailableTag.all
  end

  # GET /available_tags/1
  # GET /available_tags/1.json
  def show
  end

  # GET /available_tags/new
  def new
    @available_tag = AvailableTag.new
  end

  # GET /available_tags/1/edit
  def edit
  end

  # POST /available_tags
  # POST /available_tags.json
  def create
    @available_tag = AvailableTag.new(available_tag_params)

    respond_to do |format|
      if @available_tag.save
        format.html { redirect_to @available_tag, notice: 'Available tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @available_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @available_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_tags/1
  # PATCH/PUT /available_tags/1.json
  def update
    respond_to do |format|
      if @available_tag.update(available_tag_params)
        format.html { redirect_to @available_tag, notice: 'Available tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @available_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_tags/1
  # DELETE /available_tags/1.json
  def destroy
    @available_tag.destroy
    respond_to do |format|
      format.html { redirect_to available_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_tag
      @available_tag = AvailableTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def available_tag_params
      params.require(:available_tag).permit(:name)
    end
end
