<?php
/*
Program: Internet Floor Plans
Component: runtime.php
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

# This wacky path builder is required due to mod_rewrite situations
$path = $_SERVER['REQUEST_URI'];
$path = dirname($path)."/".basename($_SERVER['SCRIPT_NAME']);
$path_prefix = dirname($path)."/";
$link_prefix = $path."?nid=";
$utcdate = gmdate('Y-m-d H:i:s');
/*
    TODO / FIXME:
    This should be in a separate file, accessed and referenced a plugin
    so it can easily be turned off.
*/
$svn_revision = '$Rev$'; 
$svn_revision = str_replace('$Rev:','',$svn_revision);
$svn_revision = str_replace('$','',$svn_revision);
/* end TODO */

$runtime = array(
                'path_prefix' => $path_prefix,
                'link_prefix' => $link_prefix,
                'utcdate' => $utcdate,
                'user_id' => $current_user_id,
                'upload_dest' => $upload_dest,
                'svn_revision' => $svn_revision
                );

Nexista_Flow::add("runtime",$runtime,false);
?>
