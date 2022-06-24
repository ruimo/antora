#!/bin/sh

# For PDF
docker run -e HOME=/documents -t --rm -u $(id -u) -v $(pwd):/documents/ ruimo/antora asciidoctor-pdf sample.adoc -n -a toc -r asciidoctor-diagram -a scripts=cjk -a pdf-theme=default-with-fallback-font -o sample.pdf

# For html
docker run -e HOME=/documents -t --rm -u $(id -u) -v $(pwd):/documents/ ruimo/antora asciidoctor sample.adoc -n -a toc -r asciidoctor-diagram -a scripts=cjk -a pdf-theme=default-with-fallback-font -o sample.html
