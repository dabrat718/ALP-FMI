all: html
html:
	xsltproc --nonet ./xslt/html/docbook.xsl doc.xml > doc.html
pdf:
	dblatex -d -p doc.xsl --texstyle=./mystyle.sty doc.xml
clean:
	rm -rf doc.pdf *.log doc.html
