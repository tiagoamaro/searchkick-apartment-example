namespace :searchkick do
  desc 'Reindex all models on all tenants (using background jobs)'
  task reindex_tenants: :environment do
    Rails.application.eager_load!

    User.pluck(:database).each do |schema|
      Apartment::Tenant.switch schema
      (Searchkick::Reindex.instance_variable_get(:@descendents) || []).each do |model|
        puts "Reindexing #{model.name} on #{schema}"
        Apartment::Tenant.switch schema
        model.reindex
      end
    end
  end
end