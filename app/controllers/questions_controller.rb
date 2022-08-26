class QuestionsController < ApplicationController
<<<<<<< HEAD
before_action :ensure_current_user, only: %i[update destroy edit hide]
before_action :set_question_for_current_user, only: %i[update destroy edit hide]

def create
  question_params =  params.require(:question).permit(:body, :user_id)
=======
before_action :set_question, only: %i[update show destroy edit hide]

def create
>>>>>>> aab2ff0d0be44cf9a6fa467667fcaba97d327a37
  @question = Question.create(question_params)
  if @question.valid?
    redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
  else
    flash[:alert] = "ошибка в создании вопроса"
    render :new
  end
end

def show
<<<<<<< HEAD
@user = User.find(params[:user_id])
=======
>>>>>>> aab2ff0d0be44cf9a6fa467667fcaba97d327a37
end

def index
  @question = Question.new
  @questions = Question.all
end

def update
<<<<<<< HEAD
  question_params =  params.require(:question).permit(:body, :answer)
=======
>>>>>>> aab2ff0d0be44cf9a6fa467667fcaba97d327a37
  @question.update(question_params)
  if @question.valid?
    redirect_to user_path(@question.user), notice: 'Сохранили вопрос!'
  else
    flash[:alert] = "ошибка в редактировании вопроса"
    render :edit
  end
end

def destroy
  @user = @question.user
  @question.destroy
  redirect_to user_path(@user), notice: 'Вопрос удален!'
end

def new
  @user = User.find(params[:user_id])
  @question = Question.new(user: @user)
end

def edit
end

def hide
  @question.update(hidden: true)
  redirect_to @question
end

private

<<<<<<< HEAD
def ensure_current_user
  redirect_with_alert unless current_user.present?
end

def set_question_for_current_user
  @question = current_user.questions.find(params[:id])
end
=======
def question_params
  params.require(:question).permit(:body, :user_id)
end

def set_question
  @question = Question.find(params[:id])
end

>>>>>>> aab2ff0d0be44cf9a6fa467667fcaba97d327a37
end
