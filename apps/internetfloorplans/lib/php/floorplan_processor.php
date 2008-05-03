<?php
/*
Program: Internet Floor Plans
Component: floorplan_processor.php
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
$filename = Nexista_Path::get("_files/file/name","flow");

$path = $_SERVER['SCRIPT_FILENAME'];
$path = dirname(dirname($path));
$account_id = $_SESSION['NX_AUTH']['account_id'];
$a_path = $path."/usr/";
$a_path .= $account_id;

$b_path = $a_path."/spaceplans/";
$file = $b_path.$filename;

$c_root = $b_path."$filename";
$c_ppm = $c_root."-000001.ppm";

$ext = ".jpg";
$bitmap_file = $file.$ext;



$bitmap_filename = $filename.$ext;
//Flow::add("bitmap_filename",$bitmap_filename);
Nexista_Flow::add("bitmap_filename",$filename);

function fork($shellCmd) {
   exec("$shellCmd > /dev/null 2>&1 &");
}

/* This requires pdftoppm */

$my_commands = "pdftoppm $file -r 288 $c_root && \
convert $c_ppm -resize 25% -quality 75% -interlace none $bitmap_file && \
rm $c_ppm";


//fork($my_commands);





?>
