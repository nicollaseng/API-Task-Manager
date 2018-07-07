require 'rails_helper'

RSpec.describe 'Users API', type: :request do
	let!(:user) {FactoryBot.create(:user)}
	let(:user_id) {user.id}

	before {host! "api.taskmanager.test"}

	describe "GET /users/:id" do 
		before do
			headers = {"Accept" => "application/vnd.task-manager.v1"}
			get "/users/#{user_id}", params: {}, headers: headers
		end

		context "when user exists" do 
			it "returns the user" do
				user_response = JSON.parse(response.body)
				expect(user_response["id"]).to eq(user_id)
			end

			it 'returns status 200' do 
				expect(response).to have_http_status(200)
			end
		end

		context 'when user does not exists' do
			let(:user_id) {10000}
			it 'returns status code 404' do 
				expect(response).to have_http_status(404)
			end
		end
 	end

 	describe 'Post /users' do
 		before do 
 			headers = {'Accept' => 'application
 						/vnd.task-manager.v1'}
 			post '/users', params: {user: user_params}
 		end
 	
 		context 'when users are valid' do
 			let(:user_params) {FactoryBot.attributes_for(:user)}
 		
 			it 'returns status code 201' do
 				expect(response).to have_http_status(201)
 			end

 			it 'returns json data ' do
 				user_response = JSON.parse(response.body)
 				expect(user_response['email'].to eql(user_params[:email]))
 			end
 		end

 		context 'when users are invalid' do

 		end
 	end

end