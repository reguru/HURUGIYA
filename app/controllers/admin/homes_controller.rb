class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @user = User.search(params[:search])
  end
end
