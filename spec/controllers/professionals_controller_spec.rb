require "rails_helper"

RSpec.describe ProfessionalsController, :type => :controller do

	let(:professional) {Professional.create!(name: "Dr Sugar", email: "doctor@sugar.com")}
	let(:practice) {Practice.create!(name: "Sugar Clinic")}

	before do
		request.env["HTTP_REFERER"] = "/test/host"
	end

	describe "index" do
		it "should list all the professionals" do
			get :index
			expect(response.status).to eql(200)
		end
	end

	describe "show" do
		it "should show the professional" do
			get :show, {id: professional.id}
			expect(response.status).to eql(200)
		end
	end

	describe "create" do 
		it "should create the professional" do
			post :create, {professional: {name: "Cavity Fixers", 
									email: "doctor@sugar.com"}}
			expect(Professional.all.count).to eql(1)
		end

		it "should find a practice by id if there is one" do
			expect(Practice).to receive(:find).with(practice.id.to_s).and_return(practice)
			expect(practice).to receive(:add_professional)
			post :create, {professional: {name: "Cavity Fixers", 
									email: "doctor@sugar.com", practice_ids: [practice.id]}}
		end

		it "should return any errors with the new professional"
	end

	describe "update" do
		it "should update the professional" do
			p = Professional.create!(email: "doctor@nosugar.com")
			expect(p.email).to eq("doctor@nosugar.com")
		end

		it "should ignore any unsafe parameters" do
			original_id = professional.id
			expect(Professional).to receive(:find) {professional}
			post :update, {id: professional.id, professional: {random_thing: "hi", name: "Dr Guy", id: 2323232}}
			expect(professional.name).to eql("Dr Guy")
			expect(professional.id).to eql(original_id)
		end
		it "should return any errors with the new professional"
	end

	describe "destroy" do
		it "should destroy any existing associations"
		it "should destroy the professional" do
			professionals = Professional.where("id = ?", professional.id)
			expect(professionals.count).to eql(1)
			delete :destroy, {id: professional.id}
			professionals = Professional.where("id = ?", professional.id)
			expect(professionals.count).to eql(0)
		end
	end

end