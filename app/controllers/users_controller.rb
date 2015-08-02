class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change]

  def index
     @user = User.where(nil)
     respond_to do |format|
      format.html
      format.json { render json:  @user }
    end
  end
  def new
    @user = User.new
    respond_to do |format|
      format.html 
      format.json { render json:  @user }
    end 
  end
  def create
  end 
  def delete
  end
  def add
  end
  def edit
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
