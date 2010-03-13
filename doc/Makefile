all: html
html:
	xsltproc --nonet ./xslt/html/docbook.xsl doc.xml > doc.html
pdf:
	dblatex -d -p ./style/doc.xsl --texstyle=./style/mystyle.sty doc.xml
clean:
	rm -rf doc.pdf *.log doc.html
