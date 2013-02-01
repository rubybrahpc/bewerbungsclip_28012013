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

    respond_to do |format|
      if @template.save
        format.html { redirect_to templates_path, notice: 'Dein Profil wurde erfolgreich erstellt und ist jetzt auf der Startseite mit dem Bewerbungs-Key abrufbar.' }
        format.json { render json: @template, status: :created, location: @template }
      else
        format.html { render action: "new" }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
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
      redirect_to(root_path) unless current_user.id == @template.user_id
    end

end
