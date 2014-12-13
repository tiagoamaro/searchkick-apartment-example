module SchemaSearchable
  extend ActiveSupport::Concern

  included do |base|
    base.instance_eval do
      def searchkick_index
        index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
        Searchkick::Index.new(index_name)
      end
    end
  end
end