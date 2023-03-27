resource "kubernetes_config_map" "ac_dl_read" {
  metadata {
    name      = "ac-dl-read"
    namespace = "uat01"

    labels = {
      app = "ac-dl-read"
    }
  }

  data = {
    "logger.xml" = "<!-- https://www.playframework.com/documentation/latest/SettingsLogger -->\n<configuration>\n\n  <conversionRule conversionWord=\"coloredLevel\" converterClass=\"play.api.libs.logback.ColoredLevel\" />\n\n  <appender name=\"FILE\" class=\"ch.qos.logback.core.FileAppender\">\n    <file>$${application.home:-.}/logs/application.log</file>\n    <encoder>\n      <pattern>%date [%level] from %logger in %thread - %message%n%xException</pattern>\n    </encoder>\n  </appender>\n\n  <appender name=\"STDOUT\" class=\"ch.qos.logback.core.ConsoleAppender\">\n    <encoder>\n      <pattern>%date %coloredLevel %logger{15} - %message%n%xException{10}</pattern>\n    </encoder>\n  </appender>\n\n  <appender name=\"ASYNCFILE\" class=\"ch.qos.logback.classic.AsyncAppender\">\n    <appender-ref ref=\"FILE\" />\n  </appender>\n\n  <appender name=\"ASYNCSTDOUT\" class=\"ch.qos.logback.classic.AsyncAppender\">\n    <appender-ref ref=\"STDOUT\" />\n  </appender>\n\n  <logger name=\"play\" level=\"INFO\" />\n  <logger name=\"application\" level=\"INFO\" />\n  <logger name=\"com.ac.datalineage\" level=\"INFO\" />\n\n  <!--\n  Turn on slow query logging by setting this logger to DEBUG; \n  set level to TRACE to also log query parameters \n  -->\n  <logger name=\"com.datastax.driver.core.QueryLogger.SLOW\" level=\"OFF\" />\n\n  <!-- Off these ones as they are annoying, and anyway we manage configuration ourselves -->\n  <logger name=\"com.avaje.ebean.config.PropertyMapLoader\" level=\"OFF\" />\n  <logger name=\"com.avaje.ebeaninternal.server.core.XmlConfigLoader\" level=\"OFF\" />\n  <logger name=\"com.avaje.ebeaninternal.server.lib.BackgroundThread\" level=\"OFF\" />\n  <logger name=\"com.gargoylesoftware.htmlunit.javascript\" level=\"OFF\" />\n\n  <root level=\"WARN\">\n    <appender-ref ref=\"ASYNCFILE\" />\n    <appender-ref ref=\"ASYNCSTDOUT\" />\n  </root>\n\n</configuration>"
  }
}

