<?php if (!defined('BASEPATH')) exit('No direct script access allowed');?>
<script>
	$(function(){
			var toolbar = [
			{
				text:'Hapus',
				iconCls:'icon-remove',
				handler:function(){
					
					var rows = $('#tt').datagrid('getSelections');
					if (rows) {
						$.messager.confirm('Konfirmasi', 'Apakah anda yakin ingin menghapus data yang anda pilih?', function (r) {
							if (r) {
								var ss = $.map(rows, function (item, idx) {
									return item.ticketinboxId;
								});
								$.post('<?php echo site_url("data/Helpdesk/delete");?>', {
									'id[]': ss
								}, function (result) {
									if (result.success) {
										$('#tt').datagrid('reload'); // reload the user data
									} else {
										$.messager.alert('Error',result.msg);
									}
									
								}, 'json').fail(function (jxhr, status, error) {
									// alert('error: ' + status + ':' + error)
								});
							}
						});
					}
				}
			},
			
		];

		var dg =  $('#tt').edatagrid({
			title:'Manajemen Data Helpdesk',
			//iconCls:'icon-edit',
			singleSelect:false,
			remoteFilter: true,
			multiSort:true,
			pagination:true,
			toolbar:toolbar,
			idField:'id',
			url:'<?php echo site_url("data/Helpdesk/ajax/datagrid");?>',
			destroyUrl: '<?php echo site_url("data/Helpdesk/delete");?>',
			//getChanges:'<?php echo site_url("data/Helpdesk/edit");?>',			
			columns:[[
				{field:'ck',checkbox:true, sortable:false},
				{field:'action',title:'Aksi?',width:'7%',align:'center', sortable:false},
				{field:'id', hidden:true},
				{field:'chatId', hidden:true},
				{field:'pengirimId', hidden:true},
				{field:'ticketinboxMessageHelp', hidden:true},
				{field:'ticketinboxMessageReplay', hidden:true},
				{field:'ticketinboxId',title:'No. Tiket',width:'25%', sortable:true},
				{field:'ticketinboxPengirimId',title:'Pengirim Id',width:'50%',sortable:true},
				{field:'ticketinboxStatus',title:'Status',width:'15%', sortable:true},
			]],
			onError: function(index,row){
				$.messager.alert('Informasi',row.errorMsg,'warning');
				$('#dg').datagrid('reload'); 
			}
		});
			
		dg.edatagrid(
				'enableFilter', [
					{ field:'ck', type:'label'},
					{ field:'action', type:'label'},
				]	
		);
	});
	
	function getRowIndex(target){
		var tr = $(target).closest('tr.datagrid-row');
		return parseInt(tr.attr('datagrid-row-index'));
	}
	
	function deleterow(target){
		$.messager.confirm('Confirm','Are you sure?',function(r){
			if (r){
				$('#tt').datagrid('deleteRow', getRowIndex(target));
			}
		});
	}
	
	$(document).on("click","#replyData",function() {
		var row = $('#tt').datagrid('getSelected');
		if (row){
			$('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
			$('#fm').form('load',row);
		}
    });
	
	function replyData(){
		$('#fm').form('submit',{
			url: '<?php echo site_url('data/Helpdesk/reply')?>',
			onSubmit: function(){
				return $(this).form('validate');
			},
			success: function(result){
				var result = JSON.parse(result);
				if (result.isError == 'true'){
					$.messager.show({
						title: 'Error',
						msg: result.errorMsg,
						showType:'show',
						style:{
							right:'',
							bottom:''
						}
					});
				} else {
					$.messager.show({
						title: 'Information',
						msg: result.errorMsg,
						showType:'show',
						style:{
							right:'',
							bottom:''

						}
					});
					$('#dlg').dialog('close');        // close the dialog
					$('#tt').datagrid('reload');    // reload the user data
				}
			}
		});
	}
	
</script>

<div class="row">
	<div class="col-xs-12">
		<div class="table-container">
			<table id="tt" class="table easyui-edatagrid dg" style="width:100%;height:400px">
			</table>
		</div>
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:600px" closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
		<div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">Reply Ticket</div>
		<div style="margin-bottom:10px">
			<input style="display:none;" name="chatId" value="" />
			<input style="display:none;" name="pengirimId" value="" />
			<input style="display:none;" name="id" value="" />
			<input name="ticketinboxMessageHelp" class="easyui-textbox" label="Pesan Pengaduan:" data-options="multiline:true" style="width:100%; height:100px" readonly />
		</div>
		<div style="margin-bottom:10px">
			<input name="ticketinboxMessageReplay" class="easyui-textbox" label="Pesan Balasan:" data-options="multiline:true" style="width:100%; height:100px"/>
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="replyData()" style="width:90px">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>