class Admin::SportCategoriesController < ApplicationController
  before_action :set_admin_sport_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/sport_categories
  def index
    @sport_categories = SportCategory.all
  end

  # GET /admin/sport_categories/1
  def show
  end

  # GET /admin/sport_categories/new
  def new
    @sport_category = SportCategory.new
  end

  # GET /admin/sport_categories/1/edit
  def edit
  end

  # POST /admin/sport_categories
  def create
    @sport_category = SportCategory.new(admin_sport_category_params)

    if @sport_category.save
      redirect_to admin_sport_categories_path, notice: 'Sport category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sport_categories/1
  def update
    if @sport_category.update(admin_sport_category_params)
      redirect_to admin_sport_category_path, notice: 'Sport category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/sport_categories/1
  def destroy
    @sport_category.destroy
    redirect_to admin_sport_categories_url, notice: 'Sport category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_sport_category
      @admin_sport_category = SportCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_sport_category_params
      params.require(:sport_category).permit(:name)
    end
end
