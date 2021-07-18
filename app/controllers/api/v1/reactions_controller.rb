class Api::V1::ReactionsController < ApiController
  include CommentReactionHelper

  before_action :set_reaction, only: [:destroy]

  # POST /api/v1/comments/:comment_id/reactions
  def create
    reaction = create_comment_reaction
    render json: reaction, status: :created
  end

  # DELETE /api/v1/reactions/:id
  def destroy
    @reaction.destroy
  end

  private

  def reaction_params
    params.require(:reaction).permit(:user_id, :comment_id, :reaction_type).to_h.symbolize_keys
  end

  def set_reaction
    @reaction = CommentReaction.find(params[:id])
  end
end
