import Adapter from 'fortune/lib/adapter';
import { pluralize } from 'inflected';
import knex from 'knex';

export default () =>
  class PostgreSQLAdapter extends Adapter {
    async connect() {
      const {
        options,
      } = this;

      this.connection = knex(options);

      await this.checkTablesExist();
    }

    async checkTablesExist() {
      const { recordTypes } = this;
      const resourceNames = Object.keys(recordTypes);

      for (let i = 0; i < resourceNames.length; i++) {
        const resourceName = resourceNames[i];
        const tableName = pluralize(resourceName);

        if (!await this.connection.schema.hasTable(tableName)) {
          await this.createTable(resourceName);
        } else {
          // debugger;
        }
      }

      for (let i = 0; i < resourceNames.length; i++) {
        const resourceName = resourceNames[i];

        await this.ensureRelations(resourceName);
      }
    }

    async ensureRelations(resourceName) {
      const { recordTypes } = this;
      const typeDefinition = recordTypes[resourceName];
      const properties = Object.keys(typeDefinition);
      const tableName = pluralize(resourceName);

      const relations = properties.reduce((accum, relationName) => {
        if (typeDefinition[relationName].link) {
          return [...accum, { relationName, relation: typeDefinition[relationName] }];
        }

        return accum;
      }, []);

      const belongsTo = relations.filter(a => !a.relation.isArray);

      if (belongsTo.length > 0) {
        for (let i = 0; i < belongsTo.length; i++) {
          const { relation } = belongsTo[i];
          const columnName = `${relation.link}_id`;
          const relationTableName = pluralize(relation.link);

          if (!await this.connection.schema.hasColumn(tableName, columnName)) {
            await this.connection.schema.alterTable(tableName, t => {
              t.integer(columnName)
                .references('id')
                .inTable(relationTableName);
            });
          }
        }
      }
    }

    async createTable(resourceName) {
      const { recordTypes } = this;
      const typeDefinition = recordTypes[resourceName];
      const properties = Object.keys(typeDefinition);
      const tableName = pluralize(resourceName);

      debugger;

      await this.connection.schema.createTable(tableName, (t) => {
        t.increments('id');
        t.timestamps();

        properties.forEach(key => {
          let columnType = this.getType(typeDefinition[key]);

          if (columnType) {
            t[columnType](key);
          }
        });
      });
    }

    getType(value) {
      if (value.columnType) {
        return value.columnType;
      } else if (typeof value === 'string') {
        return value;
      } else if (Array.isArray(value) || value.isArray) {
        return
        // Relationship stuff...
      } else if (value.type) {
        switch (value.type.name) {
          case 'String':
            return 'string';
          case 'Number':
            return 'integer'
        }
      }
    }
  };
