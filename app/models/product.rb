class Product < ApplicationRecord
	has_many :orders
	has_many :comments
  validates :name,:description, :image_url,:price,:color, presence: true
 

  def average_rating
  comments.average(:rating).to_f
  end

  def highest_rating_comment
   comments.rating_desc.first
  end

  def self.search(search_term)
     if Rails.env.production?
        Product.where("name ilike ?", "%#{search_term}%")
      else
        Product.where("name LIKE ?", "%#{search_term}%")
  end
  

 end

end  

class Product 

  def set_latest_reviewer(user_name)
    $redis.set("lr_product:#{id}","#{user_name}")
  end

  def get_latest_reviewer
    $redis.get("lr_product:#{id}") # this returns the user's first name...
  end
  
  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  end
end  
