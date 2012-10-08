class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments, :as => :commentable, :dependent => :destroy
end
