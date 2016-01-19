class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update]
  respond_to :json

  def index

    respond_to do |format|
      format.json { render json: Book.all }
      format.html
    end

  end

  def edit
  end

  def update

    @book.cover_image = params[:file] if params[:file].present?

      if @book.update(book_params)
        render :nothing => true, status: :ok
      else
         render json: @book.errors.to_a, status: :unprocessable_entity
      end

  end

  def create

    @book = Book.new(book_params)

      if @book.save
        render :json => @book, status: :created
      else
        render json: @book.errors.to_a, status: :unprocessable_entity
      end
  end

  def destroy
    respond_with Book.destroy(params[:id])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :description, :create_at)
  end

end
