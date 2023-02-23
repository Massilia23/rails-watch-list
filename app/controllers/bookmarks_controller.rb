class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark = Bookmark.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.list = @list
    if @bookmark.save
      redirected_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirected_to bookmark_path(@bookmark.list), status: :see_other
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
