class Review < ApplicationRecord

    belongs_to :product, :class_name => "Product", :foreign_key => "product_id", optional: true
    belongs_to :user, :class_name => "User", :foreign_key => "user_id", optional: true

end
