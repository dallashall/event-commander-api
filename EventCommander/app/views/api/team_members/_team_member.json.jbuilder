json.set! team_member.id do
  json.id team_member.id
  json.team_id team_member.team_id
  json.name team_member.name
  json.email team_member.email
  json.single_use_token team_member.single_use_token
end
