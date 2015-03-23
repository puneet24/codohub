class ProblemController < ApplicationController
	def add
	end
	def all
		@problem= Problem.all.reverse
	end
	def create_problem
		problem_title = params[:title]
		problem_statement = params[:statement]
		question = Problem.new
		question.user_id= current_user.id 
		question.name=problem_title
		question.statement=problem_statement
		question.save!
		redirect_to action: 'all'
	end
	def view
		problem_id = params[:id]
		@problem = Problem.find(problem_id)
	    @comments = Comment.where(:problem_id => problem_id).reverse
	end
		
	def user_problems
		@all_user_problems = current_user.problems.reverse
	end
	def edit
		problem_id = params[:id]
		@problem = Problem.find(problem_id)
	end

	def edit_problem
		problem_id = params[:id]
		problem_title = params[:title]
		problem_statement = params[:statement]
		question = Problem.find(problem_id)
		question.user_id= current_user.id 
		question.name=problem_title
		question.statement=problem_statement
		question.save!
		redirect_to action: 'user_problems'
	end

	def add_comment
		problem_id = params[:id]
		comment_body = params[:comment_body]
		on_comment = Comment.new
		on_comment.user_id = current_user.id
		on_comment.problem_id = problem_id
		on_comment.comment = comment_body
		on_comment.save!
		redirect_to action: 'view'
	end
end
