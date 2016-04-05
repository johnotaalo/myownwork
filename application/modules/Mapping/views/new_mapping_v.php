<div class = "ui loading form">
	<h4 class="ui horizontal divider header">Mapping Scheme</h4>
	<div class = "field">
		<div class = "six fields">
			<div class="field">
				<div class = "ui radio checkbox">
					<label for = "direct_mapping">Direct Mapping</label>&nbsp;
					<input type = "radio" name = "mapping_style" value = "direct">
				</div>
			</div>
			<div class="field">
				<div class = "ui radio checkbox">
					<label for = "direct_mapping">Structural Mapping</label>&nbsp;
					<input type = "radio" name = "mapping_style" value = "structural">
				</div>
			</div>
		</div>
	</div>
	<h4 class="ui horizontal divider header">Mapping Table</h4>
	<button class = "small ui right floated button">Save Changes</button>
	<br/>
	<br/>
	<table class = "ui celled table">
		<thead>
			<tr>
				<th class="center aligned" colspan="3">Tables</th>
			</tr>
			<tr>
				<th>New Table</th>
				<th>Old Table</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class = "field">
					<div class="ui search selection dropdown">
						<input type="hidden" name="new_tables">
						<i class="dropdown icon"></i>
						<div class="default text">Select New Table</div>
						<div class = "menu" id = "new_tables">
							<!-- data comes here -->
						</div>
					</div>
				</td>
				<td class = "field">
					<div class="ui search selection dropdown">
						<input type="hidden" name="old_tables">
						<i class="dropdown icon"></i>
						<div class="default text">Select Old Table</div>
						<div class = "menu" id = "old_tables">
							<!-- data comes here -->
						</div>
					</div>
				</td>
				<td class = "field">
					<button class = "ui button match">Match Columns</button>
				</td>
				<!-- <td class = "field">
					<div class="ui search selection dropdown">
						<input type="hidden" name="new_table_columns">
						<i class="dropdown icon"></i>
						<div class="default text">Select New Table</div>
						<div class = "menu" id = "new_table_columns">
							data comes here 
						</div>
					</div>
				</td>
				<td class = "field">
					<div class="ui search selection dropdown">
						<input type="hidden" name="old_table_columns">
						<i class="dropdown icon"></i>
						<div class="default text">Select New Table</div>
						<div class = "menu" id = "old_table_columns">
							data comes here 
						</div>
					</div>
				</td> -->
			</tr>
		</tbody>
	</table>

	<button id = "add_row" class = "tiny ui button">Add Row</button>
</form>

<div class="ui modal">
	<i class="close icon"></i>
	<div class="header">
		Modal Title
	</div>
	<div class="image content">
		<!-- content -->
	</div>
	<div class="actions">
		<div class="ui black deny button">
			Cancel
		</div>
		<div class="ui positive right labeled icon button">
			Continue
		<i class="checkmark icon"></i>
		</div>
	</div>
</div>
<script type="text/javascript">
	var jqxhr = $.get( "<?php echo base_url(); ?>Mapping/create_tables_select/", function(data) {
		obj = jQuery.parseJSON(data);
		$('#new_tables').append(obj.pims_dev_new);
		$('#old_tables').append(obj.simon_pims);
	})
	.done(function() {
		$('div.ui.form').removeClass('loading');
	})
	.fail(function() {
		alert( "error" );
	});

	$('input[name = "new_tables"]').change(function(){
		var jqxhr = $.get( "<?php echo base_url(); ?>Mapping/create_table_column_select/pims-dev-new/" + $(this).val(), function() {
			$('div.ui.search.selection.dropdown i').removeClass('dropdown');
			$('div.ui.search.selection.dropdown i').addClass('spinner loading');
		})
		.done(function(data) {
			$('div.ui.search.selection.dropdown i').removeClass('spinner loading');
			$('div.ui.search.selection.dropdown i').addClass('dropdown');
			$('#new_table_columns').html(data);
		})
		.fail(function() {
			alert( "error" );
		});
	});

	$('input[name = "old_tables"]').change(function(){
		var jqxhr = $.get( "<?php echo base_url(); ?>Mapping/create_table_column_select/simon_pims/" + $(this).val(), function() {
			$('div.ui.search.selection.dropdown i').removeClass('dropdown');
			$('div.ui.search.selection.dropdown i').addClass('spinner loading');
		})
		.done(function(data) {
			$('div.ui.search.selection.dropdown i').removeClass('spinner loading');
			$('div.ui.search.selection.dropdown i').addClass('dropdown');
			$('#old_table_columns').html(data);
		})
		.fail(function() {
			alert( "error" );
		});
	});

	$('.match').click(function(){

		$new_table = $('input[name = "new_tables"]').val();
		$old_table = $('input[name = "old_tables"]').val();

		if($new_table !== "" && $old_table !== "")
		{
			$('.ui.modal').modal('show');
		}
		else
		{
			alert("ensure the tables have been selected");
		}
	});
</script>