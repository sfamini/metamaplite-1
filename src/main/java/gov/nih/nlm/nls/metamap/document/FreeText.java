
//
package gov.nih.nlm.nls.metamap.document;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedReader;

import java.util.List;
import java.util.ArrayList;

import bioc.BioCDocument;
import bioc.BioCPassage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Unstructured text.
 */

public class FreeText implements BioCDocumentLoader {
  /** log4j logger instance */
  private static final Logger logger = LogManager.getLogger(FreeText.class);

  String text;
  public FreeText() { }
  public FreeText(String text) { this.text = text; }
  public String getText() {
    return this.text;
  }
  public void setText(String text) { this.text = text; }

  public static String loadFile(String inputFilename)
    throws FileNotFoundException, IOException
  {
    File inputFile  = new File(inputFilename);
    BufferedReader br = new BufferedReader(new FileReader(inputFile));
    long fileLen = inputFile.length();
    char[] buf = new char[(int)fileLen];
    br.read(buf,0, (int)fileLen);
    br.close();
    String text = new String(buf);
    return text;
  }

  public static BioCDocument instantiateBioCDocument(String docText) 
  {
    BioCDocument document = new BioCDocument();
    logger.debug(docText);
    BioCPassage passage = new BioCPassage();
    passage.setOffset(0);
    passage.setText(docText);
    passage.putInfon("docid", "00000000.tx");
    passage.putInfon("freetext", "freetext");
    document.addPassage(passage);
    document.setID("00000000.tx");
    return document;
  }

  public static List<BioCDocument> loadFreeTextFile(String filename) 
    throws FileNotFoundException, IOException
  {
    String inputtext = FreeText.loadFile(filename);
    List<BioCDocument> documentList = new ArrayList<BioCDocument>();
    BioCDocument document = instantiateBioCDocument(inputtext);
    documentList.add(document);
    return documentList;
  }

  public BioCDocument loadFileAsBioCDocument(String filename) 
    throws FileNotFoundException, IOException
  {
    String inputtext = FreeText.loadFile(filename);
    BioCDocument document = instantiateBioCDocument(inputtext);
    return document;
  }

  public List<BioCDocument> loadFileAsBioCDocumentList(String filename) 
    throws FileNotFoundException, IOException
  {
    return loadFreeTextFile(filename);
  }

}
