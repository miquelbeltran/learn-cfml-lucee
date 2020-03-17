component extends="taffy.core.resource" taffy_uri="/games/{gameId}/score" {

    function post(required string score)
    {
        transaction {
            try {
                var queryParams = {
                    score: {
                        type:'int', value:arguments.score
                    },
                    gameId: {
                        type:'int', value: gameId
                    }
                };

                cfquery(name = "addScore", result = "addScoreRes", datasource = "nintendo", params = queryParams) {
                    echo("
                        INSERT INTO Score(game_id, score)
                        VALUES (:gameId, :score)
                    ");
                }

                var newScoreId = addScoreRes.generatedKey;

                transaction action="commit";
                return rep({"id":newScoreId}).withStatus(201, "Score added");
            } catch (any e) {
                transaction action="rollback";
                return noData().withStatus(500, "Can't add score: " & e.toString());
            }
        }

    }
};
