class CreateBlogPost < SpreeExtension::Migration[5.2]
  def change
    create_table :spree_blog_posts do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.string :hero_image
      t.string :slug
      t.boolean :featured
    end
  end
end
