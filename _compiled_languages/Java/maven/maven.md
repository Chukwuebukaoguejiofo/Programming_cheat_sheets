# Maven usage

- https://youtu.be/sNEcpw8LPpo

###### maven, eclipse, java ee
- https://www.google.com/amp/s/mobiarch.wordpress.com/2014/08/20/with-maven-eclipse-and-java-ee/amp/


###### Create a Java EE 7 app
```bash
$ mvn -DarchetypeGroupId=org.codehaus.mojo.archetypes \
      -DarchetypeArtifactId=webapp-javaee7 \
      -DarchetypeVersion=1.1 \
      -DgroupId=com.example.myapp \
      -DartifactId=my-blog \
      -Dversion=1.0 \
      -Darchetype.interactive=false \
      --batch-mode \
      -Dpackage=com.example.my-blog \
      archetype:generate
```
