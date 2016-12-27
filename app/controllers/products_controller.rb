class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [ :update]
  # GET /products
  # GET /products.json
  def index

  @products = Product.all.order("created_at DESC")
  current_user=@user
  end

  # GET /products/1
  # GET /products/1.json
  def show
     
  end

  # GET /products/new
  def new
    @product = current_user.products.new 
    @categories = Category.all.map{|c|[c.name, c.id]}
  end

  # GET /products/1/edit
  def edit
    @product= @product.update(product_params)
    @categories = Category.all.map{|c|[c.name,c.id]}
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    @product.category_id=params[:category_id]
    @product.user_id = current_user.id if current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :town, :price, :phone_number, :image)
    end
  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    redirect_to product_path , notice: 'Transaction not authorised.' if @pin.nil
  end
 
end
