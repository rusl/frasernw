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
    
    def procedures_investigations_grouped(specialist)
        procedures = specialist.capacities.collect {|c| c.investigation.presence ? c.procedure.name + " (requires " + c.investigation + ")": c.procedure.name}
        procedures.group_by {|p| p.split(' - ')[0]}  
    end
    
    def procedures_investigations_list(specialist)
        output = ["<ul class='procedure'>"]
        procedures_investigations_grouped(specialist).each do |key,values|
            if not (key == values[0])
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
