class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps  # para que cree automaticamente los campos de fecha de creacion y de modificacion
    end
  end
end
