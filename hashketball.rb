# Write your code here!

require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players =>

        [{"Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 }
        },
        
        {"Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }},
        
        {"Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }},
        {"Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }},
        {"Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }}
        ]

    },

    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{"Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }},
        
        {"Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }},
        {"DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }},
        
        {"Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }},
        
        {"Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }}
      
      ]
      
    }
        

    }
    
    return game

end


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      if (data.is_a?(Enumerable))
        data.each do |data_item|
          binding.pry
        end
      
      end
    end
  end
end

def num_points_scored(target_player_name)
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data| 
    
    
    if (attribute === :players)
      
      
      data.each do |player| 
      
        if (player.keys[0] == target_player_name)
          
          return player.values[0][:points]
        
        end
        
      end
        
        
      
    end
    
    end
    
  end
  
end

def shoe_size(target_player_name)
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data| 
    
    if (attribute == :players)
      
      data.each do |player| 
        
        if (player.keys[0] == target_player_name)
        
          return player.values[0][:shoe]
        
        end
        
      end
        
        
      
    end
    
    end
    
  end
  
end

def team_colors(team_name)
  
  game_hash.each do |location, team_data|
    
    if team_data[:team_name] == team_name 
      return team_data[:colors]
    end
    
   
    
  end
    
end



def team_names
  
  names = []
  
  game_hash.each do |location, team_data|
    
    names.push(team_data[:team_name])
    
  end
  
  
  return names
end

def player_numbers(team_name)
  
  jersey_numbers = []
  
  game_hash.each do |location, team_data|
    
    if team_data.has_value?(team_name)
    
      team_data.each do |attribute, data| 
      
      
      
        if attribute == :players
          data.each do |player| 
          
         
          
          jersey_numbers.push(player.values[0][:number])
        
          end
        end
      end
    
    end
    
  end
  
  return jersey_numbers
end

def player_stats(target_player_name)
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data| 
      
      if attribute == :players
        data.each do |player| 
        
          if player.keys[0] == target_player_name
            return player.values[0]
          end
        
        end
      
      end
      
    end

  end

end

def big_shoe_rebounds
  
  max_shoe_size = 0
  potential_rebound = 0
    game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data| 
      
        if attribute == :players
          data.each do |player| 
            
            stats = player.values[0]
            
            if stats[:shoe] > max_shoe_size
              max_shoe_size = stats[:shoe]
              potential_rebound = stats[:rebounds]
          
        
            end
      
          end
      
        end

      end
    end
    
  return potential_rebound

end

def most_points_scored
  
  max_points = 0
  mvp = ""
    game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data| 
      
        if attribute == :players
          data.each do |player| 
            
            player_name = player.keys[0]
            stats = player.values[0]
            
            if stats[:points] > max_points
              max_points = stats[:points]
              mvp = player_name
          
        
            end
      
          end
      
        end

      end
    end
  return mvp
end

def winning_team
  
  max_points = {}
  
    game_hash.each do |location, team_data|
    
   
    max_points[team_data[:team_name]] = 0
    
      team_data.each do |attribute, data| 
      
        if attribute == :players
          data.each do |player| 
            
            player_name = player.keys[0]
            stats = player.values[0]
            
            
            max_points[team_data[:team_name]] += stats[:points]
          
        
          end
      
        end
      
      end

    end
  
  if max_points.values[0] > max_points.values[1]
    return max_points.keys[0]
    
  else
    return max_points.keys[1]
  end
  
end

def player_with_longest_name
  
  longest_name = ""
  
    game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data| 
      
        if attribute == :players
          data.each do |player| 
            
            player_name = player.keys[0]
            
            
            if player_name.length > longest_name.length
              
              longest_name = player_name
          
        
            end
      
          end
      
        end

      end
    end
  return longest_name
end


def long_name_steals_a_ton?
  
  max_steals = 0
  max_steals_player = ""
  
    game_hash.each do |location, team_data|
    
      team_data.each do |attribute, data| 
      
        if attribute == :players
          data.each do |player| 
            
            player_name = player.keys[0]
            stats = player.values[0]
            
            if stats[:steals] > max_steals
              max_steals = stats[:steals]
              max_steals_player = player_name
          
            end
      
          end
       end
      end
    end
  return player_with_longest_name == max_steals_player
end
