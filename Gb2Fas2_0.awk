## Awk script to organize fasta file directly from Gb file
## With headers as follow: Accession_Country_Year of collection
## 
## Date : 05/July/2021
## Written by The Ghost-Writer (I.D) from J.B backbone
## Version V2 :: Consider countries with Space in name -> ex : "New Caledonia"

BEGIN {in_origin_section = 0 } # this switch tells whether we have
# reached the "ORIGIN" section

/^VERSION/ { seqname = $2 ; next }

/\/country/ {sub(/"/, "",$2);country = substr($0,11);next}


/\/collection_date/ {date = substr($1,19,length($1)-19);print ">" seqname "_" country "_" date}

/^ORIGIN/ { in_origin_section = 1; next }

NF == 1 && $1 == "//" { in_origin_section = 0; next }

in_origin_section == 1 {
	sequence = "";			# reinitialize the sequence buffer

	for(i=2; i<=NF; i++) {		# for all the fields except the 1st
		sequence = sequence $i; # concatenate
	}

	print sequence			# print out the sequence (one line)
}


