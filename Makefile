# Generate ZeroMQ archive.org upload/download CSV files

GENTOOL=./genarchiveorgcsv
GENREDIRECT=./gendownloadredirect
GENDOWNLOAD=./gendownloadpage
ZEROMQ=csv/zeromq.csv csv/zeromq-1st.csv csv/zeromq-rest.csv csv/zeromq-redirect.csv zeromq-download.html

all: $(ZEROMQ)

csv/zeromq.csv: $(GENTOOL)
	$(GENTOOL) /web/download.zeromq.org >$@

csv/zeromq-1st.csv: csv/zeromq.csv
	egrep "^identifier,|^zeromq_0.1," $< >$@

csv/zeromq-rest.csv: csv/zeromq.csv
	grep -v "^zeromq_0.1," $< >$@

csv/zeromq-redirect.csv: csv/zeromq.csv
	$(GENREDIRECT) $< >$@

zeromq-download.html: csv/zeromq.csv $(GENDOWNLOAD) 
	$(GENDOWNLOAD) $< >$@
