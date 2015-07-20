require "rails_helper"

RSpec.describe ProfessionalsController, :type => :controller do

	describe "index" do
		it "should list all the professionals"
	end

	describe "show" do
		it "should show the professional"
	end

	describe "new" do 
		it "should initialize a new professional"
		it "should initialize an empty collection of practices"
	end

	describe "edit" do
		it "should collect the associated practices"
	end

	describe "create" do 
		it "should create the professional using safe parameters"
		it "should ignore any unsafe parameters"
		it "should return any errors with the new professional"
	end

	describe "update" do
		it "should update the professional using safe parameters"
		it "should ignore any unsafe parameters"
		it "should return any errors with the new professional"
	end

	describe "destroy" do
		it "should destroy any existing associations"
		it "should destroy the professional"
	end

end