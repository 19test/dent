require "rails_helper"

RSpec.describe PracticesController, :type => :controller do

	let(:practice) {Practice.create!(name: "Sugar Clinic", address: "444 sugar ave")}
	
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
			p = Practice.create!(name: "Cavity Fixers", address: "444 tarter street")
			expect(p.id).to_not eq(nil)
		end

		it "should return any errors with the new practice"
	end

	describe "update" do
		it "should update the practice using safe parameters"
		
		it "should ignore any unsafe parameters" do
			original_id = practice.id
			expect(Practice).to receive(:find) {practice}
			post :update, {id: practice.id, practice: {random_thing: "hi", name: "Sugar 2", id: 2323232}}
			expect(practice.name).to eql("Sugar 2")
			expect(practice.id).to eql(original_id)
		end

		it "should return any errors with the updated practice"
	end

	describe "destroy" do
		it "should destroy any existing associations"
		
		it "should destroy the practice" do
			practices = Practice.where("id = ?", practice.id)
			expect(practices.count).to eql(1)
			delete :destroy, {id: practice.id}
			practices = Practice.where("id = ?", practice.id)
			expect(practices.count).to eql(0)
		end
	end
end