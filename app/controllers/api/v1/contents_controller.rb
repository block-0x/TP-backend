class Api::V1::ContentsController < ApplicationController
  def index
    contents = Content.select("id, title, summary").all
    render json: { status: 200, contents: contents }
  end

  def show
    content = Content.select("id, title").find_by(title: params[:title])
    posts = content.posts.select("uuid, title")
    render json: { status: 200, content: content, posts: posts }
  end
end
