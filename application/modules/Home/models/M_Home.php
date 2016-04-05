<?php

class M_Home extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
	}

	function get_tables($action, $database)
	{
		$sql = "select * from tables WHERE TABLE_SCHEMA = '$database'";

		return ($action == "count") ? $this->db->query($sql)->num_rows() : $this->db->query($sql)->result();
	}

	function get_table_count($database, $table)
	{
		$sql = "select * FROM `{$database}`.`{$table}`";

		return $this->db->query($sql)->num_rows();
	}

	function get_table_columns($database, $table_name)
	{
		$sql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '{$database}' AND TABLE_NAME = '{$table_name}'";

		return $this->db->query($sql)->result();
	}
}