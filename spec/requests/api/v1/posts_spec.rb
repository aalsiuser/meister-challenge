require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  let!(:author) { create(:user) }
  let!(:author_post) { create(:post, author_id: author.id) }
  let!(:user) { create(:user) }

  subject(:response_status) { response.status }
  subject(:response_body) { JSON.parse(response.body) }

  describe "GET posts#index" do
    it "returns http success" do
      get :index, params: { user_id: author.id }

      expect(response).to have_http_status(:success)
    end

    it 'returns post of user' do
      get :index, params: { user_id: author.id }
      expect(response_body.all?{ |p| p['author_name'] == author.first_name }).to eq(true)
    end
  end

  describe "GET posts#show" do
    context 'with post id in params' do
      it "returns http success" do
        get :show, params: { id: author_post.id }
        expect(response).to have_http_status(:success)
      end
  
      it "returns post" do
        get :show, params: { id: author_post.id }
        expect(response_body['title']).to eq(author_post.title)
      end
    end
  end

  describe "POST posts#create" do
    context 'with required params' do
      it "returns created" do
        post :create, params: { post: { title: 'Title', content: 'Content', summary: 'Summary', user_id: author.id} }
        expect(response).to have_http_status(:created)
      end

      it "increments post count by 1" do
        expect { 
                  post :create, 
                  params: { post: { title: 'Title', content: 'Content', summary: 'Summary', user_id: author.id} 
                          } 
               }.to change{ Post.count }.by(1)
      end
    end

    context 'with params title is being missed' do
      it 'returns 422 unprocessable_entity' do
        post :create, params: { post: { content: 'Content', summary: 'Summary', user_id: author.id} }
        expect(response.status).to eq(422)
        expect(response_body['message']).to eq("PostForm: option 'title' is required")
      end
    end
  end

  describe "PATCH posts#update" do
    context 'with required params' do
      it "returns updated content" do
        patch :update, params: { id: author_post.id, post: { id: author_post.id, title: 'Title', content: 'Test Content', summary: 'Summary', user_id: author.id} }
        expect(response).to have_http_status(:ok)
        expect(response_body['content']).to eq("Test Content")
      end
    end

    context 'with params title is being missed' do
      it 'returns 422 unprocessable_entity' do
        patch :update, params: { id: author_post.id, post: { content: 'Content', summary: 'Summary', user_id: author.id} }
        expect(response.status).to eq(422)
        expect(response_body['message']).to eq("PostForm: option 'title' is required")
      end
    end
  end

  describe 'DELETE posts#destroy' do
    context 'with correct post id' do
      it 'returns http success' do
        delete :destroy, params: { id: author_post.id }
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
