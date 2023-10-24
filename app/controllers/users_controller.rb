class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    # @users = Person.all

    @q = User.ransack(params[:query])
    @users = @q.result(distict: true)

    @pagy, @users = pagy(@users)
  end
  
  def profile

  end

  private

  def set_user
    puts "set_user"
    puts params[:id]
    @user = User.find(params[:id])
  end
end
