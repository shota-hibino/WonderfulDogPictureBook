class Public::SearchesController < ApplicationController

	def search
		@dog_breeds = DogBreed.all.page(params[:page]).per(8)
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@records = DogBreed.search_for(@content, @method)
	end
end
