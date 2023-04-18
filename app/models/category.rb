class Category < ApplicationRecord
    after_save :after_saved_method
    before_save :before_saved_method
    before_destroy :before_destroy

    def after_saved_method
    p "after save is running"
    end

    def before_saved_method
        p "before save is running"
    end 

    def before_destroy
        p "before destroy is running"
    end

end
