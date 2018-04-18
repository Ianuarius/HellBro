/// @description Insert description here
// You can write your code in this editor

var fullscreen = window_get_fullscreen()

if (fullscreen)
{
	window_set_fullscreen(false);
}
else
{
	window_set_fullscreen(true);
}