<?php
/** <!--
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program; if not, see http://www.gnu.org/licenses
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA 02110-1301 USA
 *
 * PHP Version 5
 *
 * @category  Libs
 * @package   Internet_Floor_Plans
 * @author    Albert L. Lash, IV <albert.lash@gmail.com>
 * @copyright Savonix Corporation
 * @license   http://www.gnu.org/licenses Gnu Affero Public License version 3
 * @link      http://www.internetfloorplans.com/
 * -->
 */

$path        = $_SERVER['SCRIPT_NAME'];
$path_prefix = dirname($path).'/';

if ($_GET['view_flow'] == 'true' ) {
    $link_prefix = $path.'?view_flow=true&nid=';
} else {
    $link_prefix = $path.'?nid=';
}

$utcdate = gmdate('Y-m-d H:i:s');

if(isset($_POST['key_x_position'])) {
    $_SESSION['key_x_position'] = $_POST['key_x_position'];
    $_SESSION['key_y_position'] = $_POST['key_y_position'];
} elseif (!$_SESSION['key_x_position']) {
    $_SESSION['key_x_position'] = 10;
    $_SESSION['key_y_position'] = 10;
}


$defaults = Nexista_Config::getSection('defaults');
Nexista_Flow::add('defaults', $defaults, false);

$runtime = array(
    'path_prefix' => $path_prefix,
    'link_prefix' => $link_prefix,
    'utcdate' => $utcdate,
    'user_id' => $current_user_id,
    'key_x_position' => $_SESSION['key_x_position'],
    'key_y_position' => $_SESSION['key_y_position'],
    'upload_dest' => $upload_dest
    );

Nexista_Flow::add('runtime', $runtime, false);
?>
