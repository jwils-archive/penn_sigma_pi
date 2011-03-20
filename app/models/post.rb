class Post < ActiveRecord::Base
  belongs_to :person
  has_many :comments
end
