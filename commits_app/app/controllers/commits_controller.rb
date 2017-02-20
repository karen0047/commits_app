class CommitsController < ApplicationController
  require 'json'
  def index
    @commits = Commit.all
  end

  def show
    @commit = Commit.find(params[:id])
  end

  def new
    @commit = Commit.new
  end

  def edit
    @commit = Commit.find(params[:id])
  end

  def create
    @commit = Commit.new
    if @commit.save
      @commit.api_data
      redirect_to root_path 
    else
      render 'new'
    end
  end

  def destroy
    @commit = Commit.find(params[:id])
    if @commit.destroy
      redirect_to root_path
    end
  end
  private
  def commit_params
    require(:commits).permit(:name, :email, :date, :sha)
  end
end