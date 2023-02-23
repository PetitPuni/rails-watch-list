class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create destroy]
  before_action :set_bookmark, only: %i[destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
