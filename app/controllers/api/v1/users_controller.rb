class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user = User.create(name: params[:name], password: params[:password])
    if user.valid?
      render json: { token: issue_token({ id: user.id }) }
    else
      render json: { error: "User not created" }
    end
  end

end
