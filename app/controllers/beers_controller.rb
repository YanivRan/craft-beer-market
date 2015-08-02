class BeersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beer, only: [:show, :edit, :update, :destroy, :change, :archive]


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
    @beer.save
    respond_to do |format|
      format.html { redirect_to @beer, :notice => 'Beer was added!' }
      format.json { render json:  @beer}
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
    respond_with(@beer)
  end

  def change
    @beer.update_attributes(state: params[:state])
    respond_to do |format|
      format.html {redirect_to beers_path, notice: "Beer Updated"}
    end
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end


    def beer_params
      params.require(:beer).permit(:manufacturer_id,:name,:category_id,:country_id,:price,:description,:archived)
    end
end
