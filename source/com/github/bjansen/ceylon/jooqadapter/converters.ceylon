import org.jooq {
    Converter
}
import java.lang {
    JString = String,
    JInteger = Integer,
    Class,
    JByte=Byte
}
import ceylon.interop.java {
    javaClass,
    javaString
}
import ceylon.time {
    DateTime,
    Instant
}
import java.sql {
    Timestamp
}

shared class StringConverter() satisfies Converter<JString, String> {
    shared actual String? from(JString? t) => if (exists t) then t.string else null;
    
    shared actual Class<JString> fromType() => javaClass<JString>();
    
    shared actual JString? to(String? u) => if (exists u) then javaString(u) else null;
    
    shared actual Class<String> toType() => javaClass<String>();
}

shared class IntegerConverter() satisfies Converter<JInteger, Integer> {
    shared actual Integer? from(JInteger? t) => if (exists t) then t.intValue() else null;
    
    shared actual Class<JInteger> fromType() => javaClass<JInteger>();
    
    shared actual JInteger? to(Integer? u) => if (exists u) then JInteger(u) else null;
    
    shared actual Class<Integer> toType() => javaClass<Integer>();
}

shared class DateTimeConverter() satisfies Converter<Timestamp, DateTime> {
    shared actual DateTime? from(Timestamp? t) => if (exists t) then Instant(t.time).dateTime() else null;
    
    shared actual Class<Timestamp> fromType() => javaClass<Timestamp>();
    
    shared actual Timestamp? to(DateTime? u) => if (exists u) then Timestamp(u.instant().millisecondsOfEpoch) else null;
    
    shared actual Class<DateTime> toType() => javaClass<DateTime>();
}

shared class BooleanConverter() satisfies Converter<JByte, Boolean> {
    Boolean parse(JByte b) {
        return if (b == 0) then false else true;
    }

    shared actual Boolean? from(JByte? t) => if (exists t) then parse(t) else null;
    
    shared actual Class<JByte> fromType() => javaClass<JByte>();
    
    shared actual JByte? to(Boolean? u) => if (exists u)
                                           then if (u) then JByte(Byte(1)) else JByte(Byte(0))
                                           else null;
    
    shared actual Class<Boolean> toType() => javaClass<Boolean>();
}
