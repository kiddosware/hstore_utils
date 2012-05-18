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
end

# include the extension 
Class.send(:include, HstoreUtils)