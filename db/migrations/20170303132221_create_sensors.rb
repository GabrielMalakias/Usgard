Hanami::Model.migration do
  change do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :sensors do
      primary_key :id, 'uuid', null: false, default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :name,         String
      column :description,  String
      column :topic,        String
      column :visible,      TrueClass

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
