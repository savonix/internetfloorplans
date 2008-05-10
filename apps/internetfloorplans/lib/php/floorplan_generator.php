<?php
/*
Program: Internet Floor Plans
Component: floorplan_generator.php
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
*/
// Copyright Savonix Corporation 2003-2006


$x_shift=0;
// This is 3/4 the size of an 11x11 page. 
$movie_width=825;
$movie_height=825;


$status_symbols = "no";
$my_rotation_angle=0;
$equipment_status=0;
$my_aid="";
$num_icons = 0;
$account_id = $_SESSION['NX_AUTH']['account_id'];
$this_url=$_SERVER['REQUEST_URI'];

$space_plan_locked = Nexista_Path::get("//get_sp_pointer_by_id/space_plan_locked","flow");
if($space_plan_locked=="false") { 
	$space_plan_locked=false;
} elseif($space_plan_locked=="true") { 
	$space_plan_locked=true;
}

// ming floorplan generator
Ming_setScale(20.0);
ming_useswfversion(6);
$m = new SWFMovie();
$m->setRate(0);
$m->setDimension($movie_width, $movie_height);

$path = $_SERVER['SCRIPT_FILENAME'];
$path = dirname(dirname($path));



$f = new SWFFont("_sans");


$roles = Nexista_Path::get("//user_roles","flow");
$file_path = Nexista_Path::get("//get_sp_pointer_by_id/space_plan_pointer","flow"); 
$x_position = Nexista_Path::get("//get_sp_pointer_by_id/x_position","flow"); 
$y_shift = Nexista_Path::get("//get_sp_pointer_by_id/y_position","flow"); 
$key_x_position = Nexista_Path::get("//get_sp_pointer_by_id/key_x_position","flow"); 
$key_y_position = Nexista_Path::get("//get_sp_pointer_by_id/key_y_position","flow"); 

if($key_x_position > 775 || $key_x_position < 25) { 
	$key_x_position = 25;
}

if($key_y_position > 775 || $key_y_position < 25) { 
	$key_y_position = 25;
}

$location_space_plan_id = Nexista_Path::get("//_get/location_space_plan_id","flow");

if(empty($key_x_position)) { $key_x_position=0;}
if(empty($key_y_position)) { $key_y_position=0;}

$x_shift=$x_shift+$x_position;
$display_eqp_icons=Nexista_Path::get("//get_sp_pointer_by_id/display_eqp_icons","flow"); 

$my_address_id = Nexista_Path::get("//_get/location_address_id","flow"); 
$a_path = $path."/usr/".$account_id; 

$file = $a_path . "/spaceplans/" . $file_path;

if(strpos($file_path,".swf")) { 
	$sp_clip = new SWFPrebuiltClip(fopen($file, "r")); 
} else { 
	$jpg_file = $file.".jpg";
	$sp_clip = new SWFBitmap(fopen($jpg_file, "r")); 
}

$fpbk = new SWFSprite();
$fpbk->add($sp_clip);
$fpbk->nextFrame();
$y = $m->add($fpbk);
$y->moveTo($x_shift,$y_shift);
$y->setName("background");


$entire_key = new SWFSprite();
$key_label = new SWFTextField(SWFTEXTFIELD_NOSELECT);
$key_label->setBounds(150,25);
$key_label->setFont($f);
$key_label->setHeight(14);
if($space_plan_locked===false) { 
	$key_label->setColor(0,0,0);
	$key_label_text = "Merchandising Key";
} else  {
	$key_label->setColor(255,0,0);
	$key_label_text = "Plan Is Locked";
}
$key_label->addString($key_label_text);
$my_key_label_header = new SWFShape();
$my_key_label_header->setLine(1,0,0,0);
$my_key_label_header->setRightFill(240,240,240);
$my_key_label_header->movePenTo(0,5); 
$my_key_label_header->drawLine(150,0);  
$my_key_label_header->drawLine(0,25); 
$my_key_label_header->drawLine(-150,0); 
$my_key_label_header->drawLine(0,-25); 
$my_key_label = new SWFSprite();
$my_key_label->add($my_key_label_header);
$key_spr = $my_key_label->add($key_label);
$key_spr->moveTo(5,7);
$my_key_label->nextFrame();
$my_key_label_sprite = $entire_key->add($my_key_label);
$my_key_label_sprite->setName("my_key_label");


