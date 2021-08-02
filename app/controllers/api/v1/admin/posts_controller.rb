class Api::V1::Admin::PostsController < ApplicationController

  def create
    post = Post.new(post_params.merge(user_id: 1, content_id: 1))
    post.uuid = uniqid

    if post.save!
      render json: { status: 200, post: post }
    else
      render json: { status: 500, message: "作成に失敗しました" }
    end
  end

  def update
    post = Post.find(params[:id])
    post.title = post_params[:title]
    post.body = post_params[:body]
    post.is_deleted = post_params[:is_deleted]

    if post.save
      render json: { status: 200, post: post }
    else
      render json: { status: 500, message: "更新に失敗しました" }
    end
  end

  private

  def post_params
    params.permit(:title, :body, :is_deleted)
  end

  def uniqid
    def dec62(num)
      table = [('0'..'9'),('a'..'z'),('A'..'Z')].map{|c| c.to_a }.flatten
      num > 61 ? dec62(num/62)+table[num%62] : table[num%62]
    end
    dec62(Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }.to_s.reverse.to_i)
  end
end
