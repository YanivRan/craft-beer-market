class BeerCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beer_category, only: [:show, :edit, :update, :destroy, :change]

  def show
    respond_to do |format|
      format.html
    end
  end

  def index 
    @beerscategory = BeerCategory.all
  end

  def new
    @beer_category = BeerCategory.new
    respond_to do |format|
    	format.html 
    	format.json { render json:  @beer_category }
    end 
  end

  def edit
  end

  def create
    @beer_category = BeerCategory.new(beer_category_params)
    @beer_category.save
    respond_to do |format|
      format.html { redirect_to beer_categories_path, :notice => 'Category was added!' }
      format.json { render json:  @beer_category }
    end 
    #
    #@beer_category.save
    #respond_with(@beer_category)
  end

  def update
    @beer_category.update(beer_category_params)
    respond_to do |format|
      format.html {redirect_to beer_categories_path, notice: "Beer Category Updated"}
      format.json { render json:  @beer_category }
    end
  end

  def destroy
    @beer_category.destroy
    respond_with(@beer_category)
  end

  

  private
    def set_beer_category
      @beer_category = BeerCategory.find(params[:id])
    end

    def beer_category_params
      params.require(:beer_category).permit(:name, :description)
    end
end 