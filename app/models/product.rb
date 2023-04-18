class Product < ApplicationRecord

    after_create :send_notification
    
    has_one_attached :product_image
    
    # precence:true boş olamaz demektir.
    #validates :name, presence: true, length: { minimum: 2, maximum: 10 }
    #validates :description, presence: true, length: { minimum: 5, maximum: 250 }
    validates :quantity, presence: true, numericality: { grater_than_or_equals: 0, less_than:100 }
    validates :price, presence: true, numericality: { grater_than: 0 }
    #validate :name_start_with_a

    # custom validation
    def name_start_with_a
        if !self.name.start_with?("A")
            errors.add(:name, "must start with the letter A")
        end

    end

    def send_notification
        p  "Send mail or notification if added new product to all users"
    end
end
