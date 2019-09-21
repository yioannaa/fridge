class ProductsController < ApplicationController
  before_action :set_product, only: [ :edit, :update, :destroy, :buy]

  # GET /products
  # GET /products.json
  def index
    @products_fridge = Product.where(bought: true)
@products_todo = Product.where(bought: false)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'Pyszne żarcie! Dobry plan!.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
notice = if @product.bought? then 
"Na zdrowie!"
else
"No trudno"
end
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: notice }
      format.json { head :no_content }
    end
  end

  # BUY products/1
   def buy 
@product.bought =  true
@product.save
redirect_to products_url, notice: 'Będzie pysznie :D.'

  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name)
    end
end
