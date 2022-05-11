
 /*
 This is a ball game: 
 - player #1 and #2 pass to each other
 - player #3 and #4 pass to each other
 - ball starts at palyer #1

 Can you show that the ball is never at #4?

 This example explains how inductive reasoning works. It is explained in this lecture https://www.youtube.com/watch?v=30BspXZs7q8 . 
 Try understanding the counterexample and fix the rule

**/

contract BallGame {
	uint256 public ballAt = 1;

	function pass() public {
		require (ballAt >= 1 && ballAt <= 4);
		if (ballAt == 1)
			ballAt = 2;
		else if (ballAt == 2)
			ballAt = 1;
		else if (ballAt == 3)
			ballAt = 4;
		else if (ballAt == 4)
			ballAt = 3;
	}

}