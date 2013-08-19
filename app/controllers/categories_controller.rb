class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, except: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by slug: params[:id]
  end
end
