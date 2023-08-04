class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @book_all = Book.all
  end
  
  def create
    @book = Book.new(list_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = 'errors prohibited this book from being saved:'
      render :intex
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "2 errors prohibited this book from being saved:"
      render :show
    end
  end
  
  def destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end
  
  private
  
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
