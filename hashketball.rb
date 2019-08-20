require "pry"

# Write your code here!
def game_hash
  game = { 
    :home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],
    :players => [
      "Alan Anderson" => {
        :number => 0, :shoe => 16, :points => 22, :rebounds => 12,
        :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30, :shoe => 14, :points => 12, :rebounds => 12,
        :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11, :shoe => 17, :points => 17, :rebounds => 19,
        :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1, :shoe => 19, :points => 26, :rebounds => 11,
        :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31, :shoe => 15, :points => 19, :rebounds => 2,
        :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
      }
    ]}, 
    :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], 
    :players => [
      "Jeff Adrien" => {
        :number => 4, :shoe => 18, :points => 10, :rebounds => 1,
        :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0, :shoe => 16, :points => 12, :rebounds => 4,
        :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2, :shoe => 14, :points => 24, :rebounds => 12,
        :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8, :shoe => 15, :points => 33, :rebounds => 3,
        :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
      },
      "Kemba Walker" => {
        :number => 33, :shoe => 15, :points => 6, :rebounds => 12,
        :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12
      }
    ]}
  }

  game
end

def num_points_scored(name)
  hash = game_hash
  points = nil
  
  hash.each do |key,team|
    if team[:players][0][name]
      points = team[:players][0][name][:points]
    end
  end
  points
end

def shoe_size(name)
  hash = game_hash
  size = nil
  
  hash.each do |key,team|
    if team[:players][0][name]
      size = team[:players][0][name][:shoe]
    end
  end
  size
end

def team_colors(team)
  hash = game_hash
  color = nil
  
  hash.each do |key, t|
    if t[:team_name] == team
      color = t[:colors]
    end
  end
  color
end

def team_names
  hash = game_hash
  team_names = []
  
  hash.each do |key, team|
    team_names.push(team[:team_name])
  end
  team_names
end

def player_numbers(team_name)
  hash = game_hash
  nums = []
  
  hash.each do |key, team|
    team[:players][0].values.each do |player|
      if team[:team_name] == team_name
        nums.push(player[:number])
      end
    end
  end
  nums
end

def player_stats(name)
  hash = game_hash
  stats = {}
  
  hash.each do |key,team|
    if team[:players][0][name]
      stats = team[:players][0][name]
    end
  end
  stats
end

def big_shoe_rebounds
  hash = game_hash
  largest_shoe = 0
  rebound = nil
  
  hash.each do |key,team|
    team[:players][0].values.each do |player|
      if player[:shoe] > largest_shoe
        largest_shoe = player[:shoe]
        rebound = player[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  hash = game_hash
  points = 0
  n = nil
  
  hash.each do |key,team|
    team[:players].each do |player|
      player.each do |name|
        if name[1][:points] > points
          points = name[1][:points]
          n = name[0]
        end
      end
    end
  end
  n
end

def winning_team
  hash = game_hash
  home_score = 0
  away_score = 0
  winner = nil
    
  hash.each do |key,team|
    team[:players].each do |player|
      player.each do |name|
        
        if key.to_s == "home"
          home_score += name[1][:points]
        elsif key.to_s == "away"
          away_score += name[1][:points]
        end
      end
    end
  end

  if home_score > away_score
    winner = hash[:home][:team_name]
  elsif away_score > home_score
    winner = hash[:away][:team_name]
  end
  winner
end

def player_with_longest_name
  hash = game_hash
  longest_name_length = 0 
  n = nil
  
  hash.each do |key,team|
    team[:players].each do |player|
      player.each do |name|
        if name[0].length > longest_name_length
          longest_name_length = name[0].length
          n = name[0]
        end
      end
    end
  end
  n
end

def long_name_steals_a_ton?
  hash = game_hash
  player_name = player_with_longest_name
  steals = 0
  flag = true
  
  hash.each do |key,team|
    team[:players].each do |player|
      player.each do |name|
        if name[1][:steals] > steals
          steals = name[1][:steals]
        end
        if name[0] == player_name && name[1][:steals] < steals
          flag = false 
        end
      end
    end
  end
  flag
end