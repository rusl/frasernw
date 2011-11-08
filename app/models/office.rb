class Office < ActiveRecord::Base
    belongs_to :specialist
    has_paper_trail
    
    def exists?
        return (address1.presence or address2.presence or city.presence or province.presence or postalcode.presence or phone1.presence or fax.presence)
    end
    
    def full_address
        if address1.presence and address2.presence
            full_address = address2 + " - " + address1
        elsif address1.presence
            full_address = address1
        elsif address2.presence
            full_address = address2
        end
        
        if city.presence
            full_address = full_address.presence ? full_address + ", " + city : city
        end
        
        if province.presence
            full_address = full_address.presence ? full_address + ", " + province : province
        end
        
        if postalcode.presence
            full_address = full_address.presence ? full_address + ", " + postalcode : postalcode
        end
        
        return full_address
    end
    
end
