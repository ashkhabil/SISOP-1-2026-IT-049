#!/bin/awk

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

# Lewati header
FNR == 1 { next }

mode == "a" {
    count_passenger++
}

mode == "b" {
    gerbong[$4] = 1
}

mode == "c" {
    if ($2 > max_usia) {
        max_usia = $2
        nama = $1
    }
}

mode == "d" {
    total++
    sum += $2
}

mode == "e" {
    if ($3 == "Business") {
        business++
    }
}

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
