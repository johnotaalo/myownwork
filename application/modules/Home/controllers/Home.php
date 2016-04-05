<?php

class Home extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Home/M_Home');
	}

	function index()
	{
		$data['no_tables']['simon_pims'] = $this->M_Home->get_tables("count", "simon_pims");
		$data['no_tables']['pims_dev_new'] = $this->M_Home->get_tables("count", "pims-dev-new");
		$data['content_view'] = 'Home/home_v';

		$this->template->call_system_template($data);
	}

	function show_tables($database)
	{
		$data["tables"] = $this->create_tables_table($database);
		$data["database"] = $database;
		$data["type"] = "html";
		$data['content_view'] = 'Home/home_v';

		$this->template->call_system_template($data);
	}

	function create_tables_table($database, $type = NULL)
	{
		$tables = $this->M_Home->get_tables("all", $database);

		$tables_table = "";
		if(count($tables) > 0)
		{
			$counter = 0;
			foreach ($tables as $table) {
				$counter++;
				$tables_table .= "<tr>";
				$tables_table .= "<td>{$counter}</td>";
				$tables_table .= "<td>{$table->TABLE_NAME}</td>";
				$tables_table .= "<td>".$this->M_Home->get_table_count($database, $table->TABLE_NAME)."</td>";
				if($type == "pdf")
				{
					$tables_table .= "<td></td>";
				}
				$tables_table .= "</tr>";
			}
		}


		return $tables_table;
	}

	function export($type, $database)
	{
		switch ($type) {
			case 'pdf':
				$data["tables"] = $this->create_tables_table($database, "pdf");
				$data["type"] = "pdf";
				$this->export->export_pdf('Home/home_v', $data);
				break;
			
			case 'sql':
				$this->export->export_sql($database);
				break;
			default:
				# code...
				break;
		}
	}
}