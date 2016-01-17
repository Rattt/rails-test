class BooksController < ApplicationController
  respond_to :json

  def index
    respond_to do |format|
      format.json { render json: Book.all }
      format.html
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    render nothing: true
  end

  def create
    respond_with Book.create(book_params)
  end

  def destroy
    respond_with Book.destroy(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :cover_image, :create_at)
  end

end
