component extends="taffy.core.resource" taffy_uri="/games/{gameId}" {

	// while this is more efficient to run as a single SQL query,
	// I wanted to experiment a bit with multiple queries and operations with the results.

	function get(){
		queryParams = { id : { type : "int", value : gameId } };

		cfquery(name="getGame", datasource="nintendo", params=queryParams, returntype="array") {
			echo(
				"
                SELECT id, name
                FROM Game
                WHERE id = :id
            "
			);
		}

		cfquery(name="getGameScore", datasource="nintendo", params=queryParams, returntype="array") {
			echo(
				"
                SELECT score
                FROM Score
                WHERE game_id = :id
            "
			);
		}

		totalScore = new Score().calculateScore( getGameScore );

		return rep( { "id" : getGame[ 1 ].id, "name" : getGame[ 1 ].name, "score" : totalScore } ).withStatus( 200 );
	}

}
