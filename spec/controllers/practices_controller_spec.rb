require "rails_helper"

RSpec.describe PracticesController, :type => :controller do

	let(:practice) {Practice.create!(name: "Sugar Clinic", 
															address: "444 sugar ave", 
															phone_number: "5556666")}

	describe "index" do
		it "should list all the practices" do
			get :index
			expect(response.status).to eql(200)
		end
	end

	describe "show" do
		it "should show the practice" do
			get :show, {id: practice.id}
			expect(response.status).to eql(200)
		end
	end

	describe "create" do 
		it "should create the practice using safe parameters" do
			p = Practice.create!(name: "Cavity Fixers", 
										address: "444 tarter street",
										phone_number: "5556666")
			expect(p.id).to_not eq(nil)
		end

		it "validate the practice has a name" do
			expect {
				Practice.create!(address: "444 tarter street",
										phone_number: "5556666")
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "validate the practice has an address" do
			expect {
				Practice.create!(name: "Cavity Fixers",
										phone_number: "5556666")
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "validate the practice has an phone_number" do
			expect {
				Practice.create!(name: "Cavity Fixers",
										address: "444 tarter street")
			}.to raise_error(ActiveRecord::RecordInvalid)
		end
	end

	describe "update" do

		it "should update the model" do
			controller.stub(:authenticate_user!) {true}
			expect(Practice).to receive(:find) {practice}
			post :update, {id: practice.id, practice: {name: "Sugar 2"}}
			expect(practice.name).to eql("Sugar 2")
		end
		
		it "should ignore any unsafe parameters" do
			controller.stub(:authenticate_user!) {true}
			original_id = practice.id
			expect(Practice).to receive(:find) {practice}
			post :update, {id: practice.id, practice: {random_thing: "hi", 
									name: "Sugar 2", id: 2323232}}
			expect(practice.id).to eql(original_id)
		end

	end

	describe "destroy" do
		it "should destroy any existing associations"
		
		it "should destroy the practice" do
			controller.stub(:authenticate_user!) {true}
			practices = Practice.where("id = ?", practice.id)
			expect(practices.count).to eql(1)
			delete :destroy, {id: practice.id}
			practices = Practice.where("id = ?", practice.id)
			expect(practices.count).to eql(0)
		end
	end
end