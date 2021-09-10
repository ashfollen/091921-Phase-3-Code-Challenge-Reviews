class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews 

    def favorite_product
        favorite = self.reviews.order(star_rating: :desc).first
        favorite.product.name
    end

    def remove_reviews(product)
        bad_reviews = self.reviews.where("product_id = ?", product.id)
        bad_reviews.destroy_all
    end
end