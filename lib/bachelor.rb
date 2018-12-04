def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant_hash|
    if contestant_hash["status"] == "Winner"
      winner = contestant_hash["name"]
      return winner.split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_key, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        return contestant_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_key, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season_key, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  array_of_ages = []
  data[season].each do |contestant_hash|
    array_of_ages << contestant_hash["age"]
  end
  array_of_ages.map! { |number| number.to_f}
  return (array_of_ages.reduce(:+) / array_of_ages.length).round
end
