<?php

class MY_Controller extends MX_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->module([
			'Export',
			'Template'
		]);

		date_default_timezone_set('Africa/Nairobi');
	}
}