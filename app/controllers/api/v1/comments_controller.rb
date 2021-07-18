class Api::V1::CommentsController < ApiController
  include CommentHelper

  before_action :set_comment, only: [:destroy]

  # GET /api/v1/posts/:post_id/comments
  def index
    comments = Comment.where(post_id: params[:post_id]).all
    render json: comments
  end

  # POST /api/v1/posts/:post_id/comments
  def create
    comment = create_update_comment
    render json: comment, status: :created
  end

  # PATCH /api/v1/comments/:id
  def update
    comment = create_update_comment
    render json: comment, status: :ok
  end

  # DELETE /api/v1/comments/:id
  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :user_id, :post_id, :content).to_h.symbolize_keys
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
