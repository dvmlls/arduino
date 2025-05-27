# define BLUE 3
# define GREEN 5
# define RED 6

void setup() {
    pinMode(RED, OUTPUT);
    pinMode(GREEN, OUTPUT);
    pinMode(BLUE, OUTPUT);
}

int red = 255;
int green = 0;
int blue = 0;

int increment = 5;
int sleep = 5;

int segment = RED;

void loop() {
	switch(segment) {
		case RED:
			if (red == 255) {
				segment = BLUE;
			} else {
				red += increment;
				green -= increment;
			}
			break;
		case BLUE: 
			if (blue == 255) {
				segment = GREEN;
			} else {
				blue += increment;
				red -= increment;
			}
			break;
		case GREEN:
			if (green == 255) {
				segment = RED;
			} else {
				green += increment;
				blue -= increment;
			}
			break;
	}
	analogWrite(RED, red);
	analogWrite(GREEN, green);
	analogWrite(BLUE, blue);
	delay(sleep);
}
