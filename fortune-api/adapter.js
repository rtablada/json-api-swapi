import Adapter from 'fortune/lib/adapter';
import knex from 'knex';
import bookshelf from 'bookshelf';
import { pluralize } from 'inflected';
import Startup from './adapter/startup';

export default () =>
  class PostgreSQLAdapter extends Adapter {
    async connect() {
      const {
        options,
      } = this;

      this.connection = knex(options);
      this.orm = bookshelf(this.connection);
      this.startup = new Startup(this);
      await this.startup.checkTablesExist();

      this.setupModels();
    }

    getRelations(resourceName) {
      const { recordTypes } = this;
      const typeDefinition = recordTypes[resourceName];
      const properties = Object.keys(typeDefinition);

      return properties.reduce((accum, relationName) => {
        if (typeDefinition[relationName].link) {
          return [...accum, { relationName, relation: typeDefinition[relationName] }];
        }

        return accum;
      }, []);
    }

    getRelationType(relation) {
      const { recordTypes } = this;

      if (!relation.isArray) {
        return 'belongsTo';
      } else if (recordTypes[relation.link][relation.inverse].isArray) {
        return 'belongsToMany';
      } else {
        return 'hasMany';
      }
    }

    setupModels() {
      const { recordTypes } = this;
      const resourceNames = Object.keys(recordTypes);

      this.models = resourceNames.reduce((models, resourceName) => {
        const relations = this.getRelations(resourceName);
        const tableName = pluralize(resourceName);

        const relationDefinitions = relations.reduce((r, { relationName, relation }) => {
          const relationType = this.getRelationType(relation);

          return {
            ...r,
            [relationName]: function() {
              this[relationType](relation.link);
            }
          };
        }, {});

        const model = this.orm.Model.extend({
          tableName,

          ...relationDefinitions
        });

        return { ...models, [resourceName]: model };
      }, {});
    }

    async find(type, ids, options, meta) {
      if (!this.ids) {
        const result = await this.models[type].fetchAll();
        debugger;

        return result.toArray();
      }
    }
  };
