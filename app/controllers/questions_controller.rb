class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user,
                only: %i[update destroy edit hide]
  before_action :set_question, only: %i[update show destroy edit hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      redirect_to user_path(@question.user), notice: "Новый вопрос создан!"
    else
      flash[:alert] = "ошибка в создании вопроса"
      render :new
    end
  end

  def destroy
    @user = @question.user
    @question.destroy
    redirect_to user_path(@user), notice: "Вопрос удален!"
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to @question
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
    @users = User.order(created_at: :desc).last(10)
  end

  def new
    if params[:user_id].present?
      user = User.find(params[:user_id])
      redirect_to(user_nickname: user)
      return
    end
    @user = User.find_by!(nickname: params[:user_nickname])
    @question = Question.new(user: @user)
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    @question.update(question_params)
    if @question.valid?
      redirect_to user_path(@question.user), notice: "Сохранили вопрос!"
    else
      flash[:alert] = "ошибка в редактировании вопроса"
      render :edit
    end
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
