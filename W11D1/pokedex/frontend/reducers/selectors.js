export const selectAllPokemon = function(state) {
    return Object.values(state.entities.pokemon);
}