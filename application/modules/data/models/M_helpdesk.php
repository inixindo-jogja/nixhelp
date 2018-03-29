<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class M_helpdesk extends CI_Model
{

	function __construct()
	{
		parent::__construct();
	}		
	
	function total_record()
	{
		$query=$this->db->get('bot_ticket_inbox');
		return $query->num_rows();
	}

	function get_helpdesk( $object = array(), $limit = NULL, $offset = NULL, $order = array()){
		$this->db->select("*");
		
		if(!is_null($object)) {
			foreach($object as $row => $val)
			{
				if(preg_match("/(<=|>=|=|<|>)(\s*)(.+)/i", trim($val), $matches))
					$this->db->where( $row .' '.$matches[1], $matches[3]);
				else
					$this->db->where( $row .' LIKE', '%'.$val.'%');
			}
		}
		
		if(!empty($order)){
			foreach($order as $row => $val)
			{
				$ordered = (isset($val)) ? $val : 'ASC';
				$this->db->order_by($row, $val);
			}
		}
	
		if(!is_null($limit) && !is_null($offset)){
			$this->db->limit($limit, $offset );
		} 
		
		$query = $this->db->get( 'bot_ticket_inbox' );
		if ( $query->num_rows() > 0 ) return $query;
		return NULL;
	}
	function update_data_helpdesk($data, $filter){
		return $this->db->update('bot_ticket_inbox', $data, $filter); 
	}
	function delete_data_helpdesk($filter){	
		return $this->db->delete('bot_ticket_inbox', $filter); 
	}
	
}