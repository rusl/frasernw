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
      list += procedure.name + " "
    end
    list
  end
  
end
