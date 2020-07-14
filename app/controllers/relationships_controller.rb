class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user

	def create
		following = current_user.follow(@user)
		if following.save
			redirect_to request.referer, notice: "ユーザーをフォローしました"
		else
			redirect_to request.referer, notice: "ユーザーのフォローに失敗しました"
		end
	end

	def destroy
		following = current_user.unfollow(@user)
		if following.destroy
			redirect_to request.referer, notice: "ユーザーのフォローを解除しました"
		else
			redirect_to request.referer, notice: "ユーザーのフォロー解除に失敗しました"
		end
	end

	private
	def set_user
		@user = User.find(params[:follow_id])
	end
end
