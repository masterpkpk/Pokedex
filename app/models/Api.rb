class Api

    def pokemon_creator
      url = "https://pokeapi.co/api/v2/pokemon?limit=151"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response.body
      @pokemon_data = JSON.parse(response.body)
      @pokemon = @pokemon_data["results"].collect do |pokemon|
        pokemon
      end

     
    end

    def pokemon_new
      self.map do |pokemon|
        pokemon
      end  
        
        
        
        
        # pokemon = "https://pokeapi.co/api/v2/#{pokemon["name"]}"
        # poke_uri = URI.parse(pokemon)
        # response = Net::HTTP.get_response(poke_uri)
        # response.body
        # pokemon_data = JSON.parse(response.body)
        # Pokemon.new(name: pokemon_data["name"], type: pokemon_data["types"][0]["type"]["name"])

      

    end

  
end
