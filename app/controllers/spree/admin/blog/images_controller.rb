module Spree
  module Admin
    module Blog
      class ImagesController < ResourceController
        create.before :set_viewable
        update.before :set_viewable

        private

        def set_viewable
          @blog_image.viewable_type = 'Spree::Blog::Image'
          @blog_image.viewable_id = params[:blog_image][:viewable_id]
        end

      end
    end
  end
end
