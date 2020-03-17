component extends="taffy.core.resource" taffy_uri="/games" {

    function get()
    {
        cfquery(name = "getGames", datasource = "nintendo", returntype = "array") {
        echo("
                SELECT id, name
                FROM Game
            ");
    }

        return rep(getGames).withStatus(200);
    }

    function post(required string name)
    {
        transaction {
            try {
                var queryParams = {
                    name: {
                        type:'varchar', value:arguments.name
                    }
                };

                cfquery(name = "insertGame", result = "insertGameRes", datasource = "nintendo", params = queryParams) {
                    echo("
                        INSERT INTO Game(name)
                        VALUES (:name)
                    ");
                }

                var newGameId = insertGameRes.generatedKey;

                transaction action="commit";
                return rep({"id":newGameId}).withStatus(201, "Game Created");
            } catch (any e) {
                transaction action="rollback";
                return noData().withStatus(500, "Can't create Game: " & e.toString());
            }
        }

    }
};

