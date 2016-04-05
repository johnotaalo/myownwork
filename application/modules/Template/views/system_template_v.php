<!DOCTYPE html>
<html>
<head>
	<title>PIMS Migration::<?php echo $page_title; ?></title>
	<!-- <link rel="stylesheet" type="text/css" href="<?php echo ASSET_URL; ?>custom/custom.css"> -->
	<link rel="stylesheet" type="text/css" href="<?php echo ASSET_URL; ?>semantic/semantic.min.css">
	<script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI="   crossorigin="anonymous"></script>
</head>
<body>

	<div class = "ui container">
		<div class="ui stackable labeled icon menu">
			<div class="item">
				<img src="<?php echo ASSET_URL;?>images/UNEP_logo.jpg">
			</div>
			<a class = "item" href = "<?php echo base_url(); ?>Home"><i class = "home icon"></i> Home</a>
			<a class = "item" href = "<?php echo base_url(); ?>Mapping"><i class = "globe icon"></i> Mapping</a>
			<a class = "item" href = "<?php echo base_url(); ?>Mapping"><i class = "table icon"></i> Tables</a>
			<!-- <a class = "item" href = "<?php echo base_url(); ?>Home">Sign-in</a> -->
		</div>
		<?php $this->load->view($content_view); ?>
	</div>

	<script type="text/javascript" src = "<?php echo ASSET_URL; ?>semantic/semantic.min.js"></script>
	<script type="text/javascript" src = "<?php echo ASSET_URL; ?>custom/custom.js"></script>
</body>
</html>