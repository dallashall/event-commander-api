json.details do
  @details.each do |detail|
    json.partial! 'api/details/detail', detail: detail
  end
end
