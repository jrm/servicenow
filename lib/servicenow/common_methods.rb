module Servicenow
  
  module CommonMethods
    
    def set_state(state)
      return false unless Servicenow::TICKETSTATES.keys.include?(state)
      if i = Incident.update(self.sys_id, {"incident_state" => Servicenow::TICKETSTATES[state], "work_notes" => "State Updated by Solarwinds to: #{state}"})
        i.incident_state && (i.incident_state.to_i == Servicenow::TICKETSTATES[state])
      end
    end

    def get_state(state)
      return false unless Servicenow::TICKETSTATES.keys.include?(state)
      if i = Incident.get(self.sys_id)
        i.incident_state && (i.incident_state.to_i == Servicenow::TICKETSTATES[state])
      end
    end

    def opened_at_date
      opened_at && Date.parse(opened_at).to_date
    end

    def closed_at_date
      closed_at && Date.parse(closed_at).to_date
    end


    def cancel!
      self.set_state(:cancelled)
    end

    def close!
      self.set_state(:closed)
    end

    def resolve!
      self.set_state(:resolved)
    end

    def closed?
      self.get_state(:closed)
    end

    def resolved?
      self.get_state(:resolved)
    end
    
    def formatted
      str = <<-EOS
        Number: %s
        Description: %s
        =====================
      EOS
      str % [number,description]
    end
    
  end
  
end