class Admin::VideosAdminController < Admin::AdminController
	before_action :set_video, only: [:show, :edit, :update, :destroy]

	def index
		@videos = Video.all	
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

		if @video.save
			redirect_to @video
		else
			render :new
		end
	end

	def update
		@video = Video.upate(video_params)

		if @video.save
			redirect_to @video
		else
			render :new
		end
	end

	def destroy
		@video.destroy
		redirect_to :index
	end

private

	def video_param
		params.require(:video).permit(:chapter_id, :video_url, :title, :details, :transcript, :faqs, :position)
	end	

	def set_video
		@video = Video.find_by_id(params[:id])
	end

end