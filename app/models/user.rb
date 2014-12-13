class User < ActiveRecord::Base
  validates :database, uniqueness: true, presence: true

  after_create  :create_schema
  after_destroy :destroy_schema

  # Writing Apartment::Tenant every time is kind of boring...
  def self.switch(database)
    Apartment::Tenant.switch(database)
  end

  def switch
    Apartment::Tenant.switch(database)
  end

  private

  def create_schema
    Apartment::Tenant.create(database)
  end

  def destroy_schema
    Apartment::Tenant.drop(database)
  end
end
