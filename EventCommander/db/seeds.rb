# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
demo              = User.create!(username: "Demo User", email: "demo@demo.demo", password: "12345678")

demo_event        = Event.create!(user_id: demo.id, title: "Demo Event")

demo_team_one     = Team.create!(event_id: demo_event.id, name: "Demo Team 1")
demo_team_two     = Team.create!(event_id: demo_event.id, name: "Demo Team 2")

task_one          = Task.create!(event_id: demo_event.id, name: "Task one")
task_two          = Task.create!(event_id: demo_event.id, name: "Task two")
task_three        = Task.create!(event_id: demo_event.id, name: "Task three")
task_four         = Task.create!(event_id: demo_event.id, name: "Task four")
task_five         = Task.create!(event_id: demo_event.id, name: "Task five")
task_six          = Task.create!(event_id: demo_event.id, name: "Task six")

detail_one        = Detail.create!(task_id: task_one.id, text: "Detail one")
detail_two        = Detail.create!(task_id: task_one.id, text: "Detail two")
detail_three      = Detail.create!(task_id: task_one.id, text: "Detail three")
detail_four       = Detail.create!(task_id: task_one.id, text: "Detail four")
detail_five       = Detail.create!(task_id: task_one.id, text: "Detail five")
detail_six        = Detail.create!(task_id: task_one.id, text: "Detail six")

TeamMember.create!(email: "member_one@member_one", name: "member_one", team_id: demo_team_one.id)
TeamMember.create!(email: "member_two@member_two", name: "member_two", team_id: demo_team_one.id)
TeamMember.create!(email: "member_three@member_three", name: "member_three", team_id: demo_team_one.id)
TeamMember.create!(email: "member_four @member_four ", name: "member_four ", team_id: demo_team_two.id)
TeamMember.create!(email: "member_five @member_five ", name: "member_five ", team_id: demo_team_two.id)
TeamMember.create!(email: "member_six@member_six", name: "member_six", team_id: demo_team_two.id)

DetailAssignment.create!(team_id: demo_team_one.id, detail_id: detail_one.id)
DetailAssignment.create!(team_id: demo_team_two.id, detail_id: detail_two.id)
DetailAssignment.create!(team_id: demo_team_one.id, detail_id: detail_three.id)
DetailAssignment.create!(team_id: demo_team_two.id, detail_id: detail_three.id)
DetailAssignment.create!(team_id: demo_team_one.id, detail_id: detail_four.id)
DetailAssignment.create!(team_id: demo_team_two.id, detail_id: detail_five.id)
DetailAssignment.create!(team_id: demo_team_one.id, detail_id: detail_six.id)