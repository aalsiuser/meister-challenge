require 'rails_helper'

RSpec.describe Api::V1::ReactionsController, type: :controller do

  let!(:author) { create(:user) }
  let!(:author_post) { create(:post, author_id: author.id) }
  let!(:user) { create(:user) }
  let!(:comment1) { create(:comment, post_id: author_post.id, user_id: user.id)}
  let!(:user2) { create(:user) }
  let!(:smile_reaction) { create(:comment_reaction, user_id: user.id, comment_id: comment1.id, reaction_type: 'like')}
  let!(:thumsup_reaction) { create(:comment_reaction, user_id: user2.id, comment_id: comment1.id, reaction_type: 'smile')}

  subject(:response_status) { response.status }
  subject(:response_body) { JSON.parse(response.body) }


  describe 'POST reactions#create' do
    context 'with required params' do
      it 'returns created' do
        post :create, params: { comment_id: comment1.id, reaction: { user_id: user2.id, comment_id: comment1.id, reaction_type: 'thumbs_up'} }
        expect(response).to have_http_status(:created)
      end

      it "increments Comment Reaction count by 1" do
        expect { 
          post :create, params: { comment_id: comment1.id, reaction: { user_id: user.id, comment_id: comment1.id, reaction_type: 'like'} }
               }.to change{ CommentReaction.count }.by(1)
      end
    end

    context 'with params title is being missed' do
      it 'returns 422 unprocessable_entity' do
        post :create, params: { comment_id: comment1.id, reaction: { user_id: user.id, comment_id: comment1.id} }
        expect(response.status).to eq(422)
        expect(response_body['message']).to eq("CommentReactionForm: option 'reaction_type' is required")
      end
    end
  end

  describe 'DELETE reactions#destroy' do
    context 'with correct comment reaction id' do
      it 'returns http success' do
        delete :destroy, params: { id: smile_reaction.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with incorrect post id' do
      it 'returns http not found' do
        delete :destroy, params: { id: 1000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
