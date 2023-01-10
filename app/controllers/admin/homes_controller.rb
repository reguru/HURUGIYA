class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @user = User.all
  end
end
