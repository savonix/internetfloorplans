<?
/*
Program: Internet Floor Plans
Component: container_type_form.xsl
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
//Ming_setScale(22.0);
ming_useswfversion(6);

$c_pos = new SWFMovie();
$c_pos->setDimension(730,500);
$c_pos->setBackground(255,255,255);

// Get merchandising image
$file_path = Path::get("//get_image_pointer_by_id/image_pointer","flow"); 
$mime_type = Path::get("//get_image_pointer_by_id/mime_type","flow"); 
$account_id = $_SESSION['NX_AUTH']['account_id'];

$path = NX_PATH_CACHE;
$path = dirname($path);
$path .= "/usr/"; 
$path .= $account_id; 
$file = $path . "/merchandising/" . $file_path;

$merch_img = new SWFBitmap(fopen($file,"rb")); 

$merch_disp = $c_pos->add($merch_img);
$merch_disp->moveTo(0,0);

// c = container
$c_array['width'] = Path::get("//get_container_by_type_id/width","flow");
$c_array['height'] = Path::get("//get_container_by_type_id/height","flow"); 
$c_array['x_origin'] = Path::get("//get_container_by_type_id/x_origin","flow");
$c_array['y_origin'] = Path::get("//get_container_by_type_id/y_origin","flow"); 
$c_array['e_c_id'] = Path::get("//get_container_by_type_id/equipment_type_container_id","flow");

$c_array['width'] = (array)$c_array['width'];
$c_array['height'] = (array)$c_array['height'];
$c_array['x_origin'] = (array)$c_array['x_origin'];
$c_array['y_origin'] = (array)$c_array['y_origin'];
$c_array['e_c_id'] = (array)$c_array['e_c_id'];

$array_num = 0;

for($i=0;$i < count($c_array['width']); $i++) {  	
	$e_c_id = $c_array['e_c_id'][$array_num];
	$width = $c_array['width'][$array_num];
	$height = $c_array['height'][$array_num];
	if(isset($c_array['x_origin'][$array_num])) {
		$x_origin = $c_array['x_origin'][$array_num];
		$y_origin = $c_array['y_origin'][$array_num];
	} else { 
		$x_origin = 0;
		$y_origin = 0;
	}
	$c = new SWFShape();
	$c->setLine(1,120,120,120); 
	$c->setRightFill(10,10,10);
	
	$c->movePenTo(0,0);
	$c->drawLineTo($width,0);
	$c->drawLineTo($width,$height);
	$c->drawLineTo(0,$height);
	$c->drawLineTo(0,0);
	
	$c_sprite = new SWFSprite();
	$c_sprite->add($c);
	$c_sprite->nextFrame();
	
	$c_num = "c_$array_num";
	$$c_num = $c_pos->add($c_sprite); 
	$c_name = "container_" . $array_num;
	$$c_num->setName($c_name);
	
	$$c_num->moveto($x_origin,$y_origin);
	
	$c_pos->add(new SWFAction("
		$c_name._alpha=30;
		$c_name.onPress=function(){ this.startDrag('false');}; 
		$c_name.onRelease=container_$array_num.onReleaseOutside = function(){ 
			stopDrag();
			equipment_type_container_id=$e_c_id;
			x_origin=_root.container_$array_num._x; 
			y_origin=_root.container_$array_num._y; 
			//getURL('/acc/link/containers/position/','_blank', 'POST'); 
			loadVariables('/acc/link/containers/position/','', 'POST'); 
		};
		
		
		"));
	
	$array_num++;
}

header('Content-type: application/x-shockwave-flash');
$c_pos->output(9);

?>
