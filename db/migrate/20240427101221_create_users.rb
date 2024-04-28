class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :username

      t.timestamps
    end
  end
end

# from eg

# class CreateArticles < ActiveRecord::Migration[5.2]
#   def change
#     create_table :articles do |t|
#       t.string :title
#       t.text :text

#       t.timestamps
#     end
#   end
# end
