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

# Match.destroy_all
# Club.destroy_all
# Player.destroy_all
# User.destroy_all
# Review.destroy_all
# Like.destroy_all

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# MATCH

@url = 'https://apiv2.apifootball.com/?action=get_events&from=2019-03-01&to=2019-04-03&league_id=149&APIkey=e0016868dad7c64640a7d97598c1d660454dc1eb831bc7c12b2e33fc503bc4e9'

@response = RestClient.get(@url)
@body = @response.body 
@m_array = JSON.parse(@body)

 binding.pry
@m_array.each do |beef|
   
    Match.create(
        date: beef["match_date"],
        status: beef["match_status"],  
        home_scorer: beef["goalscorer"]["home_scorer"],
        away_scorer: beef["goalscorer"]["home_scorer"],
        home_team_score: beef["match_hometeam_score"],
        away_team_score: beef["match_awayteam_score"],
        home_team_name: beef["match_hometeam_name"],
        away_team_name: beef["match_awayteam_name"] 
        
        )
    end 

     







#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#PLAYER

# rm = RestClient.get `https://apiv2.apifootball.com/?action=get_teams&league_id=148&APIkey=e0016868dad7c64640a7d97598c1d660454dc1eb831bc7c12b2e33fc503bc4e9`

# rm_array = JSON.parse(rm)["players"]

# rm_array.each do |player|
# Player.create(
#     name: player["player_name"],
#     number: player["player_number"],
#     type: player["player_type"],
#     country: player["player_country"],
#     age: player["player_age"],
#     match: 
#     club: 
# )
# end