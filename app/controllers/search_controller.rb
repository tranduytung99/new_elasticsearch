class SearchController < ApplicationController
  def search
    if params[:q]
      @user = User.search(params[:q])
      #@user = Post.search(params[:q])
      # @user = User.last
      # @user.search_child(@user.id)
      #byebug
    else
      @user = []
    end
  end
end
