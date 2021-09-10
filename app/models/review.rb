class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def print_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{star_rating}. #{comment}"
    end
end