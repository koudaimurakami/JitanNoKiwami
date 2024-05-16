class UserAnswersController < ApplicationController
  def new
    @user_answer = UserAnswer.new
  end
  
  def create
    session_identifier = params[:user_answer][:session_identifier]
    
    ActiveRecord::Base.transaction do
      (0..9).each do |index|
        user_answer_params = params[:user_answer]["user_answer_#{index}"]
        user_answer = UserAnswer.new(user_id: user_answer_params[:user_id],
                                     category_quiz_question_id: user_answer_params[:category_quiz_question_id],
                                     category_question_choice_id: user_answer_params[:category_question_choice_id],
                                     session_identifier: session_identifier)
        user_answer.save!
      end
    end
    redirect_to user_answers_path(session_identifier: session_identifier)
  end

  def index
    @user_answers = UserAnswer.where(user_id: current_user.id, session_identifier: params[:session_identifier]).includes(:category_quiz_question, :category_question_choice)
  end
  
end