if($display_eqp_icons=="checked") { 
	$ind_path = $path."/htdocs/resources/img/style-1.1/images/";
	if($status_symbol=="yes") { 
		$ex_clip = new SWFBitmap(fopen($ind_path."icon_warning_sml.jpg","r"));
		$check_clip = new SWFBitmap(fopen($ind_path."icon_warning_sml.jpg","r"));
		$equals_clip = new SWFBitmap(fopen($ind_path."icon_warning_sml.jpg","r"));
	}

	$empty_sprite = new SWFSprite();
	$m->addExport($empty_sprite,'container');
                       

$main_actionscript = "

var greyscale = 225;
var j=1;
var gf = new flash.filters.GlowFilter(0xFFCC00, 10, 5, 5, 2, 1, false, false);
var selection;

background.useHandCursor = false;

background.onPress=function(){
	selection.selected=false;
	selection.filters=null;
	selection=null;
};
onMouseDown=function() { 
	getUrl('about:blank','config', 'GET');
};
onMouseUp=function() {
	stopDrag();
};

function argbtohex(a, r, g, b)
{
	return (a<<24 | r<<16 | g<<8 | b);
}

// ICON CLASS
function createIcon() { 
	var equipment_type_symbol = this.equipment_type_symbol;
	Object.registerClass('container', createNewFixture);
	handle = attachMovie('container',equipment_type_symbol, getNextHighestDepth());

	key_icon = entire_key.attachMovie('container',equipment_type_symbol,getNextHighestDepth(),
		{_x:0,_y:this._y,equipment_type_id:this.equipment_type_id,equipment_type_image_id:this.equipment_type_image_id});
	key_icon.my_bitmap = new flash.display.BitmapData(this._width,this._height,true,0x00000000);
	key_icon.attachBitmap(key_icon.my_bitmap, 1);
	key_icon.my_bitmap.draw(this);

	for(i=_root.j;i>=0;--i) { 
		var rgb = _root.greyscale-i;
		var my_color = _root.argbtohex(255,rgb,rgb,rgb);
		key_icon.my_bitmap.threshold(key_icon.my_bitmap,key_icon.my_bitmap.rectangle,key_icon.my_bitmap.rectangle.topLeft,'>=',my_color,0x00000000,my_color,true);
	}
};
createIcon.prototype = new MovieClip();

// NEW FIXTURE CLASS
function createNewFixture() {};
createNewFixture.prototype = new MovieClip();

createNewFixture.prototype.onPress=function() { 
	this.createEmptyMovieClip('newone', getNextHighestDepth());
	this.newone.attachBitmap(this.my_bitmap,2,auto,false);
	this.newone.startDrag(lock);
};
createNewFixture.prototype.onRelease=createNewFixture.prototype.onReleaseOutside=function() { 
	location_address_id=$my_address_id;
	equipment_type_id=this.equipment_type_id;
	submit='Submit';
	x_position = _root._xmouse;
	y_position = _root._ymouse;
	getURL('/acc/link/loc/view/sp/&location_address_id=$my_address_id', '', 'POST');
};
createNewFixture.prototype.onRollOver=function() { 
	var dconf = new LoadVars();
	dconf.location_equipment_id=100;
	dconf.equipment_type_id=this.equipment_type_id;
	dconf.equipment_type_image_id=this.equipment_type_image_id;
	dconf.send('/acc/link/types/display_config/&body=true','config', 'POST');
	dconf = null;
};


// INVENTORY CLASS
function positionFixture() {
	this.createEmptyMovieClip('symbol', this.getNextHighestDepth());
	this.symbol.cacheAsBitmap = false;
	this.symbol.createEmptyMovieClip('bitmap', this.getNextHighestDepth());
	this.symbol.bitmap.attachBitmap(this.bitmap,2,auto,true);
	this.symbol.bitmap._x=-this.symbol.bitmap._width/2;
	this.symbol.bitmap._y=-this.symbol.bitmap._height/2;
	this.symbol._rotation=this.symbol_rotation;
	this.onPress=function() { 
		// If clicked by not selected, select.
		if(this.selected!=true) { 
			this.startDrag(lock);
			selection.selected = null;
			selection.filters = [];
			this.filters = [gf];
			this.selected=true;
			selection=this;

		} else { 
			var my_corrFactor = 0;
			if (this._xmouse < 0){
				my_corrFactor = 180;
			}
			var counterbalance = (57.29578*(Math.atan(this._ymouse/this._xmouse)))+my_corrFactor;
			this.onMouseMove=function() { 
				degreeAngle = (57.29578*(Math.atan(this._ymouse/this._xmouse)))-counterbalance;
				corrFactor = 0;
				if (this._xmouse < 0){
					corrFactor = 180;
				}
				this.symbol._rotation = 15*int(degreeAngle/15)+corrFactor+this.symbol_rotation;
			};
		}
	};
	this.onRelease=this.onReleaseOutside=function() { 
		this.onMouseMove = null;
		if(x_position!=this._x || y_position!=this._y || my_rotation!=this.symbol._rotation) {
			var update_position = new LoadVars();
			update_position.location_equipment_id=this.my_leid;
			update_position.x_position = this._x - $x_shift;
			update_position.y_position = this._y;
			update_position.rotation_angle = this.symbol._rotation;
			update_position.sendAndLoad('/acc/link/loc/view/eqp/edit_loc/&is_server=yes',update_position,'POST');
			update_position = null;
			this.symbol_rotation=this.symbol._rotation;
		} 

			// display_config
			var my_dconf = new LoadVars();
			my_dconf.location_equipment_id=this.my_leid;
			my_dconf.equipment_id=this.my_eid;
			my_dconf.location_address_id=$my_address_id;
			my_dconf.equipment_type_id=this.equipment_type_id;
			my_dconf.equipment_type_image_id=this.equipment_type_image_id;
			my_dconf.send('/acc/link/types/display_config/&body=true','config', 'POST'); 
			my_dconf = null;
	};
};


positionFixture.prototype = new MovieClip();




entire_key.my_key_label.onPress=function(){ 
	_root.entire_key.startDrag(lock);
}; 
entire_key.my_key_label.onRelease=entire_key.my_key_label.onReleaseOutside=function(){ 
	var update_key = new LoadVars();
	update_key.key_x_position = _root.entire_key._x;
	update_key.key_y_position = _root.entire_key._y;
	update_key.location_space_plan_id = '$location_space_plan_id';
	update_key.location_address_id = '$my_address_id';
	update_key.sendAndLoad('/acc/link/loc/view/set-key-position/&is_server=yes',update_key,'POST');
};
entire_key.cacheAsBitmap = true;
";







$symbol_pointers['filename'] = Nexista_Path::get("//get_account_symbol_pointers/symbol_pointer","flow");
$symbol_pointers['name'] = Nexista_Path::get("//get_account_symbol_pointers/name","flow");
$symbol_pointers['equipment_type_image_id'] = Nexista_Path::get("//get_account_symbol_pointers/equipment_type_image_id","flow");
$symbol_pointers['equipment_type_id'] = Nexista_Path::get("//get_account_symbol_pointers/equipment_type_id","flow");

$number_of_symbols = count($symbol_pointers['filename']);

if($number_of_symbols>0) { 

	for($i=0; $i < $number_of_symbols; $i++) { 

		$filename = $symbol_pointers['filename'][$i];
		if(!empty($filename)){
			$name = $symbol_pointers['name'][$i];
			$id = $symbol_pointers['equipment_type_id'][$i];
			$equipment_type_image_id = $symbol_pointers['equipment_type_image_id'][$i];
			$mfile = $path."/usr/".$account_id."/merchandising/" . $filename;

			if(strpos($filename,".swf")) { 
				$source_file = new SWFPrebuiltClip(fopen($mfile,"r"));
			} elseif(strpos($filename,".pdf") || strpos($filename,".ai")) { 
				$jpg_mfile = $mfile.".jpg";
				$source_file = new SWFBitmap(fopen($mfile.".jpg","r"));
			}
			$icon_id = "icon_".$id;
			$my_y_pos = 25+(22*$i);
			$container = new SWFSprite();
			$container->add($source_file);
			$container->nextFrame();
			$m->addExport($container,$icon_id);


			$icon_as .="Object.registerClass('$icon_id', createIcon);
			attachMovie('$icon_id','bitmap_$icon_id',1,
				{_y:$my_y_pos,equipment_type_symbol:'equipment_type_$icon_id',equipment_type_id:$id,equipment_type_image_id:'$equipment_type_image_id'});
			";

			$kt = new SWFTextField();
			$kt->setFont($f);
			$kt->setHeight(11);
			$kt->setBounds(170,25);
			$kt->addString("$name");
			$kt2 = $entire_key->add($kt);
			$kt2->moveto(37,11+$my_y_pos);


			unset($container);
		}
	}
}
unset($kt);
unset($kt2);
unset($name);
unset($symbol_pointers);



if($_GET['key']=="yes" || $_GET['key']=="") { 
	$entire_key->nextFrame();
	$i = $m->add($entire_key); 
	$i->setName("entire_key");
	$i->moveTo($key_x_position, $key_y_position);
}
unset($i);







/* NOW BEGINS THE FIXTURE ICONS THAT ARE IN INVENTORY!!! */
$assets['x_pos'] = Nexista_Path::get("//get_all_assets/x_position","flow");
if($assets['x_pos']!=NULL) {

	$assets['y_pos'] = (array)Nexista_Path::get("//get_all_assets/y_position","flow");
	$assets['rotation_angle'] = (array)Nexista_Path::get("//get_all_assets/rotation_angle","flow");
	$assets['equipment_type_id'] = (array)Nexista_Path::get("//get_all_assets/equipment_type_id","flow");
	$assets['location_equipment_id'] = (array)Nexista_Path::get("//get_all_assets/location_equipment_id","flow");
	$assets['equipment_id'] = (array)Nexista_Path::get("//get_all_assets/equipment_id","flow");
	$assets['asset_id'] = (array)Nexista_Path::get("//get_all_assets/asset_id","flow");
	$assets['equipment_type_image_id'] =(array) Nexista_Path::get("//get_all_assets/equipment_type_image_id","flow");
	$assets['status_id'] = (array)Nexista_Path::get("//get_all_assets/status_id","flow");
	$assets['container'] = Nexista_Path::get("//get_all_assets","flow");
	// should container be an array - no, see below??

	$num_icons = count($assets['y_pos']);
}


if($number_of_symbols>0) { 
	if(is_array($assets['x_pos'])) { 
		// Now loop through the actual asset lists at that location?
		$inventory_as = "Object.registerClass('container',positionFixture);";
		for($j=0; $j<$num_icons; $j++) { 
			$e_id = $assets['equipment_type_id'][$j];
			$my_x = $assets['x_pos'][$j];
			$my_y = $assets['y_pos'][$j];
			$my_rotation_angle = $assets['rotation_angle'][$j];
			$equipment_status=$assets['status_id'][$j];
			$my_aid = $assets['asset_id'][$j];
			$my_leid = $assets['location_equipment_id'][$j];
			$my_eid = $assets['equipment_id'][$j];
			$my_equipment_type_image_id = $assets['equipment_type_image_id'][$j]; 

			$my_icon_type_id = "icon_".$e_id;
			$inventory_as .= "
			var this_bmp = entire_key.equipment_type_$my_icon_type_id.my_bitmap;
			attachMovie('container','$my_eid',getNextHighestDepth(),
				{_x:$my_x,_y:$my_y,my_eid:$my_eid,symbol_rotation:$my_rotation_angle,my_icon_type_id:'$my_icon_type_id',bitmap:this_bmp,my_leid:'$my_leid',equipment_type_image_id:'$my_equipment_type_image_id'});

			";

		} 
	}
	unset($j);

}

}

$all_actionscript = $main_actionscript.$icon_as.$inventory_as."
removeMovieClip(bitmap_$icon_id);";

$m->add(new SWFAction($all_actionscript));
$m->writeExports();

ob_start();

$gm_date = gmdate("D, d M Y H:i:s");
header("Expires: " . $gm_date . " GMT");
////header("Cache-Control: private, must-revalidate");
////header("Cache-control: no-store");
header("Content-type: application/x-shockwave-flash");

//file_put_contents(NX_PATH_CACHE."main_actionscript.as",$all_actionscript);
$file_target = NX_PATH_CACHE."bah.swf";
//$m->save($file_target);
$m->output();

$flash = ob_get_contents();
ob_end_clean();

echo substr_replace($flash,chr(8),3,1);
//exit;




?>ss
