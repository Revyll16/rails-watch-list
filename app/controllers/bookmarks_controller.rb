class BookmarksController < ApplicationController

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to list_bookmarks_path(@bookmark.list), status: :see_other, notice: "Bookmark destroyed"
    end
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.bookmark = @bookmark
    if @bookmark.save
      redirect_to bookmark_path(@bookmark), notice: "Bookmark saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:content)
  end
end
