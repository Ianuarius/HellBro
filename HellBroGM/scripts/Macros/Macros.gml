#macro tilesize 16
#macro level_width 70
#macro level_height 40

global.level_grid = ds_grid_create(level_width, level_height);

for (y = 0; y < ds_grid_height(global.level_grid); y++)
{
	for(x = 0; x < ds_grid_width(global.level_grid); x++)
	{
		ds_grid_set(global.level_grid, x, y, 1);
	}
}