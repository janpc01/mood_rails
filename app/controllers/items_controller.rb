class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /boards/:board_id/items
  def index
    @items = @board.items
  end

  # GET /boards/:board_id/items/:id
  def show
  end

  # GET /boards/:board_id/items/new
  def new
    @item = @board.items.new
  end

  # GET /boards/:board_id/items/:id/edit
  def edit
  end

  # POST /boards/:board_id/items
  def create
    @item = @board.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@board, @item], notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/:board_id/items/:id
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@board, @item], notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/:board_id/items/:id
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to board_items_path(@board), status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_item
      @item = @board.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:content, :position_x, :position_y, :width, :height, :file, :link)
    end
end
