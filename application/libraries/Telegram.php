<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Telegram
{
    private $token;
	
	function __construct()
	{
		$this->token = '545379607:AAHCHVkMkSokJwDdFxI74jmBEytei1xrML8';
		// $debug = false;
	}
	
	function _getApiUpdate($offset)
	{
		$method = 'getUpdates';
		$data['offset'] = $offset;

		$result = $this->_apiRequest($method, $data);

		$result = json_decode($result, true);
		if ($result['ok'] == 1) {
			return $result['result'];
		}

		return [];
	}
	
	function _sendApiMsg($chatid, $text, $msg_reply_id = false, $parse_mode = false, $disablepreview = false)
	{
		$method = 'sendMessage';
		$data = ['chat_id' => $chatid, 'text'  => $text];

		if ($msg_reply_id) {
			$data['reply_to_message_id'] = $msg_reply_id;
		}
		if ($parse_mode) {
			$data['parse_mode'] = $parse_mode;
		}
		if ($disablepreview) {
			$data['disable_web_page_preview'] = $disablepreview;
		}

		$result = $this->_apiRequest($method, $data);
	}

	function _sendApiAction($chatid, $action = 'typing')
	{
		$method = 'sendChatAction';
		$data = [
			'chat_id' => $chatid,
			'action'  => $action,

		];
		$result = $this->_apiRequest($method, $data);
	}

	function _apiRequest($method, $data)
	{
		if (!is_string($method)) {
			error_log("Nama method harus bertipe string!\n");

			return false;
		}

		if (!$data) {
			$data = [];
		} elseif (!is_array($data)) {
			error_log("Data harus bertipe array\n");
			return false;
		}


		$url = 'https://api.telegram.org/bot'.$this->token.'/'.$method;

		$options = [
			'http' => [
				'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
				'method'  => 'POST',
				'content' => http_build_query($data),
			],
		];
		$context = stream_context_create($options);

		$result = file_get_contents($url, false, $context);

		return $result;
	}
}