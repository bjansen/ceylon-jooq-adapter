"Provides easy interoperability between jOOQ and your Ceylon application:
 
 * a naming strategy to generate Ceylon-friendly lowercase identifiers
 * converters to use Ceylon types in POJOs (`String`, `Integer`, `DateTime` etc)
 "
native("jvm")
module com.github.bjansen.ceylon.jooqadapter "0.2.0" {
    shared import maven:"org.jooq":"jooq" "3.9.1";
    shared import maven:"org.jooq":"jooq-codegen" "3.9.1";
    shared import maven:"org.jooq":"jooq-meta" "3.9.1";
    
    shared import java.base "8";
    shared import java.jdbc "8";
    shared import ceylon.time "1.3.2";

    import ceylon.interop.java "1.3.2";
}
