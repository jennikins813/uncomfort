class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
    15.times do 
      question = @quiz.questions.build
      3.times { question.answers.build }
    end
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      flash[:notice] = "Successfully submitted Quiz"
      #redirect_to results_show_path
    else
      render :action => 'new'
    end

    user_answer = @quiz.questions.answers(params[:content])
    result = user_answer

    respond_to do |format|
      if @quiz.save
      format.html {}
      format.js {}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
