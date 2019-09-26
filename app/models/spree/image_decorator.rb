module SpreeBlog
  module ImageDecorator
    module ClassMethods
      def styles
        @styles = super.merge({
            post: '236',
            hero: '848'
        })
      end
    end

    def self.prepended(base)
      base.inheritance_column = nil
      base.singleton_class.prepend ClassMethods
    end
  end
end

Spree::Image.prepend SpreeBlog::ImageDecorator