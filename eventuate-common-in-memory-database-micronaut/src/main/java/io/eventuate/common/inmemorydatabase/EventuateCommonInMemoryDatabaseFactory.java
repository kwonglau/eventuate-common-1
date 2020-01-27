package io.eventuate.common.inmemorydatabase;

import io.micronaut.context.annotation.Factory;

import javax.inject.Singleton;
import javax.sql.DataSource;
import java.util.List;

@Factory
public class EventuateCommonInMemoryDatabaseFactory {

  @Singleton
  public DataSource dataSource(List<EventuateDatabaseScriptSupplier> scripts) {
    return new EventuateInMemoryDataSourceBuilder(scripts).build();
  }

}
