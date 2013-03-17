require 'will_paginate/array'
class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  before_filter :is_admin, :only => [:index, :destroy]

  def index
    @products = Product.all

    respond_to do |format|
      @products = @products.paginate(:page => params[:page], :per_page => 10)
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @comment = Comment.new(:product_id => @product.id)
    @comments = @product.comments    


    respond_to do |format|
      @comments = @comments.paginate(:page => params[:page], :per_page => 5)      
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new(:brand_id => @brand.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
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
    @brand = Brand.find_by_id(params[:product][:brand_id])
    @category = Category.find_by_id(params[:product][:category_id])

    #The category always must have this brand (not always belongs to that category when we create the product)
    unless @category.brand_ids.include?(@brand.id)
      @brand.category_ids = @brand.category_ids << @category.id
    end

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.' 
    else
      render action: "new" 
    end
  end
  

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
