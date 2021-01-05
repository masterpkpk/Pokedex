class Api

    def url_creator(pokemon)
      url = "https://pokeapi.co/api/v2/pokemon/#{pokemon}"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response.body
      
      @pokemon_data = JSON.parse(response.body)
    end

  
end
