all: html
html:
	xsltproc --nonet ./xslt/html/docbook.xsl doc.xml > doc.html
pdf:
<<<<<<< HEAD
	dblatex -d -p ./style/doc.xsl --texstyle=./style/mystyle.sty doc.xml
=======
	dblatex -d -p doc.xsl --texstyle=./mystyle.sty doc.xml
>>>>>>> a2b11c1f0028549ddd641bf7ae4424a2eee54ea9
clean:
	rm -rf doc.pdf *.log doc.html
