class Api::SearchesController < Api::ApiController
    def all_searches
		# render json: {
		# 	categories: Category.all.collect{ |i| i.as_json(:only => [:id, :title]).merge(group: 'category')},
		# 	courses: Course.all.collect{ |i| i.as_json(:only => [:id, :title]).merge(group: 'course')}
		# }

		categories = Category.all.collect{ |i| i.as_json(:only => [:id, :title]).merge(group: 'category')}
		courses    = Course.all.collect{ |i| i.as_json(:only => [:id, :title]).merge(group: 'course')}
		render json: categories + courses, root: false
	end
end