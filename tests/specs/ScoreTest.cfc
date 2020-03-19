component extends="testbox.system.BaseSpec" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		application.salvador = 1;
	}

	function afterAll(){
		structClear( application );
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "Score Spec", function(){
			it( "calculate total score", function(){
				score = new Score();
				total = score.calculateScore( [ { score : 1 }, { score : 2 } ] );
				expect( total ).toBe( 3 );
			} );
		} );
	}

}
