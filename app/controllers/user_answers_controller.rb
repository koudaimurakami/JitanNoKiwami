class UserAnswersController < ApplicationController
  def new
    @user_answer = UserAnswer.new
  end
  
  def create
    (0..9).each do |index|
      user_answer_params = params[:user_answer]["user_answer_#{index}"]
      user_answer = UserAnswer.new(user_id: user_answer_params[:user_id],
                                   category_quiz_question_id: user_answer_params[:category_quiz_question_id],
                                   category_question_choice_id: user_answer_params[:category_question_choice_id])
      user_answer.save
    end
    redirect_to user_answers_path
  end

  def index
    @user_answers = UserAnswer.where(user_id: current_user.id)
  end
  
  private

  
  
end
