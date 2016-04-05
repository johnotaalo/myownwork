<?php if (isset($no_tables)){?>
<div class="ui four column grid">
	<div class = "row">
		<div class = "column">
			<div class="ui card">
				<div class="content">
					<div class="header">Old Database</div>
				</div>
				<div class="content">
					<h4 class="ui sub header">Details</h4>
					<div class="ui small feed">
						<div class="event">
							<div class="content">
								<div class="summary">
									Name: simon-pims
								</div>
							</div>
						</div>
						<div class="event">
							<div class="content">
								<div class="summary">
									Number of Tables: <?php echo $no_tables['simon_pims']; ?> tables
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="extra content">
					<a href = "<?php echo base_url(); ?>Home/show_tables/simon_pims" title = "click to display tables" class = "ui button">View Tables</a>
				</div>
			</div>
		</div>
		<div class = "column">
			<div class="ui card">
				<div class="content">
					<div class="header">New Database</div>
				</div>
				<div class="content">
					<h4 class="ui sub header">Details</h4>
					<div class="ui small feed">
						<div class="event">
							<div class="content">
								<div class="summary">
									Name: pims-dev-new
								</div>
							</div>
						</div>
						<div class="event">
							<div class="content">
								<div class="summary">
									Number of Tables: <?php echo $no_tables['pims_dev_new']; ?> tables
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="extra content">
					<a href = "<?php echo base_url(); ?>Home/show_tables/pims-dev-new" title = "click to display tables" class = "ui button">View Tables</a>
				</div>
			</div>
		</div>
	</div>
</div>
<?php } else if(isset($tables)) { ?>
<?php if($type == "pdf"){?>
<h3><center>List of tables as at <?php echo date("d-m-Y H:i:s")?></center></h3>
<?php } else { ?>
	<a class = "ui button" href = "<?php echo base_url(); ?>Home/export/pdf/<?php echo $database; ?>"><i class = "cloud download icon"></i> Export to PDF</a>
	<a class = "ui button" href = "<?php echo base_url(); ?>Home/export/sql/<?php echo $database; ?>"><i class = "database icon"></i> Export to SQL</a>
<?php } ?>
<table class="ui celled striped table">
	<thead>
		<tr>
			<th>#</th>
			<th>Table Name</th>
			<th>Rows</th>
			<?php if($type == "pdf"){?>
			<th>Action</th>
			<?php } ?>
		</tr>
	</thead>
	<tbody>
		<?php echo $tables; ?>
	</tbody>
</table>
<?php } ?>