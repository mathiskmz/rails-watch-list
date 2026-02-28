class ListsController < ApplicationController
  
  def homepage
  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # @list.photo_list.attach(io: @list.photo_list, filename: "list_#{@list.name}_photo", content_type: "image/avif")
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
    # raise
  end

  private

   def list_params
    params.require(:list).permit(:name, :photo_list)
   end
end
