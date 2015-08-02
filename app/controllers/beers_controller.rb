class BeersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :change, :archive, :new]
  before_action :set_beer, only: [:show, :edit, :update, :destroy, :change, :archive]
  before_action :has_categories

  def index
    @beers = Beer.all
    respond_to do |format|
      format.html
      format.json { render json:  @beers }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json:  @beer }
    end
  end

  def new
    @beer = Beer.new
    respond_to do |format|
      format.html 
      format.json { render json:  @beer }
    end 
  end

  def edit
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      respond_to do |format|
        format.html { redirect_to @beer, :notice => 'Beer was added!' }
        format.json { render json:  @beer}
      end
    else
      respond_to do |format|
        @beer.errors.full_messages.each do |message|
          @errors_string = message + '</br>'+ @errors_string.to_s
        end
        format.html { redirect_to @beer , :alert => @errors_string}
        format.json { render json:  @beer}
      end
    end 
  end

  def update
    @beer.update(beer_params)
    respond_to do |format|
      format.html { redirect_to @beer, :notice => 'Beer was updated!' }
      format.json { render json:  @beer}
    end 
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to @beer, :notice => 'Beer was deleted!' }
      format.json { render json:  @beer}
    end 
  end

  def archive
    @beer.update_attribute(:archived, "true")
    respond_to do |format|
      format.html {redirect_to beers_path, notice: "Beer was archived!"}
      format.json { render json:  @beer}
    end
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def has_categories
      if !BeerCategory.exists?
        redirect_to beer_categories_path
      end 
    end

    def beer_params
      params.require(:beer).permit(:manufacturer_id,:name,:category_id,:country_id,:price,:description,:archived)
    end
end
