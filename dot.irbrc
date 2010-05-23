require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

class Object
   def local_methods
      (methods - Object.instance_methods).sort
   end

   # Thanks _why

   # The hidden singleton lurks behind everyone
   def metaclass; class << self; self; end; end
   def meta_eval &blk; metaclass.instance_eval &blk; end

   # Adds methods to a metaclass
   def meta_def name, &blk
     meta_eval { define_method name, &blk }
   end

   # Defines an instance method within a class
   def class_def name, &blk
     class_eval { define_method name, &blk }
   end
end


def bench(count=100, &block)
   require 'benchmark'

   Benchmark.bmbm do |b|
      b.report { count.times &block }
   end

   nil
end
