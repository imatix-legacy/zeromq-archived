# ZeroMQ Downloads from Archive.Org

On 2016-05-26 the archives on [http://download.zeromq.org/](http://download.zeromq.org/)
were uploaded to the Internet Archive for safe keeping, prior to the 
VM that had hosted `download.zeromq.org` being shut down.  

These uploads are in the [ZeroMQ Collection](https://archive.org/details/zeromq)
at the Internet Archive, and contain all the historical release of
ZeroMQ.  

Current releases of ZeroMQ can be found on the GitHub Release pages
for the relevant projects:

*   [ZeroMQ 4.x](https://zeromq.github.io/zeromq4-1/)

*   [ZeroMQ 3.x](https://zeromq.github.io/zeromq3-x/)

and future releases will be added to those (and related) GitHub Release
pages.  See the [ZeroMQ "Get the Software"](http://zeromq.org/intro:get-the-software)
page for more information on current downloads.

This repository contains:

*   [genarchiveorgcsv](genarchiveorgcsv) -- the script used to make the archive.org bulk-upload CSV

*   The CSV files used for the bulk upload:

    *   [csv/zeromq.csv](csv/zeromq.csv) -- full list

    *   [csv/zeromq-1st.csv](csv/zeromq-1st.csv) -- first archive.org identifier (used for test upload)

    *   [csv/zeromq-rest.csv](csv/zeromq-rest.csv) -- remainder of `zeromq.csv`

*   [zeromq-logo.png](zeromq-logo.png) -- the ZeroMQ Logo used on the archive.org collection

It also contains two files to facilitate implementing a "redirect service"
from the old filenames to their new locations:

*   [csv/zeromq-redirect.csv](csv/zeromq-redirect.csv) -- a filename and new URL mapping CSV

*   [gendownloadredirect](gendownloadredirect) -- the tool that built the redirect CSV

(plus a Makfile that rebuilds all of these; note that `csv/zeromq.csv` 
cannot be rebuilt without the contents of the original hosting VM).
