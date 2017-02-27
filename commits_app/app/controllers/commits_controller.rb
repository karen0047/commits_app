class CommitsController < ApplicationController

  def index
    @commits = Commit.all
  end

  def new
    @commit = Commit.new
  end

  def create
    @commit = Commit.new(commit_params)
    @commit.get_from_api
    redirect_to @commit
  end

  def destroy
    @commit = Commit.find(params[:id])
    if @commit.destroy
      redirect_to root_path
    end
  end
  
  private
  def commit_params
    params.require(:commit).permit(:name, :email, :date, :sha, :author, :repo)
  end
end