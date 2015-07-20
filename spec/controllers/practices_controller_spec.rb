require "rails_helper"

RSpec.describe PracticesController, :type => :controller do

	describe "index" do
		it "should list all the practices"
	end

	describe "show" do
		it "should show the practice"
	end

	describe "new" do 
		it "should initialize a new practice"
		it "should initialize an empty collection of professionals"
		it "should initialize a new professional"
	end

	describe "edit" do
		it "should collect the associated professionals"
		it "should initialize a new professional"
	end

	describe "create" do 
		it "should create the practice using safe parameters"
		it "should ignore any unsafe parameters"
		it "should return any errors with the new practice"
	end

	describe "update" do
		it "should update the practice using safe parameters"
		it "should ignore any unsafe parameters"
		it "should return any errors with the new practice"
	end

	describe "destroy" do
		it "should destroy any existing associations"
		it "should destroy the practice"
	end
end