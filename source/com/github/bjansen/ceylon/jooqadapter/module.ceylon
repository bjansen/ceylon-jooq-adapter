native("jvm")
module com.github.bjansen.ceylon.jooqadapter "1.0.0" {
    shared import "org.jooq:jooq" "3.7.0";
    shared import "org.jooq:jooq-codegen" "3.7.0";
    shared import "org.jooq:jooq-meta" "3.7.0";
    
    shared import java.base "8";
    shared import java.jdbc "8";
    shared import ceylon.time "1.2.0";

    import ceylon.interop.java "1.2.0";
}
