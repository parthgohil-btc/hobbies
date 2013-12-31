class HobbiesController < ApplicationController
  before_filter :authenticate_user!, except: :index
  def index
    if current_user.present?
      @hobbies = current_user.hobbies
    end
  end

  def show
  end

  def create
    hobby = Hobby.new(params[:hobby])
    hobby.user = current_user
    if hobby.save
      redirect_to root_path
    end
  end

  def new
    @hobby = Hobby.new
  end

  def edit
    @hobby = Hobby.find(params[:format])
  end

  def destroy
    hobby = Hobby.find(params[:format])
    if hobby.destroy
      redirect_to root_path
    end
  end

  def update
    hobby = Hobby.find(params[:format])
    if hobby.update_attributes(params[:hobby])
      redirect_to root_path
    end
  end
end
