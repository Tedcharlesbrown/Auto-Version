PrintWriter copyLogger;
StringList logTrack;

String serverCurrentFileList = "_ServerVersions.csv";

String sourceName, versionName;

Table serverTableCheck, serverTableCurrent;

String headerNewCopy = "CURRENT SERVER CONTENT";
String headerOldCopy = "CONTENT COPIES";

Boolean contentPush = false;

void copyFiles() {
  logTrack = new StringList(); 
  try { //TRIES FOR EXISTING copyLogger
    String[] logLoad = loadStrings("_ConsoleLog.txt");
    String logJoin = join(logLoad, ";");
    String[] logSplit = splitTokens(logJoin, ";");
    logTrack.append(logSplit);
    copyLogger = createWriter("_ConsoleLog.txt");
  }
  catch (NullPointerException e) { //MAKES NEW copyLogger
    copyLogger = createWriter("_ConsoleLog.txt");
  }

  Table table = loadTable(versionFileList, "header");
  Table serverTableCurrent = new Table();
  serverTableCurrent.addColumn(headerNewCopy);

  Table serverTableCheck = loadTable(serverCurrentFileList, "header");
  try { //TRIES FOR EXISTING serverTableCheck
    serverTableCheck.addColumn(headerOldCopy);
    for (int i = 0; i < table.getRowCount(); i++) {
      TableRow contentRow = serverTableCheck.addRow();
      contentRow.setString(headerOldCopy, serverTableCheck.getString(i, headerNewCopy));
    }
  }
  catch(NullPointerException e) { //MAKES NEW serverTableCheck AND LOADS
    saveTable(serverTableCurrent, serverCurrentFileList);
    serverTableCheck = loadTable(serverCurrentFileList, "header");
    serverTableCheck.addColumn(headerOldCopy);
    for (int i = 0; i < table.getRowCount(); i++) {
      TableRow contentRow = serverTableCheck.addRow();
      contentRow.setString(headerOldCopy, serverTableCheck.getString(i, headerNewCopy));
    }
  }

  Path thisFolder = Paths.get(path);
  Path parentFolder = thisFolder.getParent();
  Path serverFolder = Paths.get(parentFolder.toString(), watchoutFolder);

  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    sourceName = row.getString(headerPath);
    versionName = row.getString(headerName) + row.getString(headerType);

    Path source = Paths.get(sourceName);
    Path dest = Paths.get(serverFolder.toString(), versionName);

    CopyOption[] options = new CopyOption[] {
      StandardCopyOption.REPLACE_EXISTING, 
      StandardCopyOption.COPY_ATTRIBUTES
    };
    try {
      table.setString(i, headerServerVersion, row.getString(headerFullName));
      if (row.getString(headerServerVersion).equals(row.getString(headerFullName))) {
        TableRow serverRow = serverTableCurrent.addRow();
        serverRow.setString(headerNewCopy, row.getString(headerServerVersion));
        if (!serverTableCurrent.getString(i, headerNewCopy).equals(serverTableCheck.getString(i, headerNewCopy))) { // <--- CHECKS IF ALREADY THERE
          contentPush = true;
          Files.copy(source, dest, options);
          println("UPDATED FILES ||| " + serverTableCheck.getString(i, headerNewCopy) + " --> " + row.getString(headerServerVersion));
          //         logTrack.append("UPDATED FILES ||| " + serverTableCheck.getString(i, headerNewCopy) + " --> " + row.getString(headerServerVersion) + "   |||   " + friendlyDate);
          logTrack.append(friendlyDate + "   |||   " + serverTableCheck.getString(i, headerNewCopy) + " --> " + row.getString(headerServerVersion));
        }
      }
    } 
    catch(IOException e) {
      e.printStackTrace();
    }
  }
  if (!contentPush) {
    contentPush = false;
    println("---NO NEW CONTENT");
    //    logTrack.append("---NO NEW CONTENT   |||   " + friendlyDate);
    logTrack.append(friendlyDate + "   |||   NO NEW CONTENT");
  }
  for (int i = 0; i < logTrack.size(); i++) {
    copyLogger.println(logTrack.get(i));
  }
  copyLogger.flush();
  copyLogger.close();

  saveTable(serverTableCurrent, serverCurrentFileList);
  contentPush = false;
}
