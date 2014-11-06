json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :event_id, :tickets_purchased
  json.url order_url(order, format: :json)
end
