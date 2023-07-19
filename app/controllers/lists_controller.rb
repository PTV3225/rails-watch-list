class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      # puts "That movie had already been chosen"
      render "new"
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
