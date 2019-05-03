class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true

  validates :user_id, uniqueness: {scope: [:voteable_id, :voteable_type]}
  # can also write: validate_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end