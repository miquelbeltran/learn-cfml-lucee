component extends="taffy.core.resource" taffy_uri="/games" {

    function get(){
        cfquery(name="getGames", datasource="nintendo", returntype="array") {
            echo("
                SELECT id, name
                FROM Game
            ");
        }

        return rep(getGames).withStatus(200);
    }
};
