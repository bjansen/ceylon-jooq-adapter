package com.github.bjansen.ceylon.jooqadapter;

import org.jooq.util.DefaultGeneratorStrategy;
import org.jooq.util.Definition;

public class CeylonNamingStrategy extends DefaultGeneratorStrategy {

    @Override
    public String getJavaIdentifier(Definition definition) {
        return org.jooq.tools.StringUtils.toCamelCaseLC(definition.getOutputName());
    }
}
