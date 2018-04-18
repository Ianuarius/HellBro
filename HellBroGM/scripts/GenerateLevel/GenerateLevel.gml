

var max_rooms = 20;

// Shuffle the amount of rooms generated in the level.
var number_of_rooms = random(max_rooms);

for (i = 0; i < number_of_rooms; i++)
{
	GenerateRoom();
}