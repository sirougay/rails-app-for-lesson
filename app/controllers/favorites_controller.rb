class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		# tweetのレコード１件を取得し、インスタンス変数に格納
		@tweet = Tweet.find(params[:tweet_id])
		# 格納したレコードを元にログインしているユーザーのfavoritesインスタンスを生成
		@favorite = current_user.favorites.build(tweet: @tweet)
		# 生成したインスタンスを保存
		if @favorite.save
		# tweets#indexへリダイレクト
			redirect_to tweets_path, notice: "お気に入りに登録しました"
		else
		# tweets#indexへリダイレクト
			redirect_to tweets_path, alert: "お気に入りに登録できませんでした"
		end
	end

	def destroy
		#ログインしているユーザーに紐付いたfavoritesの中からtweet_idが等しいものを１件取得
		@favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
		# destroyメソッドで削除
		@favorite.destroy
		#  tweets#indexへリダイレクト
		redirect_to tweets_path, notice: "お気に入りを削除しました"
	end
end


# 発展課題