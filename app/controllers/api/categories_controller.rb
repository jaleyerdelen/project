module Api
    class CategoriesController < ApplicationController
        
        before_action :set_category, only: %i[update show destroy]

        def index
            @categories = Category.order(created_at: :desc)
            if !@categories.blank?
                render json: @categories, status: :ok
            else 
                render json: @categories, status: :bad_request
            end
        end

        def show
            if !@category.blank?
                render json: @category, status: :ok
            else
                render json: @category, status: :bad_request
            end
        end

        def create
            @category = Category.create(params_category)
            if @category.save
                p "created category"
                render json: @category, status: :ok
            else
                render json: "could't updated", status: :bad_request
            end
        end

        def update
            if @category.update(params_category)
                render json: @category, status: :ok
            else
                render json: "not updated", status: bad_request
            end
        end

        def destroy
            if @category.destroy
                render json: "Deleted category", status: :ok
            else
                render json: "Couldn't category", status: :bad_request
            end
        end

        private # class dışından erişilemez
        
        def set_category
            @category = Category.find(params[:id])
        end

        def params_category
            params.permit(:name)
        end

    end
end
