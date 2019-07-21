module Spree
  module Blog
    class PostsController < Spree::StoreController
      before_action :load_blog

      def index
        @featured_posts = Blog::Post.featured_posts
      end

      def show
        load_post(params[:id])
      end

      private

      def load_blog
        @blog = Blog::Post.recent
      end

      def load_post(id)
        @post = Blog::Post.friendly.find(id)
      end
    end
  end
end
