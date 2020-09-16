import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from "./actions/pokemon_actions";
import { fetchAllPokemon } from "./util/api_util";
import { configureStore } from "./store/store";
import { requestAllPokemon } from "./actions/pokemon_actions";
import { selectAllPokemon } from "./reducers/selectors";
import  Root from "./components/root.jsx";

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemon = fetchAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon;

    ReactDOM.render(<Root store={store}/>, rootEl);
});