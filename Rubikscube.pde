import peasy.*;

PeasyCam cam;  //Library Cam

int dim = 3; // Dimension
Cubie cube[] = new Cubie[dim*dim*dim]; //Cube

Move[] allMoves = new Move[] {
	new Move(0,-1,0,1), //Up
	new Move(0,-1,0,-1),
	new Move(0,1,0,1), // Down
	new Move(0,1,0,-1),
	new Move(1,0,0,1), //Left
	new Move(1,0,0,-1),
	new Move(-1,0,0,1), //Right
	new Move(-1,0,0,-1),
	new Move(0,0,1,1), // Front
	new Move(0,0,1,-1), 
	new Move(0,0,-1,1), //Bottom
	new Move(0,0,-1,-1),
};
ArrayList<Move> sequence = new ArrayList<Move>(); //ArrayList of move
int counter = 0;
boolean started = false;

Move currentMove; //Temporary 

float speed = 0.2; //Rotation Speed

//------------------------------------------------------------------------------------------------------------------------------------------

void settings(){
	//size(600,600,P3D);
	fullScreen(P3D);
}

//------------------------------------------------------------------------------------------------------------------------------------------

void setup() {
	cam = new PeasyCam(this,400);
	//Cube creation
	int index = 0;
	for (int x = -1; x <= 1; ++x) {
		for (int y = -1; y <= 1; ++y) {
			for (int z = -1; z <= 1; ++z) {
				PMatrix3D matrix = new PMatrix3D();
				matrix.translate(x, y, z);
				cube[index] = new Cubie(matrix,x,y,z);
				index++;
			}
		}
	}
	//creationtion of the sequence
	for (int i = 0; i < 50; ++i) {
		int r = int(random(allMoves.length));
		Move m = allMoves[r];
		sequence.add(m);
	}

	currentMove = sequence.get(counter);

	for (int i = sequence.size()-1; i >= 0; --i) {
		Move nextMove = sequence.get(i).copy();
		nextMove.reverse();
		sequence.add(nextMove);
	}

}

//------------------------------------------------------------------------------------------------------------------------------------------

// String flipCase(char letter) {
// 	String s = "" + letter;
// 	if(s.equals(s.toLowerCase())){
// 		return s.toUpperCase();
// 	} else {
// 		return s.toLowerCase();
// 	}
// }

//------------------------------------------------------------------------------------------------------------------------------------------

void draw() {
	background(51);
	//Default Postion
	rotateX(-0.5);
	rotateY(0.4);
	rotateZ(0.1);

	//Move
	currentMove.update();
	if(currentMove.finish()){
		if(counter < sequence.size()-1){
			counter++;
			currentMove = sequence.get(counter);
			currentMove.start();
		}
	}
	
	

	
	scale(50); 

	for (int i = 0; i < cube.length; ++i) {
		push();
		if(abs(cube[i].z) > 0 && cube[i].z == currentMove.z){
			rotateZ(currentMove.angle);
		} else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
			rotateX(currentMove.angle);
		} else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
			rotateY(-currentMove.angle);
		}
		cube[i].show();
		pop();
	}
}
//------------------------------------------------------------------------------------------------------------------------------------------