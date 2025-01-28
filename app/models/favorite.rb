class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :book
  
  validates :user_id, uniqueness: {scope: :book_id}
  
  after_create do
    create_notification(user_id: book.user_id)
  end
  
  
end
