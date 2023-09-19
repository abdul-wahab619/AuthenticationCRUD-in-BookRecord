class BookRecordController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @book_records = BookRecord.all

    # Check if minimum and maximum prices were provided in the search form
    if params[:min_price].present? && params[:max_price].present?
      @book_records = @book_records.where(price: params[:min_price]..params[:max_price])
    end

  def show
  end

  def new
    @book_record = BookRecord.new
  end

  def create
    @book_record = BookRecord.new(book_params)

    if @book_record.save
      redirect_to book_records_path, notice: 'Book Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book_record.update(book_params)
      redirect_to book_records_path, notice: 'Book Updated!'
    else
      render :edit
    end
  end

  def destroy
     @book_record = BookRecord.find(params[:id])   
    if @book_record.delete   
      flash[:notice] = 'Product deleted!'   
      redirect_to book_records_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
#   @book_record = BookRecord.find(params[:id])
#   @book_record.destroy
#   redirect_to book_records_path, notice: 'Book Record Deleted!'
    end

  private

  def book_params
    params.require(:book_record).permit(:title, :content, :author, :author_address, :price, :book_id)
  end

  def find_book
    @book_record = BookRecord.find_by(id: params[:id])
  end

end
