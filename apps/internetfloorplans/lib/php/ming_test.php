<?php
/* <!--
Program: Internet Floor Plans
Component: ming_test.php
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
--> */
ming_useswfversion(7);

$m = new SWFMovie();
$m->setDimension(240,120);
$my_key_label_header = new SWFShape();
$my_key_label_header->setLine(1,0,0,0);
$my_key_label_header->setRightFill(240,240,240);
$my_key_label_header->movePenTo(0,5);
$my_key_label_header->drawLine(150,0);
$my_key_label_header->drawLine(0,25);
$my_key_label_header->drawLine(-150,0);
$my_key_label_header->drawLine(0,-25);
$m->add($my_key_label_header);
//$m->save('/tmp/ming_test.swf');

$m->output();


?>
