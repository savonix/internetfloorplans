<?php
/*
Program: Internet Floor Plans
Component: dayhours.php
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

// Get hours of the day

require_once "Date.php";

$hours = 12;
$minutes = 60;

// hours
for($i=1;$i<=$hours;$i++) { 
	if($i<10) {
		$hour = "0$i";
	} else { 
		$hour = $i;
	}

	$hour_array = Array("hour_id"=>$i,"hour" => $hour);
	Flow::add("hours",$hour_array);
	
}
// mins

$min_array = Array("minute" => '00');
Flow::add("minutes",$min_array);
$min_array = Array("minute" => '30');
Flow::add("minutes",$min_array);
	


?>
