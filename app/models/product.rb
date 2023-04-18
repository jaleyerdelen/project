class Product < ApplicationRecord

    after_create :send_notification
    
    has_one_attached :product_image

    def send_notification
        p  "Send mail or notification if added new product to all users"
    end
end
