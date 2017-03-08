import ceylon.interop.java {
    javaClass,
    javaString
}
import ceylon.time {
    DateTime,
    Instant
}

import java.lang {
    JString=String,
    JInteger=Integer,
    JFloat=Float,
    Class,
    JByte=Byte
}
import java.sql {
    Timestamp
}

import org.jooq {
    Converter
}

shared class StringConverter() satisfies Converter<JString,String> {
    shared actual String? from(JString? t) => if (exists t) then t.string else null;
    
    shared actual Class<JString> fromType() => javaClass<JString>();
    
    shared actual JString? to(String? u) => if (exists u) then javaString(u) else null;
    
    shared actual Class<String> toType() => javaClass<String>();
}

shared class IntegerConverter() satisfies Converter<JInteger,Integer> {
    shared actual Integer? from(JInteger? t) => if (exists t) then t.intValue() else null;
    
    shared actual Class<JInteger> fromType() => javaClass<JInteger>();
    
    shared actual JInteger? to(Integer? u) => if (exists u) then JInteger(u) else null;
    
    shared actual Class<Integer> toType() => javaClass<Integer>();
}

shared class FloatConverter() satisfies Converter<JFloat,Float> {
    shared actual Float? from(JFloat? t) => if (exists t) then t.floatValue() else null;
    
    shared actual Class<JFloat> fromType() => javaClass<JFloat>();
    
    shared actual JFloat? to(Float? u) => if (exists u) then JFloat(u) else null;
    
    shared actual Class<Float> toType() => javaClass<Float>();
}

shared class DateTimeConverter() satisfies Converter<Timestamp,DateTime> {
    shared actual DateTime? from(Timestamp? t)
            => if (exists t) then Instant(t.time).dateTime() else null;
    
    shared actual Class<Timestamp> fromType() => javaClass<Timestamp>();
    
    shared actual Timestamp? to(DateTime? u)
            => if (exists u) then Timestamp(u.instant().millisecondsOfEpoch) else null;
    
    shared actual Class<DateTime> toType() => javaClass<DateTime>();
}

shared class BooleanConverter() satisfies Converter<JByte,Boolean> {
    Boolean parse(JByte b) {
        return if (b.intValue() == 0) then false else true;
    }
    
    shared actual Boolean? from(JByte? t) => if (exists t) then parse(t) else null;
    
    shared actual Class<JByte> fromType() => javaClass<JByte>();
    
    shared actual JByte? to(Boolean? u) => if (exists u)
    then if (u) then JByte(Byte(1)) else JByte(Byte(0))
    else null;
    
    shared actual Class<Boolean> toType() => javaClass<Boolean>();
}
