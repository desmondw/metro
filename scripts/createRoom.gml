globalvar tileSize, colors;

//vars
var colors;
    colors[0] = make_color_rgb(162,0,255);  //purple
    colors[1] = make_color_rgb(255,0,151);  //magenta
    colors[2] = make_color_rgb(0,141,109);  //teal
    colors[3] = make_color_rgb(140,191,38); //lime
    colors[4] = make_color_rgb(160,80,0);   //brown
    colors[5] = make_color_rgb(230,113,184);//pink
    colors[6] = make_color_rgb(240,150,9);  //orange
    colors[7] = make_color_rgb(27,161,226); //blue
    colors[8] = make_color_rgb(229,20,0);   //red
    colors[9] = make_color_rgb(51,153,51);  //green

var tiles;
var level = argument0;
var gridSize = level + 1;
var playArea = WIN_HEIGHT - PLAY_AREA_PADDING * 2;
var tilePadding = playArea / (gridSize - 1) * .1;
if (tilePadding > TILE_PADDING_CAP)
    tilePadding = TILE_PADDING_CAP;
tileSize = (playArea - (gridSize - 1) * tilePadding) / gridSize;
room.tileSize = tileSize;



//draw squares
for (i=0; i<gridSize; i++){
    for (j=0; j<gridSize; j++){
        var tileX = GAME_OFFSET_X + PLAY_AREA_PADDING + i*(tileSize + tilePadding);
        var tileY = PLAY_AREA_PADDING + j*(tileSize + tilePadding);
        tiles[i,j] = instance_create(tileX, tileY, obj_square);
        
        tiles[i,j].image_xscale = tileSize; // x size
        tiles[i,j].image_yscale = tileSize; // y size
        tiles[i,j].targetScaleX = tileSize;
        tiles[i,j].targetScaleY = tileSize;
    /*
        //if (false){ //handle mouse starting level over a square hovering
        //    tiles[i,j].x -= (tileSize * HOVER_SCALE - tileSize) / 2;
        //    tiles[i,j].y -= (tileSize * HOVER_SCALE - tileSize) / 2;
        //    tiles[i,j].image_xscale = tileSize * HOVER_SCALE; // x size
        //    tiles[i,j].image_yscale = tileSize * HOVER_SCALE; // y size
        //    tiles[i,j].depth -= 100;
        //}
        //else{
            tiles[i,j].image_xscale = tileSize; // x size
            tiles[i,j].image_yscale = tileSize; // y size
        //}
        */
        
        tiles[i,j].image_blend = colors[irandom_range(0,level-1)]; //color
        tiles[i,j].win = false;
    }
}

//choose random square to seed next color
randomize();
i = irandom_range(0,gridSize-1);
j = irandom_range(0,gridSize-1);
tiles[i,j].image_blend = colors[level]; //color
tiles[i,j].win = true;

//move tiles on screen

