<?php
/*
Program: Internet Floor Plans
Component: floorplan_pdf.php
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
*/


require('/path/to/fpdf153/fpdf.php');
require('/path/to/fpdi1.1/fpdi.php');

ini_set('include_path','/path/to/fpdf153/font/');
$filename = Nexista_Path::get("//get_sp_pointer_by_id/space_plan_pointer","flow"); 

$path = $_SERVER['SCRIPT_FILENAME'];
$path = dirname(dirname($path));

/* 
$file = "";


$pdf= new fpdi("L");
$pagecount = $pdf->setSourceFile($file);
$tplidx = $pdf->ImportPage(1);


$location_name = Path::get("//get_location_summary/name","flow");
$location_address = Path::get("//get_location_summary/address_line_1","flow");
$location_city = Path::get("//get_location_summary/city", "flow");
$location_state = Path::get("//get_location_summary/state","flow");
$location_zip = Path::get("//get_location_summary/zip","flow");


	// INDICATORS:

//$tplidx2 = $pdf->ImportPage(1);

/*
Need three secions: 
1. Floorplan
2. Icon key
*/




$pdf->addPage();
$pdf->useTemplate($tplidx,10,10,200);
//$pdf->useTemplate($tplidx2,-40,-80,0,0);



// Location Information:
$pdf->SetFont('Arial','',12);
$pdf->MultiCell(0,5,"
	Floor Plan :
	$location_name
	$location_address.
	$location_city, $location_state $location_zip",0,1,'C');

$new_file_name = strtolower(str_replace(" ","",$location_name));

$pdf->Output($new_file_name.".pdf","I");
$pdf->closeParsers();
?>
