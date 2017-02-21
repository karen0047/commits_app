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
    @commit = Commit.new(commit_params)
    @commit.get_from_api(:author, :repo)
  end

  def destroy
    @commit = Commit.find(params[:id])
    if @commit.destroy
      redirect_to root_path
    end
  end
  private
  def commit_params
    params.permit(:author, :repo)
  end
end