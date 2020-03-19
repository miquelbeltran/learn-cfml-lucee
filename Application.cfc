component extends="taffy.core.api" {

	this.name        = "Learn-Lucee";
	variables.system = createObject( "java", "java.lang.System" );

	variables.framework                      = {};
	variables.framework.serializer           = "resources.NintendoRepresentation";
	variables.framework.reloadOnEveryRequest = true;

}
