all: domain
pdf: domain
	cd ../doc/ && make pdf
domain:
	./umlgraph domain png -outputencoding utf8 
clean:
	rm -rf *png
	rm -rf __*log
