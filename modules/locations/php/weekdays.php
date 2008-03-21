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
// Get days of the week. 
require_once 'Calendar/Decorator/Textual.php';

$week = Calendar_Decorator_Textual::weekdayNames();

foreach($week as $day_id => $day) { 
	
	$day_array = Array("day_id" => $day_id, "day" => $day);
	Flow::add("days",$day_array);
	
	
}


?>