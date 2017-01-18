#
set projectdir=%cd%

set BIOC=%projectdir%/lib/bioc-1.0.1.jar
set LOG4JAPI=%projectdir%/lib/log4j-api-2.1.jar
set ANALYZERS=%projectdir%/lib/lucene-analyzers-common-4.10.0.jar
set QUERYIES=%projectdir%/lib/lucene-queries-4.10.0.jar
set NLP=%projectdir%/lib/nlp-2.4.C.jar
set OPENNLPTOOLS=%projectdir%/lib/opennlp-tools-1.5.3.jar
set CONTEXT=%projectdir%/lib/context-2012.jar
set LOG4JCORE=%projectdir%/lib/log4j-core-2.1.jar
set CORE=%projectdir%/lib/lucene-core-4.10.0.jar
set QUERYPARSER=%projectdir%/lib/lucene-queryparser-4.10.0.jar
set OPENNLPMAXENT=%projectdir%/lib/opennlp-maxent-3.0.3.jar

set JARSPATH=%ANALYZERS%;%CORE%;%QUERYPARSER%;%OPENNLPTOOLS%;%OPENNLPMAXENT%;%BIOC%;%NLP%;%LOG4JAPI%;%LOG4JCORE%;%CONTEXT%

set OPENNLP_MODELS=%projectdir%/data/models
set CONFIGDIR=%projectdir%/config

set JVMOPTS=-Den-sent.bin.path=%OPENNLP_MODELS%/en-sent.bin -Den-token.bin.path=%OPENNLP_MODELS%/en-token.bin -Den-pos-maxent.bin.path=%OPENNLP_MODELS%/en-pos-maxent.bin -Dlog4j.configurationFile=file://%projectdir%/config/log4j2.xml -Dmetamaplite.property.file=%CONFIGDIR%/metamaplite.properties -Dmetamaplite.entitylookup.resultlength=1500 -Dmetamaplite.cuiconceptindex=%projectdir%/data/lucenedb/strict/cuiconcept -Dmetamaplite.firstwordsofonewideindex=%projectdir%/data/lucenedb/strict/first_words_of_one_WIDE -Dmetamaplite.cuisourceinfoindex=%projectdir%/data/lucenedb/strict/cui_sourceinfo -Dmetamaplite.cuisemantictypeindex=%projectdir%/data/lucenedb/strict/cui_st -Dmetamaplite.varsindex=%projectdir%/data/lucenedb/strict/vars

java -cp %projectdir%/target/classes;%projectdir%/classes;%JARSPATH%;%CONFIGDIR% %JVMOPTS% gov.nih.nlm.nls.ner.MetaMapLite %* 
