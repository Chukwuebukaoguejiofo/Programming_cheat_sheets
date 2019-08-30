//=========================================== Classes
File
FileWriter

other:
FileWriter, FileReader,
FileInputStream, FileOutputStream,
BufferedReader, BufferedWriter,
Files, Scanner,
DataInputStream, DataOutputStream,
BuffereInputStream, BufferedOutputStream,
RandomAccessFile

//=========================================== Gotchas

/*
- the whole file should not be brought to memory
- you could use Apache Commons IO ???
- you could use Guava ???
- to stream: means to fetch a chunck of the file
  and copy it to memory, work on it, then discard from memory,
  and repeat for the next line ???
*/

//=========================================== LINKS

// https://www.w3schools.com/java/java_files.asp

// https://github.com/eugenp/tutorials/tree/master/core-java-modules/core-java-io

//===========================================
// File class

import java.io.File;
import java.io.IOException;

// https://www.w3schools.com/java/java_files.asp

class Main {
  public static void main(String[] args) {
    try {
      /**
       * for `foo/bar/filename.txt`, the `foo/bar/` folder needs to exist
       */
      File myObj = new File("filename.txt");
      if (myObj.createNewFile()) {
        System.out.println("File created: " + myObj.getName());
      } else {
        System.out.println("File already exists.");
      }
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
  }
}



//=========================================== get info from file

import java.io.File;

public class GetFileInfo {
  public static void main(String[] args) {
    File myObj = new File("filename.txt");
    if (myObj.exists()) {
      System.out.println("File name: " + myObj.getName());
      System.out.println("Absolute path: " + myObj.getAbsolutePath());
      System.out.println("Writeable: " + myObj.canWrite());
      System.out.println("Readable " + myObj.canRead());
      System.out.println("File size in bytes " + myObj.length());
    } else {
      System.out.println("The file does not exist.");
    }
  }
}



//=========================================== FileWriter

import java.io.FileWriter;   // Import the FileWriter class
import java.io.IOException;  // Import the IOException class to handle errors

public class WriteToFile {
  public static void main(String[] args) {
    try {
      FileWriter myWriter = new FileWriter("filename.txt");
      myWriter.write("Files in Java might be tricky, but it is fun enough!");
      myWriter.close();
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
  }
}




//==================================== Scanner class to read text files

// does not keep all the file in memory ??? VERIFY THIS

import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class ReadFile {
  public static void main(String[] args) {
    try {
      File myObj = new File("filename.txt");
      Scanner myReader = new Scanner(myObj);
      while (myReader.hasNextLine()) {
        String data = myReader.nextLine();
        System.out.println(data);
      }
      myReader.close();
    } catch (FileNotFoundException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
  }
}
//=========================================== FileInputStream

new FileInputStream(path);
new FileInputStream(new File(path)); // need to verify


//===========================================


//=========================================== BufferedInputStream

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;

public class Main {
   public static void main(String[] args) throws Exception {
      InputStream inStream = null;
      BufferedInputStream bis = null;

      try {
         // open input stream test.txt for reading purpose.

         // filename.txt is in the same folder as Main class
         inStream = new FileInputStream("filename.txt");

         // input stream is converted to buffered input stream
         bis = new BufferedInputStream(inStream);

         // read until a single byte is available
         while(bis.available()>0) {

            // read the byte and convert the integer to character
            char c = (char)bis.read();

            // print the characters
            System.out.println("Char: "+c);;
         }
      } catch(Exception e) {
         // if any I/O error occurs
         e.printStackTrace();
      } finally {
         // releases any system resources associated with the stream
         if(inStream!=null)
            inStream.close();
         if(bis!=null)
            bis.close();
      }
   }
}

//===========================================
//===========================================
//=========================================== Apache Commons IO

// does not keep all the file in memory
LineIterator it = FileUtils.lineIterator(theFile, "UTF-8");
try {
    while (it.hasNext()) {
        String line = it.nextLine();
        // do something with line
    }
} finally {
    LineIterator.closeQuietly(it);
}

//===========================================

