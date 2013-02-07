class TemplatesController < ApplicationController

  before_filter :signed_in_user,  only: [:index, :destroy]
  before_filter :correct_user,    only: [:show, :destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all
    @user = current_user
    @user.name = "#{@user.vorname} #{@user.nachname}"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @templates }
    end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    @template = Template.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/new
  # GET /templates/new.json
  def new
    @template = Template.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(params[:template])
    
    if @template.save
      flash[:success] = 'Dein Profil wurde erfolgreich erstellt und ist jetzt auf der Startseite mit dem Kennwort abrufbar.'
      redirect_to templates_path
    else
      flash[:error] = 'Bitte lade immer ein Video hoch, wenn du ein neues Profil erstellst!'
      redirect_to templates_path
    end
  end

  # PUT /templates/1
  # PUT /templates/1.json
  def update
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to templates_path }
      format.json { head :no_content }
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Bitte melde dich an."
      end
    end

    def correct_user
      @template = Template.find(params[:id])
      
      if signed_in?
      redirect_to(root_path) unless current_user.fingerprint == @template.fingerprint
      else
        redirect_to(root_path) unless current_template.id == @template.id
      end
    end

end
