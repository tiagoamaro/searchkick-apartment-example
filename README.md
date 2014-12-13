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
5. Create some users. Example: `User.create(name: 'username', database: 'schema')`
6. Create some posts for each user. Example: `Apartment::Tenant.switch('schema'); Post.create(body: 'My Post Body')`
7. Run the `searchkick:reindex_tenants` task
