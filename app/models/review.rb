class Review < ActiveRecord::Base
  def accept
    who = PaperTrail.whodunnit
    PaperTrail.whodunnit = User.find(whodunnit.to_i)
    item.update_attributes(update_hash)
    PaperTrail.whodunnit = who
    destroy
  end
  
  def update_hash
    changes = {}
    YAML::load(object_changes).each do |k, v|
      changes[k] = v[1]
    end
    changes
  end

  def item
    eval("#{item_type}.find(#{item_id})")
  end

  def reify(options = {})
    without_identity_map do

      unless object.nil?
        attrs = YAML::load object

        if item
          model = item
        else
          inheritance_column_name = item_type.constantize.inheritance_column
          class_name = attrs[inheritance_column_name].blank? ? item_type : attrs[inheritance_column_name]
          klass = class_name.constantize
          model = klass.new
        end

        attrs.each do |k, v|
          begin
            model.send :write_attribute, k.to_sym , v
          rescue NoMethodError
            logger.warn "Attribute #{k} does not exist on #{item_type} (Version id: #{id})."
          end
        end

        model.send "#{model.class.version_name}=", self

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
