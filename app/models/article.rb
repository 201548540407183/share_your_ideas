class Article < ActiveRecord::Base
  include Bootsy::Container
  #specify a one to one association
  belongs_to :user
  validates  :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates  :description, presence: true, length: { minimum: 10, maximum: 5000 }
  validates  :user_id, presence: true
end
