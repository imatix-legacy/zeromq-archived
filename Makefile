# Generate ZeroMQ archive.org upload/download CSV files

GENTOOL=./genarchiveorgcsv
GENMETADATA=./genmetadatacsv
GENREDIRECT=./gendownloadredirect
GENDOWNLOAD=./gendownloadpage
ZEROMQ=csv/zeromq.csv csv/zeromq-metadata.csv csv/zeromq-1st.csv csv/zeromq-rest.csv csv/zeromq-redirect.csv csv/zeromq-archive.org-icon.csv zeromq-download.html

all: $(ZEROMQ)

csv/zeromq.csv: $(GENTOOL)
	$(GENTOOL) /web/download.zeromq.org >$@

csv/zeromq-metadata.csv: $(GENMETADATA)
	$(GENMETADATA) /web/download.zeromq.org >$@

csv/zeromq-1st.csv: csv/zeromq.csv
	egrep "^identifier,|^zeromq_0.1," $< >$@

csv/zeromq-rest.csv: csv/zeromq.csv
	grep -v "^zeromq_0.1," $< >$@

csv/zeromq-redirect.csv: csv/zeromq.csv
	$(GENREDIRECT) $< >$@

csv/zeromq-archive.org-icon.csv: csv/zeromq.csv Makefile
	sed 's/^\([^,]*\),[^,]*,/\1,static\/zeromq-logo.png,/;  s/identifier,static\/zeromq-logo.png,/identifier,file,/;' $< | uniq >$@

zeromq-download.html: csv/zeromq.csv $(GENDOWNLOAD) 
	$(GENDOWNLOAD) $< >$@
