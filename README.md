# Searchkick Apartment Example

This Rails project is an example of how you could use the Searchkick with the Apartment gem.

The important files here are:

- The `schema_searchable.rb` concern
- and the `searchkick_index.rake` Rake task

## Running the example

1. Clone this project
2. Bundle install it
3. Change the `database.yml` file (here I'm using Postgres)
4. Run elastic search
5. Run Rails' seeds command (`rake db:seed`)
  1. For more details, check the `db/seeds.rb` file
  2. This will create Nick and Daniela's users and some posts on their databases
6. Run the `rake searchkick:reindex_tenants` task
7. Now you can search through `Post.search` based on a multi tenant approach:

```ruby
Apartment::Tenant.switch('daniela_db')
Post.search('Searchkick').count
# => 1
``
