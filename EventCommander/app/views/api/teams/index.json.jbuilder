json.teams do
  @teams.each do |team|
    json.partial! team: team
  end
end
