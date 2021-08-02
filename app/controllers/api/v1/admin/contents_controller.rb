class Api::V1::Admin::ContentsController < ApplicationController

  def create
    content = Content.new(content_params)

    if content.save
      render json: { status: 200, content: content }
    else
      render json: { status: 500, message: "作成に失敗しました" }
    end
  end

  def update
    content = Content.find(params[:id])
    content.title = content_params[:title]
    content.summary = content_params[:summary]
    content.is_deleted = content_params[:is_deleted]

    if content.save
      render json: { status: 200, content: content }
    else
      render json: { status: 500, message: "更新に失敗しました" }
    end
  end

  private

    def content_params
      params.permit(:title, :summary, :is_deleted)
    end
end
