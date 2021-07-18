class Api::V1::CommentsController < ApiController
  before_action :set_post, only: [:show, :destroy]

  # GET /api/v1/posts/:post_id/comments
  def index
    comments = Comment.where(user_id: params[:user_id], post_id: params[:post_id]).all
    render json: comments
  end

  # GET /api/v1/comments/:id
  def show
    render json:@comment
  end

  # POST /api/v1/posts/:post_id/comments
  def create
    comment = create_update_comment(comment_params)
    render json: comment, status: :created
  end

  # PATCH /api/v1/comments/:id
  def update
    comment = create_update_comment(comment_params)
    render json: comment, status: :ok
  end

  # DELETE /api/v1/comments/:id
  def delete
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end

  def set_comment
    @coment = Comment.find(id: params[:id])
  end
end
