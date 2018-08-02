import Koa from 'koa';
import logger from 'koa-logger';
import bodyParser from 'koa-bodyparser';
import cors from '@koa/cors';
import router from './routes';
import db from './db';

const app = new Koa();
app.db = db;

app.use(logger());
app.use(cors());
app.use(bodyParser());

app.use(router.allowedMethods());
app.use(router.routes());

const port = process.env.PORT || 3200;

app.listen(port, () => {
  console.log(`Started Server on Port ${port}`);
});
