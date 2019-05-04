module Spree
  module Admin
    module Blog
      class PostsController < ResourceController
        #
        # def index
        #   session[:return_to] = request.url
        #   respond_with(@collection)
        # end
        #
        # def new
        #   # @post = Spree::BlogPost.new
        # end
        #
        # def create
        #   byebug
        #   Spree::Blog::Post.create(blog_post_params)
        # end
        #
        # def edit
        #
        # end
        #
        # def update
        # end
        #
        # def destroy
        # end
        #
        # private
        #
        # def blog_post_params
        #   params.require(:blog_post).permit(:title, :content, :slug, :published, :featured)
        # end
        #
        protected

        def collection
          return @collection if @collection.present?
          params[:q] ||= {}
          params[:q][:published] ||= '1'
          params[:q][:featured] ||= '1'

          params[:q][:s] ||= 'title asc'
          @collection = super
          # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
          # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
          if params[:q][:deleted_at_null] == '0'
            @collection = @collection.with_deleted
          end
          # @search needs to be defined as this is passed to search_form_for
          # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
          # This is to include all products and not just deleted products.
          @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
          @collection = @search.result.
              # distinct_by_blog_post_ids(params[:q][:s]).
              # includes(product_includes).
              page(params[:page]).
              per(params[:per_page] || Spree::Config[:admin_products_per_page])
          @collection
        end

        # Override ResourceController#find_resource
        def find_resource
          if parent_data.present?
            parent.send(controller_name).friendly.find(params[:id])
          else
            model_class.friendly.find(params[:id])
          end
        end

      end
    end
  end
end
