require 'spec_helper'


RSpec.describe BooksController, :type => :controller do

  let!(:book) { FactoryGirl.create :book }
  let!(:new_book) { FactoryGirl.build :book }


  describe 'POST #create' do

    context 'when name is empty' do

      it "is status is 422" do
        post :create, :book => {'name' => '', 'description' => new_book.description, 'create_at' => new_book.create_at}, :format => :json
        expect(response.status).to eq(422)
      end

    end

    context 'when create new book' do

      let(:create_new_user) { post :create, :book => {'name' => new_book.name, 'description' => new_book.description, 'create_at' => new_book.create_at}, :format => :json }

      it "is status 201" do
        expect(create_new_user).to have_http_status(:created)
      end

      it "is rsponce to json" do
        expect(create_new_user.content_type).to eq "application/json"
      end

    end

  end


  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to be_success
    end

  end


  describe "GET #edit" do

    it "is found" do
      get :edit, { id: book.id }
      expect(response).to render_template(:edit)
    end

  end

end
