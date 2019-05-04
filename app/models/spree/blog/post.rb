module Spree
  module Blog
    class Post < Spree::Base
      self.table_name = 'spree_blog_posts'
      extend FriendlyId
      friendly_id :title, slug_column: :slug, use: :slugged
      before_validation :set_permalink, on: :update, if: :title

      scope :published, -> { where published: true }

      validates :title, presence: true

      def set_permalink
        self.slug = title.to_url if slug.blank?
      end
    end
  end
end
