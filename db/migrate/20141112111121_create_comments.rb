class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.string :author_name
      t.string :site_url
      t.text :content

      t.timestamps
    end
  end
end
