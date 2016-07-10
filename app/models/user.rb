class User < ActiveRecord::Base
  validates :database, uniqueness: true, presence: true

  after_create  :create_schema
  after_destroy :destroy_schema

  private

  def create_schema
    Apartment::Tenant.create(database)
  end

  def destroy_schema
    Apartment::Tenant.drop(database)
  end
end
