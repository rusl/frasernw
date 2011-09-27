class Review < ActiveRecord::Base
  def accept
    PaperTrail.whodunnit = User.find
    reify
  end

  def reify(options = {})
    without_identity_map do
      options[:has_one] = 3 if options[:has_one] == true
      options.reverse_merge! :has_one => false

      unless object.nil?
        attrs = YAML::load object

        # Normally a polymorphic belongs_to relationship allows us
        # to get the object we belong to by calling, in this case,
        # +item+.  However this returns nil if +item+ has been
        # destroyed, and we need to be able to retrieve destroyed
        # objects.
        #
        # In this situation we constantize the +item_type+ to get hold of
        # the class...except when the stored object's attributes
        # include a +type+ key.  If this is the case, the object
        # we belong to is using single table inheritance and the
        # +item_type+ will be the base class, not the actual subclass.
        # If +type+ is present but empty, the class is the base class.

        inheritance_column_name = item_type.constantize.inheritance_column
        class_name = attrs[inheritance_column_name].blank? ? item_type : attrs[inheritance_column_name]
        klass = class_name.constantize
        model = klass.new

        attrs.each do |k, v|
          begin
            model.send :write_attribute, k.to_sym , v
          rescue NoMethodError
            logger.warn "Attribute #{k} does not exist on #{item_type} (Version id: #{id})."
          end
        end

        model.send "#{model.class.version_name}=", self

        unless options[:has_one] == false
          reify_has_ones model, options[:has_one]
        end

        model
      end
    end
  end

  def without_identity_map(&block)
    if defined?(ActiveRecord::IdentityMap) && ActiveRecord::IdentityMap.respond_to?(:without)
      ActiveRecord::IdentityMap.without(&block)
    else
      block.call
    end
  end
end
