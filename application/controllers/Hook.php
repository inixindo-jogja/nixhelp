<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Hook extends MX_Controller
{
	var $token;
	function __construct()
	{
		parent::__construct();
		$this->token = '545379607:AAHCHVkMkSokJwDdFxI74jmBEytei1xrML8';
		// $debug = false;
		$this->load->database();
		$this->load->library('telegram');
	}
	
	function index()
	{
		$entityBody = file_get_contents('php://input');
		$message = json_decode($entityBody, true);
		$this->_prosesApiMessage($message);
	}
	
	function _prosesApiMessage($sumber)
	{
		$updateid = $sumber['update_id'];

	   // if ($GLOBALS['debug']) mypre($sumber);

		if (isset($sumber['message'])) {
			$message = $sumber['message'];

			if (isset($message['text'])) {
				$this->_prosesPesanTeks($message);
			} else {
				// gak di proses silakan dikembangkan sendiri
			}
		}

		if (isset($sumber['callback_query'])) {
			//prosesCallBackQuery($sumber['callback_query']);
		}

		return $updateid;
	}
	
	function _prosesPesanTeks($message)
	{
		// if ($GLOBALS['debug']) mypre($message);

		$pesan = $message['text'];
		$chatid = $message['chat']['id'];
		$fromid = $message['from']['id'];

		switch (true) {
			case $pesan == '!id':
				$this->telegram->_sendApiAction($chatid);
				$text = 'ID Kamu adalah: '.$fromid;
				$this->telegram->_sendApiMsg($chatid, $text);
				break;
			
			case strpos($pesan, '!help') !== false :
				$this->telegram->_sendApiAction($chatid);
				$this->db->query("INSERT INTO bot_ticket_inbox (ticketinboxPengirimTanggal,ticketinboxPengirimId,ticketinboxChatId,ticketinboxMessageHelp) VALUES (?,?,?,?)", array(date("Y-m-d H:i:s"),$fromid,$chatid, str_replace("!help ","",$pesan)));
				$insert_id = $this->db->insert_id();
				$text = 'Terimkasih telah mengirimkan pesan aduan kepada Mr.BoT (No. Ticket #'. $insert_id .')';
				$this->telegram->_sendApiMsg($chatid, $text);
				break;
			
			default:
				// code...
				break;
		}
	}
}