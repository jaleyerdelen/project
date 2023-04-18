module Api
class ProductsController < ApplicationController
    def index
        @products = Product.where(name:"laptop").order(created_at: :asc)
        render json: @products
    end

    before_action :set_product, only: %i[update show destroy] # sadece bu methodlarda çalış

    def show
        image = rails_blob_url(@product.product_image) #active storage'da tuttuğumuz datayı getirir
        render json: { "image": image, "data": @product }
    end

    def create
        @product = Product.create(product_params)
        @product.save
        render json: @product
    end

    def update
        @product.update(product_params)
        render json: @product
    end

    def destroy
        @product.destroy
        render json: "Deleted"
    end

    def set_product # before action sayesinde ilk burası çalışacak ve datadan id'si olanları getirecek. 
        @product = Product.find(params[:id])
    end


    def product_params
        params.permit(:name, :description, :quantity, :price, :product_image) # sadece burada yazdığımız dataları alır başka datalara izin vermez
    end
end
end
