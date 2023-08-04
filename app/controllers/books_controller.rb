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
