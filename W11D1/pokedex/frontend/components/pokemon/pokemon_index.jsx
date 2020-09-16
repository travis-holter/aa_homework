import React from 'react';

export default class PokemonIndex extends React.Component {

    componentDidMount () {
        this.props.requestAllPokemon();
    }

    render() {
        const poke = this.props.pokemon.map((pokem) => {
            return (
                <li key={pokem.id}>{pokem.name}
                <img className="pokeimage" src={pokem.image_url}></img>
                </li>
            )
        })

        return (
            <ul>{poke}</ul>
        );
    }
}


// const bubbleLis = this.props.bubbles.map(bubble => {
//     return <li key={bubble.id}>{bubble.body} - {author.username} </li>
// });

// return (<ul className="bubbles-list">{bubbleLis}</ul>);