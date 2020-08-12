class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
        # instance_variable_set("@#{name}=", arg)
        # @name = arg
      end
      define_method("#{name}=") do |arg|
        # new_name = "#{name}="
        instance_variable_set("@#{name}", arg)
      end
    end 
  end
end
