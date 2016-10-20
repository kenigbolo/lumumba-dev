class DesignsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	def index
		@design = Design.new
		
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		render "success"
	end
end
