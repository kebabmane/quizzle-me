class TagController < ApplicationController
	def show
  	   @tag = Tag.find(params[:id])
 	   @facts = Fact.tagged_with(@tag.name)
	end
end
