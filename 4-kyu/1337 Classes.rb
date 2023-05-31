#===============================================================================================================
#                                               Description
#===============================================================================================================

# Define 1,337 classes, each of which need to have 1 unique class method and 1 unique public instance method, that each return unique values. The names of the methods and the return values can be whatever you wish, so long as they are unique.
#
# Use the leet_classes method to return all of the classes in an array.
#
# An example creating only 2 classes:
#
# lc = leet_classes
# #=> [Klass_0, Klass_1]
#
# klass_0 = lc[0]
# #=> Klass_0
#
# klass_0.unique_class_method
# #=> 'c0'
#
# klass_0.new.unique_instance_method
# #=> 'i0'
#
# klass_1 = lc[1]
# #=> Klass_1
#
# klass_1.unique_class_method
# #=> 'c1'
#
# klass_1.new.unique_instance_method
# #=> 'i1'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def leet_classes
  (1..1337).map{|n| "Klass#{n}"}.map do |name|
    klass = Class.new(Object) do
      define_method("method_for_#{name.downcase}".to_sym) {"m_#{name}"}
      define_singleton_method("method_for_#{name.downcase}".to_sym) {"ms_#{name}"}
    end
    Object.const_set(name, klass)
  end
end
