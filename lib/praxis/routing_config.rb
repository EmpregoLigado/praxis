module Praxis
  class RoutingConfig

    attr_reader :routes
    attr_reader :version
    attr_reader :base

    def initialize(version:'n/a'.freeze, base: '', prefix:[], &block)
      @version = version
      @base = base
      @prefix_segments = Array(prefix)

      @routes = []

      if block_given?
        instance_eval(&block)
      end
    end

    def clear!
      @prefix_segments = []
    end

    def prefix(prefix=nil)
      return @prefix_segments.join.gsub('//','/') if prefix.nil?

      case prefix
      when ''
        @prefix_segments = []
      when ABSOLUTE_PATH_REGEX
        @prefix_segments = Array(prefix[1..-1])
      else
        @prefix_segments << prefix
      end
    end

    def options(path, opts={}) add_route 'OPTIONS', path, opts end
    def get(path, opts={})     add_route 'GET',     path, opts end
    def head(path, opts={})    add_route 'HEAD',    path, opts end
    def post(path, opts={})    add_route 'POST',    path, opts end
    def put(path, opts={})     add_route 'PUT',     path, opts end
    def delete(path, opts={})  add_route 'DELETE',  path, opts end
    def trace(path, opts={})   add_route 'TRACE',   path, opts end
    def connect(path, opts={}) add_route 'CONNECT', path, opts end
    def patch(path, opts={})   add_route 'PATCH',   path, opts end
    def any(path, opts={})     add_route 'ANY',     path, opts end

    ABSOLUTE_PATH_REGEX = %r|^//|

    def add_route(verb, path, options={})
      unless path =~ ABSOLUTE_PATH_REGEX
        path = prefix + path
      end

      path = (base + path).gsub('//','/')
      mustermann_options = {ignore_unknown_options: true}
      # Reject our own options
      possible_mustermann_options = options.reject{|(k,_)| [:name].include?(k) }
      pattern = Mustermann.new(path, mustermann_options.merge( possible_mustermann_options ))
      route = Route.new(verb, pattern, version, **options)
      @routes << route
      route
    end

  end
end
