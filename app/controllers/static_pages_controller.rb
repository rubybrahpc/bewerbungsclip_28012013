class StaticPagesController < ApplicationController
  
  def haftungsausschluss
  end

  def home
     @user = User.new # UNBEDINGT löschen/ändern dient nur für Layout/Design-Zwecke
  end

  def impressum
  end

  def preise
  end

  def tour
  end

  def wissen
  end
end
