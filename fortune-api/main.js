import dotenv from 'dotenv';
import http from 'http';
import fortuneHTTP from 'fortune-http';
import fortune from 'fortune';
import pgAdapter from 'fortune-postgres';
import jsonApiSerializer from 'fortune-json-api';
import recordTypes from './record-types';

dotenv.config();

const adapter = [pgAdapter, {
  client: process.env.DB_CLIENT,
  connection: {
    host : process.env.DB_HOST,
    user : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_DATABASE,
  }
}];

const store = fortune(recordTypes, { adapter });

const listener = fortuneHTTP(store, {
  // The order specifies priority of media type negotiation.
  serializers: [
    jsonApiSerializer,
    fortuneHTTP.JsonSerializer,
    fortuneHTTP.HtmlSerializer,
  ]
});

const server = http.createServer((request, response) =>
  listener(request, response)
  .catch(error => {
    debugger;
  }));

let port = process.env.PORT || 3000

server.listen(port, () => {
  console.log(`Listening on port: ${port}`);
});
