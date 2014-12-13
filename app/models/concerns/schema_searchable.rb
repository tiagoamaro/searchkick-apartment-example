module SchemaSearchable
  extend ActiveSupport::Concern

  module ClassMethods
    def tenant_index_name
      -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
    end
  end
end