<?php
$koneksi = mysqli_connect("localhost", "root", "", "spk_saw_native");

// Check connection
if (mysqli_connect_errno()) {
	echo "Koneksi database gagal : " . mysqli_connect_error();
}
