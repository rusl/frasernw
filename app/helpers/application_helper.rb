module ApplicationHelper
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
  
  def compressed_procedures(specialist)
    output = []
    procedures = specialist.procedures.collect {|p| p.name}
    grouped_procedures = procedures.group_by {|p| p.split(' - ')[0]}
    grouped_procedures.each do |key, value| 
      output << key + "("
      value.each do |value|
        if value.match("#{key} - ")
          output << value.gsub("#{key} - ","")
        end
      end
      output << ")"
    end
    output.join(', ').gsub("(, ","(").gsub(", )", ")").gsub("()","")
  end
  
end
