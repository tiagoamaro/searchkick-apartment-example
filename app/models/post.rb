class Post < ActiveRecord::Base
  searchkick
  include SchemaSearchable
end
