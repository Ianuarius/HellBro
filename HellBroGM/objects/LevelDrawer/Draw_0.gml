/// @description Insert description here
// You can write your code in this editor

//global.dll_cube = external_define("Example.dll", "cube", dll_cdecl, ty_real, 1, ty_real);
//dll_ab = external_define("Example.dll", "aplusb", dll_cdecl, ty_real, 1, ty_real);
//draw_text(32, 32, "3 cubed: "+string(external_call(global.dll_cube, 4)));
//draw_text(32, 48, "4 cubed: "+string(script_execute(CubeScript,external_cube(4))));


for (y = 0; y < ds_grid_height(global.level_grid); y++)
{
	for(x = 0; x < ds_grid_width(global.level_grid); x++)
	{
		draw_tile(LevelTileset, ds_grid_get(global.level_grid, x, y), 0, x*tilesize, y*tilesize);
	}
}