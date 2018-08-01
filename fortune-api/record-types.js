export default {
  person: {
    // Attributes
    name: { type: String, columnType: 'string' },
    height: { type: String, columnType: 'string' },
    mass: { type: String, columnType: 'string' },
    hairColor: { type: String, columnType: 'string' },
    skinColor: { type: String, columnType: 'string' },
    eyeColor: { type: String, columnType: 'string' },
    birthYear: { type: String, columnType: 'string' },
    gender: { type: String, columnType: 'string' },

    // Relationships
    homeworld: ['planet', 'residents'],
    films: [Array('film'), 'characters'],
    species: [Array('species'), 'people'],
    starships: [Array('starship'), 'pilots'],
    vehicles: [Array('vehicle'), 'pilots'],
  },

  film: {
    // Attributes
    episodeId: Number,
    title: { type: String, columnType: 'string' },
    openingCrawl: { type: String, columnType: 'text' },
    director: { type: String, columnType: 'string' },
    producer: { type: String, columnType: 'string' },
    releaseDate: Date,

    // Relationships
    species: [Array('species'), 'films'],
    starships: [Array('starship'), 'films'],
    vehicles: [Array('vehicle'), 'films'],
    characters: [Array('person'), 'films'],
    planets: [Array('planet'), 'films'],
  },

  starship: {
    // Attributes
    hyperdriveRating: { type: String, columnType: 'string' },
    mglt: { type: String, columnType: 'string' },
    starshipClass: { type: String, columnType: 'string' },

    name: { type: String, columnType: 'string' },
    model: { type: String, columnType: 'string' },
    manufacturer: { type: String, columnType: 'string' },
    costInCredits: { type: String, columnType: 'string' },
    length: { type: String, columnType: 'string' },
    maxAtmospheringSpeed: { type: String, columnType: 'string' },
    crew: { type: String, columnType: 'string' },
    passengers: { type: String, columnType: 'string' },
    cargoCapacity: { type: String, columnType: 'string' },
    consumables: { type: String, columnType: 'string' },

    // Relationships
    films: [Array('film'), 'starships'],
    pilots: [Array('person'), 'starships'],
  },

  vehicle: {
    // Attributes
    vehicleClass: { type: String, columnType: 'string' },

    name: { type: String, columnType: 'string' },
    model: { type: String, columnType: 'string' },
    manufacturer: { type: String, columnType: 'string' },
    costInCredits: { type: String, columnType: 'string' },
    length: { type: String, columnType: 'string' },
    maxAtmospheringSpeed: { type: String, columnType: 'string' },
    crew: { type: String, columnType: 'string' },
    passengers: { type: String, columnType: 'string' },
    cargoCapacity: { type: String, columnType: 'string' },
    consumables: { type: String, columnType: 'string' },

    // Relationships
    films: [Array('film'), 'vehicles'],
    pilots: [Array('person'), 'vehicles'],
  },

  species: {
    // Attributes
    name: { type: String, columnType: 'string' },
    classification: { type: String, columnType: 'string' },
    designation: { type: String, columnType: 'string' },
    averageHeight: { type: String, columnType: 'string' },
    skinColors: { type: String, columnType: 'string' },
    hairColors: { type: String, columnType: 'string' },
    eyeColors: { type: String, columnType: 'string' },
    averageLifespan: { type: String, columnType: 'string' },
    language: { type: String, columnType: 'string' },

    // Relationships
    homeworld: ['planet', 'species'],
    people: [Array('person'), 'species'],
    films: [Array('film'), 'species'],
  },

  planet: {
    // Attributes
    name: { type: String, columnType: 'string' },
    rotationPeriod: { type: String, columnType: 'string' },
    orbitalPeriod: { type: String, columnType: 'string' },
    diameter: { type: String, columnType: 'string' },
    climate: { type: String, columnType: 'string' },
    gravity: { type: String, columnType: 'string' },
    terrain: { type: String, columnType: 'string' },
    surfaceWater: { type: String, columnType: 'string' },
    population: { type: String, columnType: 'string' },

    // Relationships
    residents: [Array('person'), 'homeworld'],
    species: [Array('species'), 'homeworld'],
    films: [Array('film'), 'planets'],
  }
};
