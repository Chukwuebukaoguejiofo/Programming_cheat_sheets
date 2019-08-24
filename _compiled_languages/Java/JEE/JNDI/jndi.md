# JNDI


// https://www.baeldung.com/jndi



```java
JndiTemplate jndiTemplate = new JndiTemplate();
ctx = (InitialContext) jndiTemplate.getContext();


ds = new DriverManagerDataSource("jdbc:h2:mem:mydb");
ctx.bind("java:comp/env/jdbc/datasource", ds);

DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/datasource");

```
