module DataAccess
  class PokemonDataAccess
    def initialize
      @pokemon_service = Service::PokemonService.new
    end

    def fetch_pokemon(pokemon)
      @pokemon_service.get_pokemon(pokemon)
    end
  end
end
