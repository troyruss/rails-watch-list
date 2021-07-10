class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  private

  def review_params
    params.require(:bookmark).permit(:comment)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
