class CatalogController < ApplicationController
  def index
  	@super_categories = SuperCategory.find(:all, :order => 'name asc' )
  end
end
