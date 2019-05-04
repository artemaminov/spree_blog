class AddUpdatedAtToSpreeBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_blog_posts, :updated_at, :datetime
    add_column :spree_blog_posts, :created_at, :datetime
  end
end
