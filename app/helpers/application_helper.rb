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
    puts 'yyyyyyyy ' + specialist.procedures.to_s
    p = specialist.procedures.to_a
    p.map! {|i| i.name }
    p.sort!
    p.map! {|i| i.split ' -'}
    puts 'xxxxxxxx ' + p.to_s
    current = p.first.first
    p.each_with_index do |item, idx|
      puts "item = #{item} idx = #{idx}"
      if item.length == 1
        p[idx] = item.first
      else
        if terms.first == p[idx-1].first
          if p[idx-1].to_s.match(/\)$/)
            p[idx-1] = p[idx-1].gsub(")", ",#{terms.last})")
            p[idx] = nil
            p.compact!
          else
            p[idx-1] = p[idx-1].to_s + " (#{terms.last})"
            p[idx] = nil
            p.compact!
          end
        end
      end
    end
    p.compact!
    # p.reject! {|item| item != nil }
  end

  
end
