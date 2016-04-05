class Admin::VideosAdminController < Admin::AdminController
	before_action :set_video, only: [:show, :edit, :update, :destroy]
	layout 'sb2'
	
	def index
		@videos = Video.all	
		render 'admin/videos_admin/index', layout: 'sb2'
	end

	def new
		@video = Video.new
	end

	def show
	end

	def edit
	end

	def create
		@video = Video.new(video_params)

		respond_to do |format|
			if @video.save
				format.html { redirect_to @video, notice: 'Video was successfully created.' }
				format.js {}
			else
				format.html { render :new }
			end
		end
	end

	def update
		if @video.update(video_params)
		  redirect_to @video, notice: 'Video was successfully updated.'
		else
		  render :edit
		end
	end

	def destroy
		@video.destroy
		redirect_to :videos, notice: 'Post was successfully destroyed.'
	end

private

	def video_params
		params.require(:video).permit(:chapter_id, :video_url, :title, :details, :transcript, :faqs, :position)
	end	

	def set_video
		@video = Video.find_by_id(params[:id])
	end

end