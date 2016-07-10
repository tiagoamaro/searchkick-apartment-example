namespace :searchkick do
  desc 'Reindex all models on all tenants'
  task reindex_tenants: :environment do
    Rails.application.eager_load!

    Apartment::Tenant.each do |schema|
      Apartment::Tenant.switch!(schema)
      Searchkick.models.each do |model|
        puts "Reindexing #{model.name} on #{schema}"
        model.reindex
      end
    end
  end
end
