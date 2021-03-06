class BrandsController < ApplicationController
  # GET /brands
  # GET /brands.json
  before_filter :is_admin, :only => [:index, :edit, :destroy]


  def index
    @brands = Brand.all

  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.search(params[:search]).paginate(:page => params[:product_page], :per_page => 3)
    @comment = Comment.new(:brand_id => @brand.id)
    @comments = @brand.comments.paginate(:page => params[:comment_page], :per_page => 5) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.json
  def create

  @brand = Brand.find_by_name(params[:brand][:name])

  if @brand
    @brand.category_ids = @brand.category_ids << params[:brand][:category_ids]
  else
    @brand = Brand.create(params[:brand])
  end


    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end
end
