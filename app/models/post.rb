class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'   #foreign_key and class_name not strictly necessary here if we stuck to convention. from 
                                                                 # convention and say belongs_to 'user' Rails will  expect foreign_key 'user_id' and class name User. So we can just leave out the two parameters

  has_many :comments                                                               
end