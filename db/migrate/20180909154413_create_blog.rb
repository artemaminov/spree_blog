class CreateBlog < SpreeExtension::Migration[5.2]
  def change
    create_table :spree_blogs do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.string :hero_image
      t.string :slug
      t.boolean :featured
    end
  end
end
