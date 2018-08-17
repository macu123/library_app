class BooksController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :require_admin, except: [:index, :checkout]
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

  def checkout
    book = Book.find(params[:id])
    book.checkout_by(@current_user)
    redirect_to books_url, notice: 'It has been borrowed successfully!'
  end

  def add_copy
    book = Book.find(params[:id])
    book.add_copy
    redirect_to book, notice: 'One copy has been added successfully!'
  end

  private
  def book_params
    params.require(:book).permit(
        :title, :author, :genre, :sub_genre,
        :num_of_pages, :publisher
      )
  end
end
