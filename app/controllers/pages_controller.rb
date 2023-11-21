class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def account
    @user = current_user
    @pet = Pet.new
  end

end
