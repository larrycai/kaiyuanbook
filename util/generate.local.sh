#!/bin/sh
MARKDONW_CMD="markdown2"

webServerPath="$HOME/bin/mkdoc"

HTMLHEADFILE="index.head.html"
HTMLENDFILE="index.end.html"
indexMidFile="abc.html"

indexHtmlFile="index.html"

convertMkdFile()
{
	# convert all documents into html
	tmpInputFile="inputFile$$.mkd"
	cat ../docs/0*.mkd > $tmpInputFile
	${MARKDONW_CMD} $tmpInputFile > $indexMidFile
	
	rm -rf $tmpInputFile
}

generateWebSite()
{
	# update into complete html using blueprint css
	cat $HTMLHEADFILE  $indexMidFile $HTMLENDFILE >  $indexHtmlFile
	
	rm -rf $indexMidFile
	cp $indexHtmlFile $webServerPath
	cp -rf ../docs $webServerPath
}

convertMkdFile
generateWebSite
