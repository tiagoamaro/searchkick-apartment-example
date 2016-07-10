class User < ActiveRecord::Base
  validates :database, uniqueness: true, presence: true

  def self.switch(schema)
    Apartment::Tenant.switch!(schema)
  end
end
