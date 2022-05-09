const axios = require('axios').default;
const URL = "http://127.0.0.1:5000"

// Make a request for a user with a given ID
const top_riders_url = URL + "/topriders";

export const getTopRiders = () => {
    axios.get(top_riders_url)
        .then(function (response) {
            return response.data;
        })
        .catch(function (error) {
            return [];
        });
}


