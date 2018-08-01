import knex from 'knex';
import _ from 'lodash';

const oldDb = knex({
  client: 'pg',
  connection: {
    host : 'localhost',
    database : 'swapi'
  }
});

const newDb = knex({
  client: 'pg',
  connection: {
    host : 'localhost',
    database : 'swapi_fortune'
  }
});

const cleanModel = (model) => {
  let copy = {...model};
  delete copy.created;
  delete copy.edited;
  copy = _.mapKeys(copy, (value, key) => {
    return _.camelCase(key);
  });
  delete copy.transportPtrId;

  if (copy.hasOwnProperty('homeworldId')) {
    copy.homeworld = copy.homeworldId;
    delete copy.homeworldId;
  }

  return copy;
}

async function truncateTables() {
  const tables = ['film', 'starship', 'vehicle', 'person', 'species', 'planet'];

  await Promise.all(tables.map((table) => newDb.table(table).truncate()));
}

async function updateHasMany (fromTable, relationName, childTable, foreignKey) {
  const relationData = await oldDb.table(childTable).select();
  const relationsGrouped = _.groupBy(relationData, foreignKey);

  for (let i = 0; i < Object.keys(relationsGrouped).length; i++) {
    const pKey = Object.keys(relationsGrouped)[i];
    const relations = relationsGrouped[pKey];
    const relatedIds = relations.map(a => a.id);

    await newDb.table(fromTable).where({
      id: pKey
    }).update({
      [relationName]: relatedIds
    });
  }
}

async function updateManyToMany(relationTable, fromTable, relationName, fromKey, toKey) {
  const relationData = await oldDb.table(relationTable).select();
  const relationsGrouped = _.groupBy(relationData, fromKey);

  for (let i = 0; i < Object.keys(relationsGrouped).length; i++) {
    const pKey = Object.keys(relationsGrouped)[i];
    const relations = relationsGrouped[pKey];
    const relatedIds = relations.map(a => a[toKey]);

    await newDb.table(fromTable).where({
      id: pKey
    }).update({
      [relationName]: relatedIds
    });
  }
}

async function main() {
  await truncateTables()

  // Get Old Data
  const starships = await oldDb.table('starship').join('transport', 'transport.id', 'starship.transport_ptr_id').orderBy('id').select();
  const vehicles = await oldDb.table('vehicle').join('transport', 'transport.id', 'vehicle.transport_ptr_id').orderBy('id').select();
  const films = await oldDb.table('film').orderBy('id').select();
  const people = await oldDb.table('people').orderBy('id').select();
  const species = await oldDb.table('species').orderBy('id').select();
  const planets = await oldDb.table('planet').orderBy('id').select();

  // Insert Data
  await newDb.table('film').insert(films.map(cleanModel)).select();
  await newDb.table('starship').insert(starships.map(cleanModel)).select();
  await newDb.table('vehicle').insert(vehicles.map(cleanModel)).select();
  await newDb.table('person').insert(people.map(cleanModel)).select();
  await newDb.table('species').insert(species.map(cleanModel)).select();
  await newDb.table('planet').insert(planets.map(cleanModel)).select();

  // Get has many relationship data
  await updateHasMany('planet', 'residents', 'people', 'homeworld_id');
  await updateHasMany('planet', 'species', 'species', 'homeworld_id');

  // Get many to many relationship data
  await updateManyToMany('film_characters', 'film', 'characters', 'film_id', 'people_id');
  await updateManyToMany('film_characters', 'person', 'films', 'people_id', 'film_id');

  await updateManyToMany('film_planets', 'film', 'planets', 'film_id', 'planet_id');
  await updateManyToMany('film_planets', 'planet', 'films', 'planet_id', 'film_id');

  await updateManyToMany('film_species', 'film', 'species', 'film_id', 'species_id');
  await updateManyToMany('film_species', 'species', 'films', 'species_id', 'film_id');

  await updateManyToMany('film_starships', 'film', 'starships', 'film_id', 'starship_id');
  await updateManyToMany('film_starships', 'starship', 'films', 'starship_id', 'film_id');

  await updateManyToMany('film_vehicles', 'film', 'vehicles', 'film_id', 'vehicle_id');
  await updateManyToMany('film_vehicles', 'vehicle', 'films', 'vehicle_id', 'film_id');

  await updateManyToMany('species_people', 'species', 'people', 'species_id', 'people_id');
  await updateManyToMany('species_people', 'person', 'species', 'people_id', 'species_id');

  await updateManyToMany('starship_pilots', 'starship', 'pilots', 'starship_id', 'people_id');
  await updateManyToMany('starship_pilots', 'person', 'starships', 'people_id', 'starship_id');

  await updateManyToMany('vehicle_pilots', 'vehicle', 'pilots', 'vehicle_id', 'people_id');
  await updateManyToMany('vehicle_pilots', 'person', 'vehicles', 'people_id', 'vehicle_id');
}

main();
