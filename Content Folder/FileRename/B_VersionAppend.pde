String contentCheck, version;

IntList deletedRows;
int deletionTracker = 0;

void versionFind() {
  deletedRows = new IntList();
  Table table = loadTable(masterFileList, "header");
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    contentCheck = row.getString(headerName);
    //  println(contentCheck, row.getString(headerVersion));
    for (int j = table.getRowCount() - 1; j > 0; j--) {
      TableRow rowCheck = table.getRow(j);
      if (i != j) {
        if (contentCheck.equals(rowCheck.getString(headerName))) {
          if (deletionTracker == 0) {
            deletedRows.append(j+1);
          } else {
            deletedRows.append(j+2);
          }
          table.removeRow(i);
          deletionTracker++;
        }
      }
    }
  }
  saveTable(table, versionFileList);
}
