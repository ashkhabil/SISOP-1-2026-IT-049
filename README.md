# SISOP-1-2026-IT-049

# Reporting

Ashkhabil Abror Budihardjo (5027251049)

# Soal 1

penjelasan

dimulai dari statement awal
 
    BEGIN {

	FS=","
  
	if (ARGC < 3) {
	print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
	print "Contoh penggunaan: awk -f file.sh data.csv a"
	exit
    }

	mode = ARGV[2]
	ARGV[2] = ""   #agar program tidak menganggap sebagai file
    }  

inti dari statement awal diatas untuk memberikan output ketika user menginputkan argumen tidak sesuai sebagaimana yang telah ditentukan dari soal (awk -f file.sh passenger.csv a). Untuk ARGV sendiri berfungsi sebagai parameter mode (a/b/c/d/e) agar tidak dianggap sebagai file tambahan oleh awk. 

Untuk mode nya sebagai berikut.

    FNR == 1 { next }
    mode == "a" {
    count_passenger++
    }

FNR berfungsi untuk melewati header sehingga header tidak ikut terbaca ketika command diinput ke awk. Mode a menghitung jumlah seluruh penumpang yang ada pada passenger.csv.

berikut adalah mode b.

    mode == "b" {
    gerbong[$4] = 1
    }

untuk mode b berfungsi mengetahui kolom gerbong pada data passenger.csv dan menyimpannya di dalam array.

berikut adalah mode c.

    mode == "c" {
    if ($2 > max_usia) {
        max_usia = $2
        nama = $1
      }
    }

untuk mode c berfungsi mencari tahu usia tertua dan siapa orangnya pada data passenger.csv.

berikut adalah mode d.

    mode == "d" {
    total++
    sum += $2
    }

untuk mode d berfungsi menghitung rata-rata usia dari penumpang yang ada pada passenger.csv.

berikut adalah mode e.

    mode == "e" {
    if ($3 == "Business") {
        business++
      }
    }

untuk mode e berfungsi menghitung total penumpang business class.

Untuk statement akhir berfungsi memberikan output dari mode yang sudah didefinisikan sebelumnya.

    END {
    if (mode == "a") {
        print "Jumlah seluruh penumpang KANJ adalah", count_passenger " orang"
      }
    else if (mode == "b") {
        count_passenger = 0
        for (g in gerbong) count_passenger++
        print "Jumlah gerbong penumpang KANJ adalah", count_passenger
      }
    else if (mode == "c") {
        print nama " adalah penumpang kereta tertua dengan usia", max_usia " tahun"
      }
    else if (mode == "d") {
        if (total > 0)
            print "Rata-rata usia penumpang adalah", int(sum/total), "tahun"
      }
    else if (mode == "e") {
        print "Jumlah penumpang business class ada", business " orang"
      }
    else {
        print "Soal tidak dikenali. Gunakan a, b, c, d, atau e."
        print "Contoh penggunaan: awk -f file.sh data.csv a"
      }
    }

inti dari statement akhir ini adalah memberikan output yang benar ketika memasukkan command yang benar dan output tertentu ketika memasukkan command yang tidak sesuai soal (a/b/c/d/e).

untuk mode b for (g in gerbong) count_passenger++ fungsinya adalah menghitung jumlah key unik yang ada di array.

	  else if (mode == "b") {
        count_passenger = 0
        for (g in gerbong) count_passenger++
        print "Jumlah gerbong penumpang KANJ adalah", count_passenger
      }

untuk mode d int(sum/total) berfungsi menghitung rata-rata dari usia penumpang dan dibulatkan ke bawah.

		 else if (mode == "d") {
        if (total > 0)
            print "Rata-rata usia penumpang adalah", int(sum/total), "tahun"
      }

# Kendala :

ketika memasukkan command awk -f file.sh data.csv a program tidak bisa menjalankannya karena masih dalam bahasa bash

		#!/bin/bash
solusinya adalah mengubah bash menjadi awk sehingga program dapat menjalankan command awk -f file.sh data.csv a.

		#!/bin/awk
# Revisi :

output pada sub soal b seharusnya 4 tapi yang saya jalankan programnya adalah 5.

<img width="1042" height="44" alt="Screenshot 2026-03-29 223528" src="https://github.com/user-attachments/assets/111e95dc-fd08-4ab8-a85f-0c1ee1bc51d8" />

revisinya yaitu saya membuat command sed -i 's/\r$//' passenger.csv untuk membersihkan karakter tersembunyi pada file passenger.csv.
Lalu ini adalah hasilnya.

<img width="1049" height="65" alt="Screenshot 2026-03-29 223931" src="https://github.com/user-attachments/assets/2bd39624-9073-4475-855a-1315346ea87a" />
