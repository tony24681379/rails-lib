class ProblemCategoriesController < ApplicationController
  before_action :set_problem_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @problem_categories = ProblemCategory.all
    respond_with(@problem_categories)
  end

  def show
    respond_with(@problem_category)
  end

  def new
    @problem_category = ProblemCategory.new
    respond_with(@problem_category)
  end

  def edit
  end

  def create
    @problem_category = ProblemCategory.new(problem_category_params)
    @problem_category.save
    respond_with(@problem_category)
  end

  def update
    @problem_category.update(problem_category_params)
    respond_with(@problem_category)
  end

  def destroy
    @problem_category.destroy
    respond_with(@problem_category)
  end

  private
    def set_problem_category
      @problem_category = ProblemCategory.find(params[:id])
    end

    def problem_category_params
      params.require(:problem_category).permit(:problem)
    end
end
