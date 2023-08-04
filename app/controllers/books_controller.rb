class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @book_all = Book.all.order("id")
  end
  
  def create
    @book = Book.new(list_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @book_all = Book.all.order("id")
      render :index
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
      render :show
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end
  
  private
  
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
