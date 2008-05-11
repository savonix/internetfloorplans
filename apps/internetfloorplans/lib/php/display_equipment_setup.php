<?
/*
Program: Internet Floor Plans
Component: display_equipment_setup.php
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
// This script creates a merchandising fixture with the appropriate content displayed.
//Ming_setScale(22.0);
ming_useswfversion(7);

$c_pos = new SWFMovie();
//$c_pos->setDimension(400,400);
$w = $_GET['w'];
$h = $_GET['h'];
$c_pos->setDimension($w,$h);

$c_pos->setBackground(255,255,255);

// Get merchandising image
$file_path = Nexista_Path::get("//get_image_pointer_by_id/image_pointer","flow");
$mime_type = Nexista_Path::get("//get_image_pointer_by_id/mime_type","flow");
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
$c_array['width'] = Nexista_Path::get("//get_container_by_type_id/width","flow");
$c_array['height'] = Nexista_Path::get("//get_container_by_type_id/height","flow");
$c_array['x_origin'] = Nexista_Path::get("//get_container_by_type_id/x_origin","flow");
$c_array['y_origin'] = Nexista_Path::get("//get_container_by_type_id/y_origin","flow");
$c_array['e_c_id'] = Nexista_Path::get("//get_container_by_type_id/equipment_type_container_id","flow");

$c_array['width'] = (array)$c_array['width'];
$c_array['height'] = (array)$c_array['height'];
$c_array['x_origin'] = (array)$c_array['x_origin'];
$c_array['y_origin'] = (array)$c_array['y_origin'];
$c_array['e_c_id'] = (array)$c_array['e_c_id'];

// cn = content
$cn_array['image_pointer'] = Nexista_Path::get("//get_image_pointers_by_id/image_pointer","flow");
$cn_array['thumb_pointer'] = Nexista_Path::get("//get_image_pointers_by_id/thumb_pointer","flow");
$cn_array['equipment_type_container_id'] = Nexista_Path::get("//get_image_pointers_by_id/equipment_type_container_id","flow");
$cn_array['image_pointer'] = (array)$cn_array['image_pointer'];
$cn_array['thumb_pointer'] = (array)$cn_array['thumb_pointer'];
$cn_array['equipment_type_container_id'] = (array)$cn_array['equipment_type_container_id'];

$array_num = 0;
for($i=0; $i<count($c_array['width']);$i++) {

	$e_c_id = $c_array['e_c_id'][$array_num];
	$width = $c_array['width'][$array_num];
	$height = $c_array['height'][$array_num];
	if(isset($c_array['x_origin'][$array_num])) {
		$x_origin = $c_array['x_origin'][$array_num];
		$y_origin = $c_array['y_origin'][$array_num];
	} else {
		$x_array=0;
		$y_array=0;
	}
	if(count($cn_array['image_pointer'])>0 && $cn_array['image_pointer']!=NULL) {
	$cn_num=0;

		for($cn_num=0;$cn_num<count($cn_array['image_pointer']); $cn_num++) {
			$my_image=$cn_array['image_pointer'][$cn_num];
			$my_container=$cn_array['equipment_type_container_id'][$cn_num];
			if($e_c_id==$my_container) {
				if($my_image!='') {
					$content_img = new SWFBitmap(fopen("$path/content/$my_image","rb"));
					$content_disp = $c_pos->add($content_img);
					$content_disp->moveTo($x_origin, $y_origin);
				}
			}
		}

/*
	if($array_num==1 || count($c_array['width'])==1) {
		for($cn_num=0;$cn_num<count($cn_array['image_pointer']); $cn_num++) {
			$my_image=$cn_array['image_pointer'][$cn_num];
			$my_container=$cn_array['equipment_type_container_id'][$cn_num];
			if($my_image!='') {
				$content_img = new SWFBitmap(fopen("$path/content/$my_image","rb"));
				$content_disp = $c_pos->add($content_img);
				$content_disp->moveTo($x_origin, $y_origin);
			}
		}
	} else {
		for($cn_num=0;$cn_num<count($cn_array['image_pointer']); $cn_num++) {
			$this_image=$cn_array['image_pointer'][$cn_num];
			$my_container=$cn_array['equipment_type_container_id'][$cn_num];
			if($e_c_id==$my_container) {
				if($my_image!='') {
					$content_img = new SWFBitmap(fopen("$path/content/$my_image","rb"));
					$content_disp = $c_pos->add($content_img);
					$content_disp->moveTo($x_origin, $y_origin);
				}
			}
		}
	}
	*/
	}
	$array_num++;
}



$c_pos->output();


?>
