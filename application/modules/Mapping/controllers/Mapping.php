<?php

class Mapping extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('Home/M_Home');
	}

	function index()
	{
		$data['content_view'] = 'Mapping/mapping_v';
		$data['page_title'] = 'Mapping Page';

		$this->template->call_system_template($data);
	}

	function newmapping()
	{
		$data['content_view'] = 'Mapping/new_mapping_v';
		$data['page_title'] = 'New Mapping Page';

		$this->template->call_system_template($data);
	}

	function create_tables_select($database = NULL)
	{
		$action = "all";
		$databases = ['pims-dev-new', 'simon_pims'];
		$select_options = "";
		if($database != NULL)
		{
			$tables = $this->M_Home->get_tables($action, $database);
			if (count($tables) > 0) {
				foreach ($tables as $key => $value) {
					$select_options .= "<option value = '{$value->TABLE_NAME}'>{$value->TABLE_NAME}</option>";
				}
			}
		}
		else
		{
			for ($i=0; $i < count($databases); $i++) { 
				$tables = $this->M_Home->get_tables($action, $databases[$i]);
				if (count($tables) > 0) {
					$name = (strpos($databases[$i], '-') !== false) ? str_replace('-', '_', $databases[$i]) : $databases[$i];
					$select_options[$name] = "";
					foreach ($tables as $key => $value) {
						$select_options[$name] .= "<div class = 'item' data-value = '$value->TABLE_NAME'>$value->TABLE_NAME</div>";
					}
				}
			}
			
		}
		

		echo json_encode($select_options);
	}

	function create_table_column_select($database, $table_name)
	{
		$columns = $this->M_Home->get_table_columns($database, $table_name);

		$options = "";
		if (count($columns) > 0) {
			foreach ($columns as $key => $value) {
				$options .= "<div class = 'item' data-value = '$value->COLUMN_NAME'>$value->COLUMN_NAME</div>";
			}
		}

		echo $options;
	}
}