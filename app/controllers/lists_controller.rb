class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @movies = Movie.all
    @list.save
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    redirect_to new_list_bookmark_path(@list)
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
