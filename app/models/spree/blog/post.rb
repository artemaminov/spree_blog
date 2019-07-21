module Spree
  module Blog
    class Post < Spree::Base
      self.table_name = 'spree_blog_posts'

      has_one :hero_image, -> { where(viewable_type: 'Spree::Blog::HeroImage').order(:position) }, foreign_key: :viewable_id, foreign_type: :viewable_type, dependent: :destroy, class_name: 'Spree::Blog::Image'
      has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: 'Spree::Blog::Image'

      accepts_nested_attributes_for :hero_image, :images

      extend FriendlyId
      friendly_id :title, slug_column: :slug, use: :slugged

      scope :published, -> { where published: true }
      scope :recent, -> { published.order(:updated_at).limit(5) }
      scope :featured_posts, -> { published.limit(5).where featured: true }

      before_validation :set_permalink, on: :create, if: :title
      validates :title, presence: true
      validates :slug, uniqueness: true

      def set_permalink
        self.slug = title.to_url if slug.blank?
      end
    end
  end
end
