class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])

    if @lesson === Lesson.all.last

      render :end
    elsif @lesson === Lesson.all.first
      render :first

    else
      render :show
    end
  end

  def next
    @current_lesson = Lesson.find(params[:id])
    @lesson_number = @current_lesson.number + 1
    @lesson = Lesson.find_by(:number => @lesson_number)
    render :show
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to lessons_path
    else
    render :edit
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private
    def lesson_params
      params.require(:lesson).permit(:name, :content, :number)
    end
  end
