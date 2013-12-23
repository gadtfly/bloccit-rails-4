class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index
    @users = User.top_rated.paginate(page: params[:page], per_page: 10)
    authorize @users
  end

  def show
    @user = User.find(params[:id])  
    authorize @user
    @posts = @user.posts.visible_to(current_user)
  end

end
