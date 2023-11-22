if @services.count.positive?
  json.inserted_items render(partial: "services/services", formats: :html, locals: { services: @services })
else
  json.inserted_items render(partial: "services/services", formats: :html, locals: { services: Service.all })
end
# json.inserted_items render(partial: "services/map", formats: :html, locals: { markers: @markers })
