
// Set a size for a room

var min_mroom_size = 10;
var max_mroom_size = 20;
max_mroom_size -= min_mroom_size;
var mroom_width = random(max_mroom_size) + min_mroom_size;
var mroom_height = random(max_mroom_size) + min_mroom_size;
var mroom_placeable = false;
var max_tries = 10;
random_set_seed(current_time);

// Generate a location for the room

do {
	var tries = 0;
	var place_taken = false;
	var mroom_x = random(level_width);
	if (mroom_x > level_width - mroom_width - 2)
	{
		mroom_x = level_width - mroom_width - 2;
	}
	
	
	var mroom_y = random(level_width);
	if (mroom_y > level_height - mroom_height - 2)
	{
		mroom_y = level_height - mroom_height - 2;
	}
	// Check if the location is already taken


	for (y = 0; y < mroom_height; y++)
	{
		for(x = 0; x < mroom_width; x++)
		{
			if (ds_grid_get(global.level_grid, mroom_x + x, mroom_y + y) != 1)
			{
				place_taken = true;
			}
		}
	}
	if (place_taken == false)
	{
		mroom_placeable = true;
	}
	
	tries++;
	if (tries > max_tries)
	{
		break;
	}
} until (mroom_placeable == true);
// If yes, generate a new location

mroom_grid = ds_grid_create(mroom_width, mroom_height);

for (y = 0; y < ds_grid_height(mroom_grid); y++)
{
	for(x = 0; x < ds_grid_width(mroom_grid); x++)
	{
		ds_grid_set(mroom_grid, x, y, 2);
	}
}


// Horizontal stuff
for (x = 0; x < mroom_width-1; x++)
{
	// Left side of the wall
	if (x == 0)
	{
		// Place top wall
		ds_grid_set(mroom_grid, x, 0, 16);
	
		// Place bottom wall
		ds_grid_set(mroom_grid, x, mroom_height-1, 96);
			
		// Place bottom wall
		ds_grid_set(mroom_grid, x, mroom_height-2, 80);
			
		// Place bottom wall
		ds_grid_set(mroom_grid, x, mroom_height-3, 48);
	}
	else
	{
		// Right side of the wall
		if (x == ds_grid_width(mroom_grid)-1)
		{
			// Place top wall
			ds_grid_set(mroom_grid, x, 0, 18);
	
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-1, 98);
			
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-2, 82);
			
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-3, 50);
		}
		// Straight wall
		else
		{
			// Place top wall
			ds_grid_set(mroom_grid, x, 0, 65);
	
			// Place top wall
			ds_grid_set(mroom_grid, x, 1, 81);
	
			// Place top wall
			ds_grid_set(mroom_grid, x, 2, 97);
	
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-1, 97);
			
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-2, 81);
			
			// Place bottom wall
			ds_grid_set(mroom_grid, x, mroom_height-3, 65);
		}
	}
}

// Vertical stuff
for (y = 1; y < mroom_height-4; y++)
{
	// Place left wall
	ds_grid_set(mroom_grid, 0, y, 35);
	
	// Place right wall
	ds_grid_set(mroom_grid, mroom_width-1, y, 35);
}



// Place correct tiles to level
for (y = 0; y < mroom_height-1; y++)
{
	for(x = 0; x < mroom_width-1; x++)
	{
		ds_grid_set(global.level_grid, mroom_x + x, mroom_y + y, ds_grid_get(mroom_grid, x, y));
	}
}

