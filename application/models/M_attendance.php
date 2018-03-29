<?php

class M_attendance extends CI_Model {

    function __construct() {
        parent::__construct();

        $ci = & get_instance();
    }

    // get active employ
    function get_active_employee() {
        $sql = "SELECT a.`karyawanId`, a.`karyawanAbsenId`, 
                b.`jabatanJamMasuk`, b.`jabatanJamKeluar`
                FROM `sdm_karyawan` a
                INNER JOIN `sdm_jabatan` b
                ON a.`karyawanJabatanId` = b.`jabatanId`
                WHERE a.`karyawanStatusKaryawan` = 'Aktif'";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            $query->free_result();
            return $result;
        } else {
            return array();
        }
    }

    // get two last date work
    function get_two_lastdate_work($params) {
        $sql = "SELECT `presensiTanggal` 
                FROM `sdm_presensi` WHERE `presensiKaryawanId` = ? AND `presensiTanggal` < ?
                ORDER BY presensiTanggal DESC LIMIT 0,2";
        $query = $this->db->query($sql, $params);
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            $query->free_result();
            return $result;
        } else {
            return array();
        }
    }

    function is_existdata($params) {
        $retval = TRUE;
        $sql = "SELECT COUNT(*)'total' FROM `sdm_presensi` 
                WHERE `presensiKaryawanId` = ? AND `presensiTanggal` = ?";
        $query = $this->db->query($sql, $params);
        if ($query->num_rows() > 0) {
            $result = $query->row_array();
            $query->free_result();
            if ($result['total'] == 0) {
                $retval = FALSE;
            }
        } else {
            $retval = FALSE;
        }
        return $retval;
    }

    // insert query
    function insert($table_name, $array_data, $array_where = NULL) { // array_where unused but use in programming
        return $this->db->insert($table_name, $array_data);
    }

    // update query
    function update($table_name, $array_data, $arr_where) {
        if (is_array($arr_where)) {
            for ($idx = 0; $idx < count($arr_where); $idx++) {
                $this->db->where($arr_where[$idx]);
            }
        } else {
            $this->db->where($arr_where);
        }


        return $this->db->update($table_name, $array_data);
    }

}
