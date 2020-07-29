class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    
    @user = current_user
    # controllerではcurrent_page?は使えない
    # if current_page?(user_path(@user))
      redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.remove_favorite(micropost)
    flash[:success] = '投稿をお気に入りから外しました。'
    redirect_back(fallback_location: root_path)
  end
end
