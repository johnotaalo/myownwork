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

	/*function create_table_column_select($database, $table_name)
	{
		$columns = $this->M_Home->get_table_columns($database, $table_name);

		$options = "";
		if (count($columns) > 0) {
			foreach ($columns as $key => $value) {
				$options .= "<div class = 'item' data-value = '$value->COLUMN_NAME'>$value->COLUMN_NAME</div>";
			}
		}

		echo $options;
	}*/

	function create_columns_table($new_database, $new_table_name, $old_database,$old_table_name)
	{
		$new_columns = $this->M_Home->get_table_columns($new_database, $new_table_name);
		$old_columns = $this->M_Home->get_table_columns($old_database, $old_table_name);

		$new_options = $table = $old_options = "";

		if (count($old_columns) > 0) {
			foreach ($old_columns as $key => $value) {
				$old_options .= "<option value = '{$value->COLUMN_NAME}'>{$value->COLUMN_NAME}</option>";
			}
		}

		if (count($new_columns) > 0) {
			foreach ($new_columns as $key => $value)
			{
				$new_options .= "<option value = '{$value->COLUMN_NAME}'>{$value->COLUMN_NAME}</option>";
				$table .= "<tr>
					<td>{$value->COLUMN_NAME}</td>
					<td class = 'field'><select class = 'ui select dropdown' name = 'old_column_map[{$value->COLUMN_NAME}]'>{$old_options}</select></td>
				</tr>";
			}
		}

		$created_colums = array();

		$created_colums['options']['old_options'] = $old_options;
		$created_colums['options']['new_options'] = $new_options;
		$created_colums['table'] = $table;

		echo json_encode($created_colums);
	}

	function add_direct_maps($new_table, $old_table)
	{
		$file = './assets/configurations/config.ini';
		$json_data = file_get_contents($file);
		$data_array = array();

		if($json_data != "")
		{
			$data_array = json_decode($json_data);
		}

		$data_array[] = [
		$new_table . ' - ' . $old_table => $this->input->post('old_column_map')
		];

		$data = json_encode($data_array);
		
		file_put_contents($file, $data);
	}
}