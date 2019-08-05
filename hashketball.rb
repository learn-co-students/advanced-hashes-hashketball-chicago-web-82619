require 'pry'
# Write your code here!

def game_hash

{
  home: {
    team_name: "Brooklyn Nets",
# colors key points to an array of strings that are team's colors
    colors: ["Black", "White"], 
    players: [{
      "Alan Anderson": {
        number: [0],
        shoe: [16],
        points: [22],
        rebounds: [12],
        assists: [12],
        steals: [3],
        blocks: [1],
        slam_dunks: [1]
      },
      "Reggie Evans": {
        number: [30],
        shoe: [14],
        points: [12],
        rebounds: [12],
        assists: [12],
        steals: [12],
        blocks: [12],
        slam_dunks: [7]
      },
      "Brook Lopez":{
        number: [11],
        shoe: [17],
        points: [17],
        rebounds: [19],
        assists: [10],
        steals: [3],
        blocks: [1],
        slam_dunks: [15]
      },
      "Mason Plumlee": {
        number: [1],
        shoe: [19],
        points: [26],
        rebounds: [11],
        assists: [6],
        steals: [3],
        blocks: [8],
        slam_dunks: [5]
      },
      "Jason Terry": {
        number: [31],
        shoe: [15],
        points: [19],
        rebounds: [2],
        assists: [2],
        steals: [4],
        blocks: [11],
        slam_dunks: [1]
      }
      }]
    },
  away: {
    team_name: "Charlotte Hornets",
# colors key points to an array of strings that are team's colors
    colors: ["Turquoise", "Purple"], 
    players: [{
      "Jeff Adrien": {
        number: [4],
        shoe: [18],
        points: [10],
        rebounds: [1],
        assists: [1],
        steals: [2],
        blocks: [7],
        slam_dunks: [2]
      },
      "Bismack Biyombo": {
        number: [0],
        shoe: [16],
        points: [12],
        rebounds: [4],
        assists: [7],
        steals: [22],
        blocks: [15],
        slam_dunks: [10]
      },
      "DeSagna Diop": {
        number: [2],
        shoe: [14],
        points: [24],
        rebounds: [12],
        assists: [12],
        steals: [4],
        blocks: [5],
        slam_dunks: [5]
      },
      "Ben Gordon": {
        number: [8],
        shoe: [15],
        points: [33],
        rebounds: [3],
        assists: [2],
        steals: [1],
        blocks: [1],
        slam_dunks: [0]
      },
      "Kemba Walker": {
        number: [33],
        shoe: [15],
        points: [6],
        rebounds: [12],
        assists: [12],
        steals: [7],
        blocks: [5],
        slam_dunks: [12]
      }
      }]
    }
}

  
end
 

# game_hash[:away][:players][0][:"Bismack Biyombo"][:steals]

def num_points_scored(p_name)
  new_list = game_hash
  player_score = 0
   new_list.each do |l1key1, l1key2|
     l1key2[:players].each do |l2key1|
       l2key1.each do |l3key1, l3key2|
          s_tring = l3key1.to_s

         if s_tring.include?(p_name)
         player_score = player_score +l3key2[:points][0]
         
          end
        end
      end
   end
   player_score
end

def shoe_size(p_name)
  p_and_shoe_sizes = nil
  game_hash.each do |l1key1, l1key2|
    l1key2[:players].each do |l2key1|
      l2key1.each do |l3key1, l3key2|
          s_tring = l3key1.to_s
                    # binding.pry
          if s_tring.include?(p_name)
            p_and_shoe_sizes = l3key2[:shoe][0]
          end
      end
    end
  end
  p_and_shoe_sizes
end

def team_colors(team)
  color = nil
  game_hash.each do |l1key1, l1key2|
    l1key2.each do |l2key1|
        if l2key1[1].include?(team)
         color = l1key2[:colors]
      end

    end
  end
color
end

def team_names
  teams = []
  game_hash.each do |l1key1, l1key2|
      teams << l1key2[:team_name]
  end
  teams
end

def player_numbers(team)
  brooklyn_numbers = []
   game_hash.each do |l1key1, l1key2|
     l1key2[:players].each do |l2key1|
       l2key1.each do |l3key1, l3key2|
        # binding.pry
         if l1key2[:team_name].include?(team)
          brooklyn_numbers << l3key2[:number][0]
        end
      end
    end
   end
   brooklyn_numbers = brooklyn_numbers.sort
   brooklyn_numbers
end

def player_stats(player)
  numbers = {}
   game_hash.each do |l1key1, l1key2|
     l1key2[:players].each do |l2key1|
       l2key1.each do |l3key1, l3key2|
        # binding.pry
        s_tring = l3key1.to_s
        
         if s_tring == player
          numbers = {
            number: l3key2[:number][0],
            shoe: l3key2[:shoe][0],
            points: l3key2[:points][0],
            rebounds: l3key2[:rebounds][0],
            assists: l3key2[:assists][0],
            steals: l3key2[:steals][0],
            blocks: l3key2[:blocks][0],
            slam_dunks: l3key2[:slam_dunks][0]
          }
        end
      end
    end
   end
   numbers
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |l1key1, l1key2|
     l1key2[:players].each do |l2key1|
       l2key1.each do |l3key1, l3key2|
         if  l3key2[:shoe][0] > biggest_shoe
           biggest_shoe =  l3key2[:shoe][0]
           rebounds =  l3key2[:rebounds][0]
                      # binding.pry
        end
     end
   end
 end
 rebounds
end

def most_points_scored
  most_points = 0
  player_name = nil
  game_hash.each do |l1key1, l1key2|
     l1key2[:players].each do |l2key1|
       l2key1.each do |l3key1, l3key2|
         if  l3key2[:points][0] > most_points
           most_points =  l3key2[:points][0]
           player_name =  l3key1.to_s
        end
     end
   end
  end
 player_name
 end
# binding.pry

def winning_team
  binding.pry
end