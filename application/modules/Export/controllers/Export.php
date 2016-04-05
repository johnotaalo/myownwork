<?php

class Export extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	function export_pdf($view, $data)
	{
		$filename = "pims-simon_db_".date('d-m-y::h:i:s').".pdf";
		$data['page_title'] = 'Hello world'; // pass data to the view

		if (file_exists($pdfFilePath) == FALSE)
		{
			ini_set('memory_limit','32M'); // boost the memory limit if it's low <img class="emoji" draggable="false" alt="😉" src="https://s.w.org/images/core/emoji/72x72/1f609.png">
			$html = $this->load->view($view, $data, true); // render the view into HTML

			$this->load->library('pdf');
			$pdf = $this->pdf->load();
			$pdf->SetFooter($_SERVER['HTTP_HOST'].'|{PAGENO}|'.date(DATE_RFC822)); // Add a footer for good measure <img class="emoji" draggable="false" alt="😉" src="https://s.w.org/images/core/emoji/72x72/1f609.png">
			$pdf->WriteHTML($html); // write the HTML into the PDF
			$pdf->Output($filename, 'D'); // save to file because we can
		}

		//redirect("/downloads/reports/$filename");
	}

	function export_sql($database)
	{
		$CI =& get_instance();
		$CI->load->database();

		$this->load->model('Home/M_Home');

		$tables = $this->M_Home->get_tables("all", $database);

		$mysqlDatabaseName = $database;
		$mysqlUserName = $CI->db->username;
		$mysqlPassword = $CI->db->password;
		$mysqlExportPath ='/downloads/mysqlbackups/chooseFilenameForBackup.sql';

		$mysqlHostName ='localhost';
		//Export the database and output the status to the page
		$command='mysqldump --opt -h' .$mysqlHostName .' -u' .$mysqlUserName .' -p' .$mysqlPassword .' ' .$mysqlDatabaseName .' > ' .$mysqlExportPath;
		exec($command,$output=array(),$worked);
		switch($worked){
		case 0:
		echo 'Database <b>' .$mysqlDatabaseName .'</b> successfully exported to <b>~/' .$mysqlExportPath .'</b>';
		break;
		case 1:
		echo 'There was a warning during the export of <b>' .$mysqlDatabaseName .'</b> to <b>' .$mysqlExportPath .'</b>';
		break;
		case 2:
		echo 'There was an error during export. Please check your values:<br/><br/><table><tr><td>MySQL Database Name:</td><td><b>' .$mysqlDatabaseName .'</b></td></tr><tr><td>MySQL User Name:</td><td><b>' .$mysqlUserName .'</b></td></tr><tr><td>MySQL Password:</td><td><b>NOTSHOWN</b></td></tr><tr><td>MySQL Host Name:</td><td><b>' .$mysqlHostName .'</b></td></tr></table>';
		break;
		}
		/*foreach ($tables as $table) {
			$result = exec("/downloads/mysqlbackups/ -u root -p root $database $table->TABLE_NAME > /downloads/mysqlbackups/$table->TABLE_NAME.sql");

			echo $result . '<br/>';
			// echo "<pre>";print_r($table);
			/*$new_file = fopen($_SERVER['DOCUMENT_ROOT'] .'/chris/downloads/mysqlbackups/'. $table->TABLE_NAME . '.sql',"w");
			$txt = "";
			fwrite($new_file, $txt);
			fclose($new_file);*/
			// $file = $_SERVER['DOCUMENT_ROOT'] .'/chris/downloads/mysqlbackups/'.$table->TABLE_NAME . '.sql';
			// $sql = "SELECT * INTO OUTFILE '$file' FROM (SHOW CREATE TABLE `$database`.`$table->TABLE_NAME`)";
			//$sql = "SHOW CREATE TABLE `$database`.`$table->TABLE_NAME`";
			// $this->db->query($sql);
			//$create_statement = $this->db->query($sql)->row_array()['Create Table'];
		//}
	}
}