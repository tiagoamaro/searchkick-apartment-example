class Post < ActiveRecord::Base
  include SchemaSearchable

  searchkick index_name: tenant_index_name
end
