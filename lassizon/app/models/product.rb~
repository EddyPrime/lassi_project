class Product < ApplicationRecord

    #belongs_to :user
    has_many :reviews, dependent: :destroy

    def avg
	if Review.where(product_id: self.id).count > 0
        	Review.where(product_id: self.id).average('value').ceil(2)
	else
		0
	end
    end

    def self.search(search)
        key = "%#{search}%"
        if search
            where('name LIKE ? OR product_type LIKE ?', key, key)
        else
            all
        end
    end

end
