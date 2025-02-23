Rails.application.routes.draw do
  # Define la ruta para consultar un Pokémon (por ejemplo, /pokemon/pikachu)
  get '/pokemon/:pokemon', to: 'pokemon#get_pokemon'
end
