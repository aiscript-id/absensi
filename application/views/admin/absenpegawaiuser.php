<div class="container-fluid">
    <h1 class="my-4"><span class="fas fa-user-check mr-2"></span>Rekap Absensi Pegawai</h1>
    <div class="card">
        <div class="card-header">
            <!-- jumlah hari -->
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Jumlah Hari</label>
                        <input type="text" class="form-control" id="jumlah_hari" value="<?= $jumlah_hari ?>" readonly>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="float-right d-inline">
                        <!-- form search date from start and end  -->
                        <form action="<?= base_url('user-absensi') ?>" method="post">
                            <div class="form-row">
                                <div class="col-md-4">
                                    <input type="date" class="form-control" id="tanggalawal" name="tanggalawal" placeholder="Tanggal Awal" value="<?= @$tanggalawal ?>">
                                </div>
                                <div class="col-md-4">
                                    <input type="date" class="form-control" id="tanggalakhir" name="tanggalakhir" placeholder="Tanggal Akhir" value="<?= @$tanggalakhir ?>">
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary btn-block"><span class="fas fa-search mr-1"></span>Cari</button>
                                </div>
                            </div>
                        </form>

                        <!-- table absensi user -->

                    </div>
                </div>
            </div>
            
        </div>
        <?php 
            // all pegawai
            $pegawai = $this->db->get('user')->result_array();
        ?>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dashboard" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Pegawai</th>
                            <th>Hadir</th>
                            <th>Sakit</th>
                            <th>Dinas</th>
                            <th>Terlambat</th>
                            <th>Pulang Awal</th>
                            <th>Keterlambatan</th>
                            <th>Jam Kerja</th>
                            <!-- <th>Aksi</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; ?>
                        <?php foreach ($pegawai as $p) : ?>
                            <?php 
                            // count db absensi
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // Bekerja Di Kantor
                            $this->db->where('keterangan_absen', 'Bekerja Di Kantor');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $hadir = $this->db->get('db_absensi')->num_rows();

                            // Sakit
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // Sakit
                            $this->db->where('keterangan_absen', 'Sakit');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $sakit = $this->db->get('db_absensi')->num_rows();

                            // Dinas
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // Dinas
                            $this->db->where('keterangan_absen', 'Dinas');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $dinas = $this->db->get('db_absensi')->num_rows();


                            // Terlambat
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // Terlambat
                            $this->db->where('status_pegawai', '2');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $terlambat = $this->db->get('db_absensi')->num_rows();

                            // Pulang Awal
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // Pulang Awal
                            // $this->db->where('alasan_duluan', '!=', null);
                            $this->db->where('alasan_duluan is NOT NULL', NULL, FALSE);
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $pulang_awal = $this->db->get('db_absensi')->num_rows();

                            // Jam Kerja
                            // get absensi
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // sum jam kerja
                            $this->db->select_sum('jam_kerja');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $jam_kerja = $this->db->get('db_absensi')->row_array();
                            $jam_kerja = $jam_kerja['jam_kerja'];

                            // Keterlambatan
                            $this->db->where('kode_pegawai', $p['kode_pegawai']);
                            // sum keterlambatan
                            $this->db->select_sum('keterlambatan');
                            if (@$tanggalawal && @$tanggalakhir) {
                                $this->db->where('tanggal >=', $tanggalawal);
                                $this->db->where('tanggal <=', $tanggalakhir);
                            }
                            $keterlambatan = $this->db->get('db_absensi')->row_array();
                            $keterlambatan = $keterlambatan['keterlambatan'];
                                
                            ?>
                            <tr>
                                <td><?= $no; ?></td>
                                <td><?= $p['nama_lengkap']; ?></td>
                                <td><?= $hadir; ?></td>
                                <td><?= $sakit; ?></td>
                                <td><?= $dinas; ?></td>
                                <td><?= $terlambat; ?></td>
                                <td><?= $pulang_awal; ?></td>
                                <td><?= $keterlambatan; ?> Menit</td>
                                <td><?= $jam_kerja; ?>  (<?= round($jam_kerja / 60, 2) ?> jam)</td>
                                <!-- <td>
                                    <a href="<?= base_url('admin/absensi/detail/' . $p['id_pegawai']); ?>" class="btn btn-primary btn-sm"><span class="fas fa-eye"></span></a>
                                </td> -->
                            </tr>
                            <?php $no++; ?>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>No</th>
                            <th>Nama Pegawai</th>
                            <th>Hadir</th>
                            <th>Sakit</th>
                            <th>Dinas</th>
                            <th>Terlambat</th>
                            <th>Pulang Awal</th>
                            <th>Keterlambatan</th>
                            <th>Jam Kerja</th>
                            <!-- <th>Aksi</th> -->
                        </tr>
                    </tfoot>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>