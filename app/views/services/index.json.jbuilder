if @services.count.positive?
  json.inserted_items render(partial: "services/services", formats: :html, locals: { services: @services, markers: @markers })
else
  json.inserted_items render(partial: "services/services", formats: :html, locals: { services: Service.all, markers: @markers })
end
# json.inserted_items render(partial: "services/map", formats: :html, locals: { markers: @markers })
