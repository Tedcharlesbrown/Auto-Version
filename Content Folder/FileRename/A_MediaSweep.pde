String thisFolderName = "FileRename";
String watchoutFolder = "Server Content";
String prefix = "../../" + watchoutFolder + "/";

String masterFileList = "_AllMedia.csv";
String versionFileList = "_CurrentVersions.csv";

PrintWriter allMediaOut;
StringList fileList, pathList;
String headerPath = "MASTER PATH";
String headerFullName = "MEDIA NAME";
String headerServerName = "SERVER VERSION";
String headerName = "NAME";
String headerType = ".TYPE";
String headerVersion = "MASTER VERSION";
String headerServerVersion = "TEMP VERSION";
String seperator = ",";

String contentName, contentSweep, indexString;
int indexValueStart, indexValueEnd;

String path;

void fileSweep() {
  path = sketchFile("").getParent(); //SET NEW PATH HERE
  //allMediaOut = createWriter("ContentTrack_" + hour() + "" + minute() + "" + second() + ".txt");
  allMediaOut = createWriter(masterFileList);
  allMediaOut.println(headerFullName + "," + headerName + "," + headerType + "," + headerVersion + "," + headerPath); //ADD NEW COLUMN HERE

  ArrayList<File> allFiles = listFilesRecursive(path);
  fileList = new StringList();
  pathList = new StringList();
  for (File f : allFiles) {
    fileList.append(f.getName().toLowerCase());
    pathList.append(f.getAbsolutePath());
  }
  for (int i = 0; i < fileList.size(); i++) {
    exstensionInit(fileList.get(i));
    contentSweep = fileList.get(i);
    indexValueStart = contentSweep.indexOf("_v");
    indexValueEnd = contentSweep.indexOf(exstension); // "txt" exstension
    indexString = contentSweep.substring(indexValueStart + 2, indexValueEnd - 1); //IF THIS DOESNT WORK, DELETE EVERYTHING THAT IS NOT .TXT
    contentName = contentSweep.substring(0, indexValueStart);
    //    allMediaOut.println(fileList.get(i) + seperator + contentName + seperator + indexString);
    allMediaOut.println(fileList.get(i) + seperator + contentName + seperator + "." + exstension + seperator + indexString + seperator + pathList.get(i));
  }
  allMediaOut.flush();
  allMediaOut.close();
}

// Function to get a list of all files in a directory and all subdirectories
ArrayList<File> listFilesRecursive(String dir) {
  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseDir(fileList, dir);
  return fileList;
}

// Recursive function to traverse subdirectories
void recurseDir(ArrayList<File> a, String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    if (!file.getName().equals(thisFolderName)) {
      //    if (!file.getName().equals(fileRename)) {
      File[] subfiles = file.listFiles();
      for (int i = 0; i < subfiles.length; i++) {
        // Call this function on all files in this directory
        recurseDir(a, subfiles[i].getAbsolutePath());
      }
    }
  } else if (!file.getName().endsWith("pde")) {
    a.add(file);
  }
}
