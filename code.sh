# Dizindeki dosyaların isimlerini file1.txt adlı dosyaya yazma
ll | awk '{print $9}' > file1.txt

while read -r line
do
	# Office 2007 üstü sürüme sahip olan dosyalar
	# için dosyanın türünü bulma
	lineTo=$(file $line | awk '{print $3}')

	# Bulunan dosya tütüne göre uzantıyı değiştirme
	if [ $lineTo = "Excel" ]; then
		lineTe=$(echo $line | cut -d'.' -f1)
		mv $line $lineTe.xlsx
	elif [ $lineTo = "Word" ]; then
		lineTe=$(echo $line | cut -d'.' -f1)
		mv $line $lineTe.docx
	elif [ $lineTo = "PowerPoint" ]; then
		lineTe=$(echo $line | cut -d'.' -f1)
		mv $line $lineTe.pptx
	fi
done < "file1.txt"