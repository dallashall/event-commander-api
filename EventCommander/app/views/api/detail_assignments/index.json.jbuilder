json.detail_assignments do
  @detail_assignments.each do |detail_assignment|
    json.partial! 'api/detail_assignments/detail_assignment', detail_assignment: detail_assignment
  end
end
