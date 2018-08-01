import knex from 'knex';
import _ from 'lodash';
import { Parser as CsvParser } from 'json2csv';
import fs from 'fs'
import { promisify } from 'util';
const writeFile = promisify(fs.writeFile);

const oldDb = knex({
  client: 'pg',
  connection: {
    host : 'localhost',
    database : 'swapi'
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

async function updateManyToMany(relationTable) {
  const relationData = await oldDb.table(relationTable).select();

  const generator = new CsvParser();
  const csv = generator.parse(relationData);

  await writeFile(`./csv/${relationTable}.csv`, csv);
}

async function createCsv(fileName, data) {
  const generator = new CsvParser();
  const csv = generator.parse(data);

  await writeFile(`./csv/${fileName}.csv`, csv);
}

async function main() {
  // Get Old Data
  const starships = await oldDb.table('starship').join('transport', 'transport.id', 'starship.transport_ptr_id').orderBy('id').select();
  const vehicles = await oldDb.table('vehicle').join('transport', 'transport.id', 'vehicle.transport_ptr_id').orderBy('id').select();
  const films = await oldDb.table('film').orderBy('id').select();
  const people = await oldDb.table('people').orderBy('id').select();
  const species = await oldDb.table('species').orderBy('id').select();
  const planets = await oldDb.table('planet').orderBy('id').select();

  // Insert Data
  await createCsv('starships', starships.map(cleanModel));
  await createCsv('vehicles', vehicles.map(cleanModel));
  await createCsv('films', films.map(cleanModel));
  await createCsv('people', people.map(cleanModel));
  await createCsv('species', species.map(cleanModel));
  await createCsv('planets', planets.map(cleanModel));


  // Get many to many relationship data
  await updateManyToMany('film_characters');

  await updateManyToMany('film_planets');

  await updateManyToMany('film_species');

  await updateManyToMany('film_starships');

  await updateManyToMany('film_vehicles');

  await updateManyToMany('species_people');

  await updateManyToMany('starship_pilots');

  await updateManyToMany('vehicle_pilots');
}

main();
