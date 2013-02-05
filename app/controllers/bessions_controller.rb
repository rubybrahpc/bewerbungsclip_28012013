class BessionsController < ApplicationController

  def new
  end

  def create
    template = Template.find_by_bosskey(params[:bession][:bosskey])
    if template
      sign_in template
      redirect_back_or template
    else
      flash.now[:error] = 'Dieses Kennwort ist nicht vergeben. Bitte kontrollieren Sie die Eingabe.'
      render 'new'
    end
  end

  def destroy
    tsign_out
    redirect_to root_url
  end
end
