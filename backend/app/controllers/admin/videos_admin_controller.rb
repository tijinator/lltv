class Admin::VideosAdminController < Admin::AdminController
	before_action :set_video, only: [:show, :edit, :update, :destroy]
	before_action :set_chapter, except: [:index, :destroy]

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
		@video = @chapter.videos.new(video_params)
		
		respond_to do |format|
			if @video.save
				format.html { redirect_to course_path(@chapter.course.id), notice: 'Video was successfully created.' }
				format.js {}
			else
				format.html { render :new }
			end
		end
	end

	def update
		if @video.update(video_params)
		  # redirect_to @video, notice: 'Video was successfully updated.'
		  redirect_to course_path(@chapter.course.id), notice: 'Video was successfully updated.'
		else
		  render :edit
		end
	end

	def destroy
		@video.destroy
		redirect_to :back , notice: 'Post was successfully destroyed.'
	end

private

	def video_params
		params.require(:video).permit(:chapter_id, :video_url, :title, :details, :transcript, :faqs, :position)
	end

	def set_chapter
		@chapter = Chapter.find(params[:chapter_id])
	end

	def set_video
		@video = Video.find_by_id(params[:id])
	end

end
