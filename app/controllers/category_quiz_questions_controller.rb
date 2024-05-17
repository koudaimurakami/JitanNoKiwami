class CategoryQuizQuestionsController < ApplicationController
  
  def index
    @category_quiz_questions = CategoryQuizQuestion.order("RAND()").limit(10)
    @questions_with_choices = @category_quiz_questions.map do |question|
      correct_choices = question.category_question_choices.where(is_correct: true)
      incorrect_choices = question.category_question_choices.where(is_correct: false).shuffle.take(3)
      choices_to_display = (correct_choices + incorrect_choices).shuffle
      { question: question, choices: choices_to_display }
    end
  end
  
end
