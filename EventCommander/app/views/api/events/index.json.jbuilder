json.events do
  @events.each do |event|
    json.partial! 'api/events/event', event: event
  end
end
