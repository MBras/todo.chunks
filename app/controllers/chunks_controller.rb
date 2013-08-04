class ChunksController < ApplicationController
	before_action :signed_in_user, only: [:create]

	def index
	end

	def create
		@chunk = current_user.chunks.build(chunk_params)
		
		# XXX fix this to obtrain the correct default value for a new chunk
		@chunk.chunk_status_id = 0
		
		if @chunk.save
			flash[:success] = "Chunk posted!"
			redirect_to @current_user
		else
			render 'static_pages/home'
		end
	end

	private
		def chunk_params
			params.require(:chunk).permit(:short_desc)
		end
end