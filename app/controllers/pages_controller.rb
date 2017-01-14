class PagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def home
    @posts = []
    Post.all.each do |p|
      if current_user.following? User.find(p.user_id) or p.user_id === current_user.id
        @posts << p
      end
    end
    @newPost = Post.new
  end

  def profile
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found"
    end
    @posts = Post.all.where('user_id = ?',User.find_by_username(params[:id]).id)
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end

  def explore
    @newPost = Post.new
    @posts = Post.all
    @toFollow = User.all.last(5)
  end
end
