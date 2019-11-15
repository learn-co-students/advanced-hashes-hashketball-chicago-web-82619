def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
        }},
        {"Reggie Evans" => {
          :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
        }},
        {"Brook Lopez" => {
          :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
        }},
        {"Mason Plumlee" => {
          :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
        }},
        {"Jason Terry" => {
          :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
        }}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
        }},
        {"Bismack Biyombo" => {
          :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10
        }},
        {"DeSagna Diop" => {
          :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
        }},
        {"Ben Gordon" => {
          :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
        }},
        {"Kemba Walker" => {
          :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12
        }}
    ]}
  }
  
  return game_hash
end

def num_points_scored(name)
  point = 1
  
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          if p_name == name
            point = player[p_name][:points]
          end
        end
      end
    end
  end
  
  return point
end

def shoe_size(name)
  size = 1
  
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          if p_name == name
            size = player[p_name][:shoe]
          end
        end
      end
    end
  end
  
  return size
end

def team_colors(team)
  game_hash.each do |key, value|
    if value[:team_name] == team
      return value[:colors]
    end
  end
end

def team_names
  t_names = []
  
  game_hash.each do |key, value|
    t_names << value[:team_name]
  end
  
  return t_names
end

def player_numbers(team)
  numbers = []
  
  game_hash.each do |key1, value1|
    if value1[:team_name] == team
      value1.each do |key2, value2|
        if key2.to_s == "players"
          value2.each do |player|
            p_name = player.keys[0]
            numbers << player[p_name][:number]
          end
        end
      end
    end
  end
  
  return numbers.sort
end

def player_stats(name)
  
  game_hash.each do |key1, value1|

      value1.each do |key2, value2|
        if key2.to_s == "players"
          value2.each do |player|
            p_name = player.keys[0]
            
            if p_name == name
              return player[p_name]
            end
          end
        end
      end
    
  end
end


def big_shoe_rebounds
  big_shoe = 0
  bs_rebounds = 0
  
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          shoe = player[p_name][:shoe]
          rebounds = player[p_name][:rebounds]
          if big_shoe < shoe
            big_shoe = shoe
            bs_rebounds = rebounds
          end
        end
      end
    end
  end
  
  return bs_rebounds
end

def most_points_scored
  max_score = 0
  mps_name = ""
  
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          points = player[p_name][:points]
          
          if max_score < points
            max_score = points
            mps_name = p_name
          end
        end
      end
    end
  end
  
  return mps_name
end

def winning_team
  team1 = "Brooklyn Nets"
  team2 = "Charlotte Hornets"
  t1_total_points = 0
  t2_total_points = 0

  game_hash.each do |key1, value1|

    if value1[:team_name] == team1
      value1.each do |key2, value2|
        if key2.to_s == "players"
          value2.each do |player|
            p_name = player.keys[0]
            t1_total_points += player[p_name][:points]
          end
        end
      end
    else
      value1.each do |key2, value2|
        if key2.to_s == "players"
          value2.each do |player|
            p_name = player.keys[0]
            t2_total_points += player[p_name][:points]
          end
        end
      end

    end
  end 

  puts "t1_total_points: #{t1_total_points}"
  puts "t2_total_points: #{t2_total_points}"
  if t1_total_points > t2_total_points
    return team1
  else
    retrun team2
  end
end

def player_with_longest_name
  max_length = 0
  l_name = ""

  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          length = p_name.size
          
          if max_length < length
            max_length = length
            l_name = p_name
          end
        end
      end
    end
  end
  
  return l_name
end


def long_name_steals_a_ton?
  long_name = player_with_longest_name
  max_steals = 0;
  max_steal_name = ""

  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2.to_s == "players"
        value2.each do |player|
          p_name = player.keys[0]
          steals = player[p_name][:steals]
          
          if max_steals < steals
            max_steals = steals
            max_steal_name = p_name
          end
        end
      end
    end
  end
  
  if max_steal_name == long_name
    return true
  else
    return false
  end

end


