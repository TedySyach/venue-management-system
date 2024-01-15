<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Transaksi_detail_model extends CI_Model{

	function get_jam_mulai_terpakai($tanggal, $lapangan_id){
        // 		$this->db->select('jam_mulai, durasi, jam_selesai,status');
        // 		$this->db->join('transaksi', 'transaksi_detail.trans_id = transaksi.id_trans');
        // 		$this->db->where('tanggal', $tanggal);
        // 		$this->db->where('lapangan_id', $lapangan_id);
        // 			$this->db->where('(status = "1" OR status = "2")'); // Gunakan operator OR untuk status 1 atau 2
        // 		return $query = $this->db->get('transaksi_detail')->result();
        
            date_default_timezone_set('Asia/Jakarta');
            $now = date("Y-m-d G:i:s");

		    $sql = "
				SELECT
					jam_mulai, durasi, jam_selesai, created_time, status
				FROM transaksi_detail
				INNER JOIN transaksi ON transaksi_detail.trans_id = transaksi.id_trans
				WHERE tanggal = ? AND lapangan_id = ? 
				AND (status = '1' OR status = '2')
				AND (
					(status = '2') OR 
					(status = '1' AND tipe_trx = '2') OR 
					(status = '1' AND tipe_trx = '1'  AND  TIMESTAMPDIFF(SECOND, transaksi.created_time, '$now') > 0 AND TIMESTAMPDIFF(SECOND, transaksi.created_time, '$now') <= 180)
				)
			";

			$query = $this->db->query($sql, array($tanggal, $lapangan_id));

			return $query->result();

	}
	
	function get_jam_selesai_terpakai($tanggal, $lapangan_id, $jam_selesai) {
		$this->db->select('jam_mulai, durasi, jam_selesai, status');
		$this->db->join('transaksi', 'transaksi_detail.trans_id = transaksi.id_trans');
		$this->db->where('tanggal', $tanggal);
		$this->db->where('lapangan_id', $lapangan_id);
		$this->db->where('status', '2');
		$this->db->where('jam_mulai', $jam_selesai);
		$query = $this->db->get('transaksi_detail');
	
		// Menghitung jumlah baris (record) yang dihasilkan
		$num_rows = $query->num_rows();
	
		return $num_rows;
	}
}
