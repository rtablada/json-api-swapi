import knex from 'knex';
import bookshelf from 'bookshelf';

const oldDb = knex({
  client: 'pg',
  connection: {
    host : 'localhost',
    database : 'swapi'
  }
});

const orm = bookshelf(oldDb);
orm.plugin('registry');

orm.Film = orm.model('Film', orm.Model.extend({
  tableName: 'film',

  characters() {
    return this.belongsToMany('Person', 'film_characters', 'film_id', 'people_id');
  },

  planets() {
    return this.belongsToMany('Planet', 'film_planets', 'film_id', 'planet_id');
  },

  species() {
    return this.belongsToMany('Species', 'film_species', 'film_id', 'species_id');
  },
}));

orm.Planet = orm.model('Planet', orm.Model.extend({
  tableName: 'planet',

  films() {
    return this.belongsToMany('Film', 'film_planets', 'planet_id', 'film_id');
  },
  species() {
    return this.hasMany('Species', 'homeworld_id');
  },
  residents() {
    return this.hasMany('Person', 'homeworld_id');
  },
}));

orm.Species = orm.model('Species', orm.Model.extend({
  tableName: 'species',

  films() {
    return this.belongsToMany('Film', 'film_species', 'species_id', 'film_id');
  },
  homeworld() {
    return this.belongsTo('Planet', 'homeworld_id');
  },
}));

orm.Person = orm.model('Person', orm.Model.extend({
  tableName: 'people',

  films() {
    return this.belongsToMany('Film', 'film_characters', 'people_id', 'film_id');
  },
  homeworld() {
    return this.belongsTo('Planet', 'homeworld_id');
  }
}));

export default orm;
