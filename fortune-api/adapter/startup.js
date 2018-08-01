import { pluralize } from 'inflected';
import _ from 'lodash';

export default class Startup {
  constructor(adapter) {
    this.adapter = adapter;
    this.connection = adapter.connection;
  }

  async checkTablesExist() {
    const { recordTypes } = this.adapter;
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
    const { recordTypes } = this.adapter;
    const relations = this.adapter.getRelations(resourceName);
    const tableName = pluralize(resourceName);

    const belongsTo = relations.filter(a => !a.relation.isArray);
    const hasMany = relations.filter(a => a.relation.isArray);
    const manyToMany = hasMany.filter(a => {
      const inverseRelation = recordTypes[a.relation.link][a.relation.inverse];

      return inverseRelation.isArray;
    });

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

    for (let i = 0; i < manyToMany.length; i++) {
      const { relation } = manyToMany[i];
      const relationType = relation.link;
      const tableNames = _.sortBy([resourceName, relationType], a => a);
      const joinTableName = tableNames.join('_');

      if (!await this.connection.schema.hasTable(joinTableName)) {
        await this.createJoinTable(resourceName, relationType)
      }
    }
  }

  async createJoinTable(resource1, resource2) {
    const tableNames = _.sortBy([resource1, resource2], a => a);
    const joinTableName = tableNames.join('_');

    await this.connection.schema.createTable(joinTableName, t => {
      t.integer(`${resource1}_id`)
        .references('id')
        .inTable(pluralize(resource1));
      t.integer(`${resource2}_id`)
        .references('id')
        .inTable(pluralize(resource2));
    });
  }

  async createTable(resourceName) {
    const { recordTypes } = this.adapter;
    const typeDefinition = recordTypes[resourceName];
    const properties = Object.keys(typeDefinition);
    const tableName = pluralize(resourceName);

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
        case 'Date':
          return 'date';
      }
    }
  }
}
