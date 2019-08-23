require "pry"
# Write your code here!
def game_hash 
  stats = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ['Black', 'White'],
      players: [
        {'Alan Anderson' => { number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}},
        {'Reggie Evans' => { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}},
        {'Brook Lopez' => { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}},
        {'Mason Plumlee' => { number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}},
        {'Jason Terry' => { number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}
        ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ['Turquoise', 'Purple'],
      players: [
        {'Jeff Adrien' => { number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}},
        {'Bismack Biyombo' => { number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}},
        {'DeSagna Diop' => { number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}},
        {'Ben Gordon' => { number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}},
        {'Kemba Walker' => { number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}}
        ]
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

# Helper method.
def stat_leader(stat) 
  goliath = ''
  max = 0
  game_hash.each { |location, team_data|
    team_data[:players].each { |player_data|
      player_data.each { |player, stats|
        goliath = stats[stat] > max ? player : goliath
        max = stats[stat] if goliath == player
      }
    }
  }
  return goliath
end

#1
def num_points_scored(player_name)
  player_stats(player_name)[:points]
end

#2
def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

#3
def team_colors(team_name)
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  }
end 

#4
def team_names
  result = []
  game_hash.each { |location, team_data|
    result.push(team_data[:team_name])
  }
  return result
end

#5
def player_numbers(team_name)
  numbers = []
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each { |player_data|
        player_data.each { |player, stats|
          numbers.push(stats[:number])
        }
      }
    end
  }
  return numbers 
end

#6
def player_stats(player_name) 
  game_hash.each { |location, team_data|
    team_data[:players].each { |player_data|
      player_data.each { |player, stats|
        if player_name == player
          return stats
        end
      }
    }
  }
end

#7
def big_shoe_rebounds
  player_stats(stat_leader(:shoe))[:rebounds]
end

#8
def most_points_scored
  stat_leader(:points)
end

#9 
def winning_team
  nets = 0 
  hornets = 0
  game_hash.each { |location, team_data|
    team_data[:players].each { |player_data|
        player_data.each { |player, stats|
          if team_data[:team_name] == "Brooklyn Nets"
            nets += stats[:points]
          else
            hornets += stats[:points]
          end
        }
    }
  }
  nets > hornets ? "Brooklyn Nets" : "Charlotte Hornets"
end

#10
def player_with_longest_name 
  goliath = ''
  max = 0
  game_hash.each { |location, team_data|
    team_data[:players].each { |player_data|
      player_data.each { |player, stats|
        goliath = player.length > max ? player : goliath
        max = player.length if goliath == player
      }
    }
  }
  return goliath
end

#11 
def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = stat_leader(:steals)
  return longest_name == most_steals
end