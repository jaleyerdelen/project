module Api
class ProductsController < ApplicationController
    
    def index
        @products = Product.where(name:"laptop").order(created_at: :asc)
        render json: @products
    end

    def show
        @product = Product.find(params[:id])
        image = rails_blob_url(@product.product_image) #active storage'da tuttuğumuz datayı getirir
        render json: { "image": image, "data": @product }
    end

    def create
        @product = Product.create(product_params)
        @product.save
        render json: @product
    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        render json: @product
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        render json: "Deleted"
    end

    def product_params
        params.permit(:name, :description, :quantity, :price, :product_image) # sadece burada yazdığımız dataları alır başka datalara izin vermez
    end
end
end
