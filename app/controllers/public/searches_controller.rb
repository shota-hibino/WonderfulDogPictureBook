class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@records = DogBreed.search_for(@content, @method)
	end
end
