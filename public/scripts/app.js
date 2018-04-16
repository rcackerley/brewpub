let getBrewsOfTheWeek = () => fetch('/beers', {method: 'GET'})

let beersOfTheWeek = getBrewsOfTheWeek()
.then(beers => {console.log(beers)})
