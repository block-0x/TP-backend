class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.select("id, uuid, title, body, is_deleted").all
    render json: { status: 200, posts: posts }
  end

  def show
    post = Post.select("uuid, title, body").fint_by(uuid: params[:uuid])
    render json: { status: 200, post: post }
  end
end
