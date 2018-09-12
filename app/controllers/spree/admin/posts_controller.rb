module Spree
  module Admin
    class PostsController < ResourceController
      def index
        @posts = Spree::Post.all
      end

      def new
        @blog_post = Post.new
      end

      def create
      end

      def edit
      end

      def update
      end

      def destroy
      end
    end
  end
end
