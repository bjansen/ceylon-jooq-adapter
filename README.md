# ceylon-jooq-adapter
Easy integration of jOOQ in your Ceylon project.

## Usage

**module.ceylon:**

```ceylon
native("jvm")
module com.my.module "1.0.0" {
    import com.github.bjansen.ceylon.jooqadapter "0.1.0";
}
```

**jooq-config.xml**:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<configuration xmlns="http://www.jooq.org/xsd/jooq-codegen-3.6.0.xsd">
  ...
  
  <generator>
    <name>org.jooq.util.DefaultGenerator</name>

    <strategy>
        <name>com.github.bjansen.ceylon.jooqadapter.CeylonNamingStrategy</name>
    </strategy>
    
    <database>
      ...
      
      <customTypes>
      	<customType>
            <name>DateTime</name>
            <type>ceylon.time.DateTime</type>
            <converter>com.github.bjansen.ceylon.jooqadapter.DateTimeConverter</converter>
      	</customType>
        <customType>
            <name>String</name>
            <type>ceylon.language.String</type>
            <converter>com.github.bjansen.ceylon.jooqadapter.StringConverter</converter>
        </customType>
        ...
      </customTypes>
      
      <forcedTypes>
      	<forcedType>
      		<name>DateTime</name>
      		<types>datetime</types>
      	</forcedType>
        <forcedType>
            <name>Integer</name>
            <types>(integer|int)</types>
        </forcedType>
        ...
      </forcedTypes>
    </database>
  </generator>
</configuration>
```

More information here: [Ceylon + jOOQ = <3](http://bjansen.github.io/ceylon/2015/08/24/ceylon-plus-jooq-equals-heart.html)
