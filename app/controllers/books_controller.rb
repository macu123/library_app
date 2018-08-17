class BooksController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'It has been created successfully!'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to @book, notice: 'It has been updated successfully!'
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(
        :title, :author, :genre, :sub_genre,
        :num_of_pages, :publisher
      )
  end
end
