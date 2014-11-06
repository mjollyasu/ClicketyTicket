module OrdersHelper
    
    def tickets_left(event)
        ordered = sum(Order.where(:event_id == event.id).all.tickets_purchased)
        event.total_tickets - ordered
    end
    
end
