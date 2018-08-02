import Router from 'koa-router';
import { singularize, classify } from 'inflected';

const router = new Router();

router.get('/films', async (ctx) => {
  const results = await ctx.app.db.Film.fetchAll();


  ctx.body = {
    data: results.map(model => {
      return {
        id: model.id,
        type: 'films',
        attributes: model
      };
    })
  };
});

router.get('/:resource', async (ctx) => {
  const { resource } = ctx.params;
  const modelName = classify(singularize(resource));

  const results = await ctx.app.db[modelName].fetchAll();

  ctx.body = results;
});

router.get('/:resource/:id', async (ctx) => {
  const { resource, id } = ctx.params;
  const modelName = classify(singularize(resource));

  const results = await ctx.app.db[modelName].where({id}).fetch();

  ctx.body = results;
});

router.get('/:resource/:id/:relation', async (ctx) => {
  const { resource, id, relation } = ctx.params;
  const modelName = classify(singularize(resource));

  const results = await ctx.app.db[modelName]
    .where({id})
    .fetch({
      withRelated: [relation]
    });

  ctx.body = results.related(relation);
});

export default router;
