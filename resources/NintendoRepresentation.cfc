component extends="taffy.core.baseSerializer" {
    function getAsJSON() taffy_mime="application/json" taffy_default="true" output="false" {
        return serializeJson(variables.data);
    }
}
