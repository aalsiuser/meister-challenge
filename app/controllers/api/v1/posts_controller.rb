class Api::V1::PostsController < ApiController
  before_action :set_post, only: [:show, :destroy]

  # Get /api/v1/posts
  def index
    posts = Post.where(author_id: params[:user_id]).all
    render json: posts
  end

  # GET /api/v1/posts/:id
  def show
    render json: @post
  end

  # POST /api/v1/posts
  def create
    post = create_update_post(post_params)

    render json: post, status: :created
  end

  # PATCH/PUT /api/v1/posts/:id
  def update
    post = create_update_post(post_params)

    render json: post, status: :ok
  end

  # Delete /api/v1/posts/:id
  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :content, :summary, :user_id)
  end

  def set_post
    @post = Post.find(id: params[:id])
  end
end
