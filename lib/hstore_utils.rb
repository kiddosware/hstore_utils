require "hstore_utils/version"

module HstoreUtils
  def hstore_accessor(*args)
    hstore_field = args[0]
    args[1..-1].each do |key|
      attr_accessible key
      #scope "has_#{key}", lambda { |value| where("#{hstore_field} @> (? => ?)", key, value) }

      define_method(key) do
        send(hstore_field) && eval("#{hstore_field}[\"#{key}\"]")
      end

      define_method("#{key}=") do |value|
        self.send("#{hstore_field}=", (self.send(hstore_field) || {}).merge(key.to_s => value))
      end
    end
  end
  
  def hstore_iarray_accessor(*args)
    hstore_field = args[0]
    args[1..-1].each do |key|
      attr_accessible key
      #scope "has_#{key}", lambda { |value| where("#{hstore_field} @> (? => ?)", key, value) }

      define_method("#{key}=") do |value|
        self.send("#{hstore_field}=", (self.send(hstore_field) || {}).merge(key.to_s => value))
      end

      define_method(key) do
        if send(hstore_field)
          value = eval("#{hstore_field}[\"#{key}\"]")
          if (value.class.to_s == "String")
            #hstore stores values as strings but in this case we have an array of ints as a string, so we have to convert it (without using eval!)
            value = value[1..-2].split(',').map {|s| s.to_i}
            return self.send("#{key}=", value)
          end
          return value
        end
      end

      
    end
  end
end

# include the extension 
Class.send(:include, HstoreUtils)