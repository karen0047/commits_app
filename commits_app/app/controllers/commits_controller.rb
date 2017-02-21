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
    if @commit.get_from_api(:author,:repo)
      redirect_to @commit
    end
  end

  def destroy
    @commit = Commit.find(params[:id])
    if @commit.destroy
      redirect_to root_path
    end
  end
  private
  def commmit_params
    require(:commits).permit(:name, :email, :date, :sha)
  end
  def get_from_api_params
    params.permit(:author, :repo, :interpolated)
  end
end