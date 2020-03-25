void keyPressed() {
	if(key == ' '){
		currentMove.start();
		//started = true;
		//counter = 0;
	}
	applyMove(key);
	//applyMove(key);
}

void applyMove(char move) {
	switch (move) {
		case 'f' :
			currentMove = allMoves[8];
			currentMove.start();
		break;

		case 'F' :
			currentMove = allMoves[9];
			currentMove.start();
		break;	
		
		case 'b' :
			currentMove = allMoves[10];
			currentMove.start();
		break;

		case 'B' :
			currentMove = allMoves[11];
			currentMove.start();
		break;

		case 'u' :
			currentMove = allMoves[0];
			currentMove.start();
		break;	
		
		case 'U' :
			currentMove = allMoves[1];
			currentMove.start();
		break;

		case 'd' :
			currentMove = allMoves[2];
			currentMove.start();
		break;

		case 'D' :
			currentMove = allMoves[3];
			currentMove.start();
		break;	
		
		case 'r' :
			currentMove = allMoves[6];
			currentMove.start();
		break;

		case 'R' : 
			currentMove = allMoves[7];
			currentMove.start();
		break;

		case 'l' :
			currentMove = allMoves[4];
			currentMove.start();
		break;

		case 'L' : 
			currentMove = allMoves[5];
			currentMove.start();
		break;
	}
}