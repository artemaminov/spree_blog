module SpreeBlog
  module ImageDecorator
    module ClassMethods
      def styles
        {
            mini:    '48x48>',
            small:   '100x100>',
            product: '240x240>',
            large:   '600x600>',
            hero_image: '500x100'
        }
      end
    end

    def self.prepended(base)
      base.singleton_class.prepend ClassMethods
    end
  end
end

Spree::Image.prepend SpreeBlog::ImageDecorator