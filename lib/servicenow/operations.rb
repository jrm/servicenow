module Servicenow

  module Operations
    
    def self.included(base)
      base.extend(ClassMethods)    
    end
    
    module ClassMethods
  
      def get(sys_id)
        if result = super(:message => {"sys_id" => sys_id})
          new(result.body[:get_response])
        end
      end

      def get_records(query)
        if result = super(:message => query)
          if result.body[:get_records_response] && records = result.body[:get_records_response][:get_records_result]
            [records].flatten.collect {|r| new(r) }
          else
            []
          end
        end
      end
      
      def aggregate(query)
        if result = super(:message => query)
          if result.body[:aggregate_response] && result.body[:aggregate_response][:aggregate_result]
            result.body[:aggregate_response][:aggregate_result]
          else
            nil
          end
        end
      end
    
      def count_records(query)
        if result = get_keys(:message => query)
          if result.body[:get_keys_response] && result.body[:get_keys_response][:count]
            result.body[:get_keys_response][:count].to_i
          else
            nil
          end
        end
      end

      def get_record(query)
        if records = self.get_records(query)
          records.first
        end
      end

      def insert(record)
        record.merge!("u_ticket_type" => "Incident")
        if result = super(:message => record)
          get(result.body[:insert_response][:sys_id])
        end
      end

      def update(sys_id,record)
        if result = super(:message => record.merge({"sys_id" => sys_id}))
          get(result.body[:update_response][:sys_id])
        end
      end
  
    end
    
  end
  
end
