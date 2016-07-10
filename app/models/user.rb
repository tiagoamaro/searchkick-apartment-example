class User < ActiveRecord::Base
  validates :database, uniqueness: true, presence: true
end
