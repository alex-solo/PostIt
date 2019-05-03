class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'   #foreign_key and class_name not strictly necessary here if we stuck to convention. from 
                                                                 # convention and say belongs_to 'user' Rails will  expect foreign_key 'user_id' and class name User. So we can just leave out the two parameters

  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable # on the votes table, there is no post_id FK, but instead voteable_type and voteable_id

  validates :title, presence: true, length: {minimum: 5}                                                      
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end
end