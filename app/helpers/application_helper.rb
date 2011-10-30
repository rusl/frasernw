module ApplicationHelper  
  def name_for(user)
    unless user.name.blank?
      if user.name.split(' ').length > 1
        user.name.split[0] + ' ' + user.name.split[1][0,1] + '.'
      else
        user.name
      end
    else
      user.login
    end
  end
  
  def listed_specialist(specialist)
    "#{specialist.firstname} #{specialist.lastname} - #{specialist.city}"
  end
  def listed_procedure(procedure)
    "#{procedure.name} (#{procedure.specialists.length})"
  end
  
  def specialists_procedures(specialist)
    list = ""
    specialist.procedures.each do |procedure|
      list += procedure.name + (specialist.procedures.last == procedure ? '' : ", ")
    end
    list
  end
  
  alias :clinics_procedures :specialists_procedures
  
  def grouped_procedures(specialist)
    procedures = specialist.procedures.collect {|p| p.name}
    procedures.group_by {|p| p.split(' - ')[0]}  
  end
  
  def compressed_procedures(specialist)
    output = []
    grouped_procedures(specialist).each do |key, values|
      output << key + "("
      values.each do |value|
        if value.match("#{key} - ")
          output << value.gsub("#{key} - ","")
        end
      end
      output << ")"
    end
    output.join(', ').gsub("(, ","(").gsub(", )", ")").gsub("()","").gsub(/\([G|g]eneral\)/,'')
  end
  
  def compressed_procedures_indented(specialist)
    output = ["<ul class='procedure'>"]
    grouped_procedures(specialist).each do |key,values|
      if values.length > 1
        output << "<li>#{key}</li>"
        output << "<ul>"
        values.each do |value|
          if value.match("#{key} - ")
            output << "<li>" + value.gsub("#{key} - ","") + "</li>"
          end
        end
        output << "</ul>"
      else
        output << "<li>#{key}</li>"
      end
    end
    output << "</ul>"
    output.join()
  end
  
  def compressed_clinics(clinics)
    output = ''
    clinics.each do |clinic|
      output += (clinic.name + ', ')
    end
    output.gsub(/\,\ $/,'')
  end
  
end
