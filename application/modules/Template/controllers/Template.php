<?php

class Template extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	function call_system_template($data)
	{
		$this->load->view('Template/system_template_v', $data);
	}
}