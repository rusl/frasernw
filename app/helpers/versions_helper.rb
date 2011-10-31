module VersionsHelper
  def whodunnit_name(version)
     # ? User.find(version.whodunnit).username : 'unknown'
    if version.whodunnit.to_i.to_s == version.whodunnit
      name_for(User.find(version.whodunnit))
    elsif version.whodunnit == "MOA"
      version.whodunnit
    else
      'unknown'
    end
  end

  def activity_badge(version)
    klass = version.item_type.downcase
              .gsub('attachment', 'file')
              .gsub('privilege', 'hospital privileges')
              .gsub('procedure', 'area of practise')
              .gsub('capacity', 'area of practise')
              .gsub('office', 'office details')
    content_tag :span, class: ["type", klass] do
      klass.titlecase
    end
  end
  
  def link_to_item(version)
    begin
      case version.item_type
      when "Specialist"
        if version.event == "create"
          link_to version.item.name, specialist_path(version.item_id)
        elsif version.event == "update"
          link_to version.reify.name, specialist_path(version.item_id)
        else
          link_to version.reify.name, show_version_path(version)
        end
      when "Privilege", "Capacity", "Office"
        if version.event == "create"
          link_to version.item.specialist.name, specialist_path(version.item.specialist)
        elsif %w(update destroy).include? version.event
          link_to version.reify.specialist.name, specialist_path(version.reify.specialist)
        end
      when "Procedure"
        if version.event == "create"
          link_to version.item.name, procedure_path(version.item_id)
        elsif version.event == "update"
          link_to version.reify.name, specialist_path(version.item_id)
        end
      when "Hospital"
        if version.event == "create"
          link_to version.item.name, hospital_path(version.item_id)
        elsif %w(update destroy).include? version.event
          link_to version.reify.name, hospital_path(version.item_id)
        end
      when "Clinic"
        if version.event == "create"
          link_to version.item.name, clinic_path(version.item_id)
        elsif version.event == "update"
          link_to version.reify.name, clinic_path(version.item_id)
        end
      when "Specialization"
        if version.event == "create"
          link_to version.item.name, specialization_path(version.item_id)
        elsif version.event == "update"
          link_to version.reify.name, specialization_path(version.item_id)
        end
      end
    rescue
      "This item was deleted after this change was made."
    end
  end
  
  def association_details(version)
    case version.item_type
    when "Privilege"
      if version.event == "create"
        version.item.hospital.name
      elsif %w(update destroy).include? version.event
        version.reify.hospital.name
      end
    when "Capacity"
      if version.event == "create"
        version.item.procedure.name
      elsif %w(update destroy).include? version.event
        version.reify.procedure.name
      end
    end
  end
end
