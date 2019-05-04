module Spree
  module Blog
    class PostsController < Spree::StoreController
      before_action :load_blog

      def index

      end

      def show
        load_post(params[:id])
      end

      private

      def load_blog
        @blog = Blog::Post.published
      end

      def load_post(id)
        @post = Blog::Post.friendly.find(id)
      end
    end
  end
end
