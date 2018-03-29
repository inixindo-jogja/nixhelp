<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Helpdesk extends Sys_Controller {

	function __construct() {
        parent::__construct();
		//restrict();
		$this->load->model(array('data/m_helpdesk', 'auth/users'));
		$this->load->library('telegram');
    }
	
	public function index()
	{
		$tpl['module'] = 'data/Helpdesk';
		$this->template->inject_partial('modules_css', multi_asset( array( ), 'css' ) );
																		
		$this->template->inject_partial('modules_js', multi_asset( array( 'plugins/easyui/plugins/jquery.edatagrid.js' => '_theme_','plugins/easyui/plugins/datagrid-filter.js' => '_theme_',), 'js' ) );
		$this->template->title( 'Manajemen Helpdesk' );
		$this->template->set_breadcrumb( config_item('app_name') , '' );
		$this->template->set_breadcrumb( 'Manajemen Helpdesk' , 'data/Helpdesk/index' );
		$this->template->build('data/helpdesk/v_helpdesk_index', $tpl);
	}
	
	function ajax( $action = NULL )
    {
  		//validasi agar fungsi ajax tidak dapat diakses langsung melalui url di browser
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		if( $action == 'datagrid' )
		{
			$page = ($this->input->post('page') != '') ? intval($this->input->post('page')) : 1;
			$rows = ($this->input->post('rows') != '') ? intval($this->input->post('rows')) : 10;
			$offset = ($page-1)*$rows;	
			
			$sort = isset($_POST['sort']) ? strval($_POST['sort']) : 'ticketinboxPengirimTanggal';//harus sesuai dengan nama field di view
			$order = isset($_POST['order']) ? strval($_POST['order']) : 'desc';
			$sort = explode( ',', $sort);
			$order = explode( ',', $order);
			foreach($sort as $key => $val){
				$sorting[$val] = $order[$key];
			}
			
			$obj = array();
			$filter = (isset($_POST['filterRules'])) ? json_decode($_POST['filterRules'], true) : NULL;
			if(!is_null($filter)){
				foreach($filter as $key => $val){
					$obj[$val['field']] = $val['value'];
				}
			}
			
			$qry = $this->m_helpdesk->get_helpdesk($obj, $rows, $offset, $sorting); //sesuai dengan nama kolom di tabel database(primary key-nya)
			$records["total"] =$this->m_helpdesk->total_record();

			$items = array();
			if(!is_null($qry)){
				foreach($qry->result_array() as $row){
					$row['id'] = $row['ticketinboxId'];
					$row['status'] = $row['ticketinboxStatus'];
					$row['pengirimId'] = $row['ticketinboxPengirimId'];
					$row['chatId'] = $row['ticketinboxChatId'];
					$row['ticketinboxId'] = '#' . $row['ticketinboxId'];
					$row['action'] = ($row['status'] == 'New') ? '<a id="replyData" href="javascript:void(0)"><span class="ace-icon fa fa-pencil"></span>&nbsp;Reply</a>' : '';
					if($row['ticketinboxStatus'] == 'New'){
						$row['ticketinboxStatus'] = '<b style="color:#787878">'. $row['ticketinboxStatus'] . '</b>';
						$row['ticketinboxId'] = '<b style="color:#787878">'. $row['ticketinboxId'] . '</b>';
						$row['ticketinboxPengirimId'] = '<b style="color:#787878">'. $row['ticketinboxPengirimId'] . '</b>';
					}
					array_push($items, $row);
				}
			}
			$records["rows"] = $items;
			
			echo json_encode($records);
		}
	}
	

	function reply()
    {
		#if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		$this->db->update('bot_ticket_inbox', array('ticketinboxStatus' => 'Replied', 'ticketinboxMessageReplay' => $this->input->post('ticketinboxMessageReplay')), array('ticketinboxId' => $this->input->post('id')));
		$this->db->trans_begin();
		if ($this->db->trans_status() === FALSE) {
			$this->db->trans_rollback();
			echo json_encode(array('isError' => true,'errorMsg' => 'Data gagal untuk tersimpan.'));
		} else {
			$this->db->trans_commit();
			$pesan = $this->input->post('ticketinboxMessageReplay') . '(No. Ticket #'. $this->input->post('id') .')';
			$this->telegram->_sendApiMsg($this->input->post('chatId'), $pesan);
			echo json_encode(array('isError' => false,'errorMsg' => 'Data sudah disimpan.'));
		}
	}
}