class ProductsController < ApplicationController

  def update_shopping_cart
    str = params[:message]
    logger.debug "WEBON DE MIERDA: #{str}"

    products_array = str.split('|')

    session[:products].each do |session_product|
      products_array.each do |pa|
        values = pa.split(',')
        id = values[0]
        qty = values[1]

        if id.to_i == session_product.id
          session_product.quantity = qty.to_i
          break
        end

      end
    end


    # Set the modified quantity by the user to the session
    #session[:products].each do |session_product|
    #  product_array.each do |pa|
    #    if pa == session_product.id
    #      session_product.quantity = pa.quantity
    #      logger.debug 'ENTRO GARCA D MIERDA'
    #      break
    #    end
    #  end
    #end

    # Redirect to shopping_cart
    redirect_to '/products/show_shopping_cart'

  end

  def update_item
    logger.debug "PARAM ID: #{params[:id].to_s}"
    logger.debug "PARAM QTY: #{params[:quantity].to_s}"

    session[:products].each do |session_product|
      if session_product.id.to_s == params[:id].to_s
        logger.debug "ENTRO WEBON"
        logger.debug "ANTES :#{session_product.quantity}"
        logger.debug "VALOR: #{params[:quantity].to_i}"
        session_product.quantity = params[:quantity].to_i
        logger.debug "DESPUES :#{session_product.quantity}"
        break
      end
    end

    # Redirect to shopping_cart
    redirect_to '/products/show_shopping_cart'
  end

  def delete_item
    @product = nil
    logger.debug "Size before: #{session[:products].length}"
    logger.debug "Param ID: " + params[:id].to_s
    session[:products].each do |p|
      logger.debug "Each ID: " + p.id.to_s
      if p.id.to_s == params[:id]
        @product = p
        
        break
      end
    end

    # Delete the selected item
    session[:products].delete(@product)

    logger.debug "Size after: #{session[:products].length}"

    # Redirect to shopping_cart
    redirect_to '/products/show_shopping_cart'

  end

  def add_item

    # Create the shopping cart array
    if session[:products].nil?
      session[:products] = []
    end

    # Get the product
    @product = Product.find(params[:id])

    # Add one product by default
    @product.quantity = 1

    session[:products] << @product

    # Redirect to shopping_cart
    redirect_to '/products/show_shopping_cart'
  end

  def show_shopping_cart

    @items = session[:products]

    # Redirect
    respond_to do |format|
      format.html # shopping_cart.html.erb
    end

  end

  def list
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
