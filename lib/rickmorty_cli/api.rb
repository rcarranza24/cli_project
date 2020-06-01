class Api
  BASE_URL = 'https://rickandmortyapi.com/api/character/'
  
  def self.get_rickmorty
    res = RestClient.get(BASE_URL)
    data = JSON.parse(res.body)
    data["results"].each do |rickmorty|
     name = rickmorty["name"]
     id = rickmorty["url"].split("/")[-1]

     Rickmorty.new(name, id)
   end
 end 

  def self.get_details_by_id(id)
    puts "Getting details..."
    selected_rickmorty = Rickmorty.find_by_id(id)
    res = RestClient.get("#{BASE_URL}#{id}")
    data = JSON.parse(res.body)
    
    gender = data["gender"]
    species = data["species"]
    status = data["status"]
    selected_rickmorty.update(gender, species, status)
    selected_rickmorty
  end
end