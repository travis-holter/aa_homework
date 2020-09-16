export const fetchSearchGiphys = searchTerm => (
    $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=PAfgjyLsJCrbXQnzygt6jACR7jRUyqJz&limit=2`,
}));

// PAfgjyLsJCrbXQnzygt6jACR7jRUyqJz