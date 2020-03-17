component accessors="true" {

    // Moved function into a component so it can be easily tested
    function calculateScore(required scores) {
        totalScore = 0;
        for (var score in scores) {
            totalScore += score.score;
        }
        return totalScore;
    }
}
