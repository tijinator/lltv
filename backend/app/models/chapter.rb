require 'aws'

class Chapter < ActiveRecord::Base
  # belongs_to :parent, class: 'Chapter'
  # has_many :children, class: 'Chapter', foreign_key: :parent_id

  belongs_to :course

  # has_ancestry

  has_many :tags, through: :item_tags, source: :taggable, source_type: 'Tag'
  has_many :categories, through: :item_categories, source: :categorizable, source_type: 'Category'

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :videos

  # after_video_post_process :set_needs_transcoding
  # after_commit :transcode_video

  # attr_accessor :transcoding_needed

  def set_needs_transcoding
    if self.video.nil? || video_updated_at_changed?
      self.transcoding_needed = true
    end
  end

  # def transcode_video
  #   puts self.video.url
  #   if self.transcoding_needed
  #     url = self.video.url.split('/')
  #     url.pop
  #     url = url.drop(4).join('/')
  #     input_url = in_url + '/' + self.video_file_name
  #     url.pop
  #     output_url = url + '/mp4_' + file_name + '.mp4'

      # file_name = File.basename(self.video_file_name)
      # File.extname(self.video_file_name)
  #     output_url = url + '/mp4_' + file_name + '.mp4'
  #     pipeline_front = ElasticTranscoder::Pipeline.new
  #     pipeline_front.pipeline ENV['AWS_ET_PIPELINE_ID']
  #     jobs_front = ElasticTranscoder::Jobs.new
  #     jobs_front.create_job input_url, output_url, ENV['AWS_ET_PIPELINE_ID'], "1351620000001-000001", "#{url}/thumbnail-{count}"
      # self.transcoding_needed = false
      # self.trancoded_video_url = output_url
      # self.save
  #   end
  # end

  def transcode_video
    if self.transcoding_needed
      pipeline_id = ENV['AWS_ET_PIPELINE_ID']
      preset_id = ENV['AWS_ET_PRESET_ID']

      url = self.video.url.split('/')
      url.pop
      url = url.drop(4).join('/')
      file_name = File.basename(self.video_file_name, ".*")
      input_url = url + '/' + self.video_file_name
      output_url = url + '/mp4_' + file_name + '.mp4'

      transcoder = AWS::ElasticTranscoder::Client.new
      job = transcoder.create_job(
        pipeline_id: pipeline_id,
        input: {
          key: input_url,
          frame_rate: 'auto',
          resolution: 'auto',
          aspect_ratio: 'auto',
          interlaced: 'auto',
          container: 'auto'
        },
        output: {
          key: output_url,
          preset_id: preset_id,
          thumbnail_pattern: "", 
          rotate: '0' 
        }   
      )[:job]
      self.transcoding_needed = false
      self.transcoded_video_url = ENV['S3_BASE_VIDEO_URL'] + output_url
      self.save
    end
  end
end