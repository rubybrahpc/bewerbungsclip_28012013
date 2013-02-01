class UsersController < ApplicationController

  before_filter :signed_in_user,              only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user,                only: [:show, :edit, :update]
  before_filter :admin_user,                  only: [:index, :destroy]

  def show
    @user = User.find(params[:id])
    @user.name = "#{@user.vorname} #{@user.nachname}"
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Willkommen auf BewerbungsClip.com! Erstelle dein erstes Profil und lade dein Video hoch."
      redirect_to templates_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Du hast deine Daten aktualisiert!"
      sign_in @user
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User wurde geloescht."
    redirect_to users_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Bitte melde dich an."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end