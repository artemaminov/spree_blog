module SpreeBlog
  module_function

  # Returns the version of the currently loaded SpreeBlog as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 0
    MINOR = 2
    TINY  = 0
    PRE   = 'beta'.freeze

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
