# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

require 'pry'

require 'json'

Match.destroy_all
Club.destroy_all
Player.destroy_all
User.destroy_all
Review.destroy_all
Like.destroy_all

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# MATCH

@url = 'https://apiv2.apifootball.com/?action=get_events&from=2019-03-01&to=2019-04-03&league_id=149&APIkey=e0016868dad7c64640a7d97598c1d660454dc1eb831bc7c12b2e33fc503bc4e9'

@response = RestClient.get(@url)
@body = @response.body 
@m_array = JSON.parse(@body)

# byebug
#  binding.pry
@m_array.each do |beef|
    Match.create(
        date: beef["match_date"],
        status: beef["match_status"],  
        home_team_score: beef["match_hometeam_score"],
        away_team_score: beef["match_awayteam_score"],
        home_team_name: beef["match_hometeam_name"],
        away_team_name: beef["match_awayteam_name"],
        home_team_system: beef["match_hometeam_system"],
        away_team_system: beef["match_awayteam_system"],
        home_team_badge: beef["team_home_badge"],
        away_team_badge: beef["team_away_badge"]
        )
    end 




    # binding.pry
    #--------------------------------------------------------------------------------------------------------------------------------------------------------------------




    #----------------------------------------------------------------------------------------------------------------------------------------------------------------




    url ='https://apiv2.apifootball.com/?action=get_teams&league_id=148&APIkey=e0016868dad7c64640a7d97598c1d660454dc1eb831bc7c12b2e33fc503bc4e9'

    
   response = RestClient.get(url)
    body = response.body 
    m_array = JSON.parse(body)

    m_array.each do |beef|

      Club.create!(
        name: beef["team_name"],
        badge: beef["team_badge"]
      )

    end 


#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#PLAYER
# byebug 
r = 'https://apiv2.apifootball.com/?action=get_teams&league_id=148&APIkey=e0016868dad7c64640a7d97598c1d660454dc1eb831bc7c12b2e33fc503bc4e9'
res = RestClient.get(r)
bod = res.body 

# @response = RestClient.get(@url)
# @body = @response.body 
# @m_array = JSON.parse(@body)

rm_array = JSON.parse(bod)[0]["players"]
# binding.pry
rm_array.each do |player|
Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
)
end

ri_array = JSON.parse(bod)[1]["players"]

ri_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 

rt_array = JSON.parse(bod)[2]["players"]

rt_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 

rp_array = JSON.parse(bod)[3]["players"]

rp_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 

rf_array = JSON.parse(bod)[4]["players"]

rf_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 


rb_array = JSON.parse(bod)[5]["players"]

rb_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 

ry_array = JSON.parse(bod)[6]["players"]

ry_array.each do |player|
  Player.create(
    name: player["player_name"],
    number: player["player_number"],
    country: player["player_country"],
    kind: player["player_type"],
    age: player["player_age"],
    club_id: Club.all.sample.id,
    match_id: Match.all.sample.id
  )

end 



# byebug

User.create(name: "yahya", password: 12, club_id: Club.all.sample.id)
User.create(name: "mert", password: 1, club_id: Club.all.sample.id)
User.create(name: "john", password: 123, club_id: Club.all.sample.id)

Review.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Review.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Review.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Review.create(user_id: User.all.sample, player_id: Player.all.sample.id)

Like.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Like.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Like.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)
Like.create(user_id: User.all.sample.id, player_id: Player.all.sample.id)






