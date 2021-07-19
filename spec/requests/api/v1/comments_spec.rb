require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let!(:author) { create(:user) }
  let!(:author_post) { create(:post, author_id: author.id) }
  let!(:user) { create(:user) }
  let!(:comment1) { create(:comment, post_id: author_post.id, user_id: user.id)}
  let!(:user2) { create(:user) }
  let!(:comment2) { create(:comment, post_id: author_post.id, user_id: user2.id)}

  subject(:response_status) { response.status }
  subject(:response_body) { JSON.parse(response.body) }

  describe 'GET comments#index' do
    it "returns http success" do
      get :index, params: { post_id: author_post.id }

      expect(response).to have_http_status(:success)
    end

    it 'returns comments of post' do
      get :index, params: { post_id: author_post.id }
      expect(response_body.all?{ |p| p['post_id'] == author_post.id }).to eq(true)
    end
  end

  describe "POST comments#create" do
    context 'with required params' do
      it "returns created" do
        post :create, params: { post_id: author_post.id, comment: { user_id: author.id, post_id: author_post.id, content: comment1.content} }
        expect(response).to have_http_status(:created)
      end

      it "increments post count by 1" do
        expect { 
                  post :create, 
                  params: { post_id: author_post.id, comment: { user_id: author.id, post_id: author_post.id, content: comment1.content} } 
               }.to change { Comment.count }.by(1)
      end
    end
  end

  describe "PATCH comments#update" do
    context 'with required params' do
      it "returns updated content" do
        patch :update, params: { id: comment1.id, comment: {  user_id: author.id, post_id: author_post.id, content: 'Test Content'} }
        expect(response).to have_http_status(:ok)
        expect(response_body['content']).to eq("Test Content")
      end
    end

    context 'with params content is being missed' do
      it 'returns 422 unprocessable_entity' do
        patch :update, params: { id: comment1.id, comment: {  user_id: author.id, post_id: author_post.id } }
        expect(response.status).to eq(422)
        expect(response_body['message']).to eq("CommentForm: option 'content' is required")
      end
    end
  end

  describe 'DELETE posts#destroy' do
    context 'with correct comment id' do
      it 'returns http success' do
        delete :destroy, params: { id: comment2.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with incorrect post id' do
      it 'returns http not found' do
        delete :destroy, params: { id: 1000}
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
