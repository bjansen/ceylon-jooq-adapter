import org.jooq.util {
    DefaultGeneratorStrategy,
    Definition
}
import org.jooq.tools {
    StringUtils
}

shared class CeylonNamingStrategy() extends DefaultGeneratorStrategy() {
    getJavaIdentifier(Definition definition)
            => StringUtils.toCamelCaseLC(definition.outputName);
}
