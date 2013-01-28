class StaticPagesController < ApplicationController
  def hilfe
  end

  def home
     @user = User.new # UNBEDINGT löschen/ändern dient nur für Layout/Design-Zwecke
  end

  def kontakt
  end

  def preise
  end

  def tour
  end

  def wissen
  end
end
