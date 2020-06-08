int exstensionPicker;
String exstension;

String[] exstensionList = new String[130];
StringDict exstensionDict;

void exstensionInit(String tempFileName) {
  exstensionListInit();
  exstensionDict = new StringDict();
  for (int i = 0; i < exstensionList.length; i++) {
    String exstensionCheck = exstensionList[i];
    exstensionDict.set(str(i), exstensionList[i]);
    if (tempFileName.endsWith(exstensionCheck)) {
      exstensionPicker = i;
      exstension = exstensionDict.get(str(i));
    }
  }
}

/* SUPPORTED FILES
 VIDEO
 MP4
 MOV
 MXF
 WMV
 VOB
 SWF
 SRT
 RM
 M4V
 FLV
 AVI
 IMAGES
 PNG
 JPG
 BMP
 PSD
 GIF
 ICO
 AI
 EPS
 SVG
 IMAGE SEQUENCE
 TGA
 DPX
 TIFF
 AUDIO
 WAV
 AIF
 MPEG
 MP3
 3D
 3DS
 OBJ
 DAE
 LWO
 LWS
 LXO
 BLEND
 FBX
 MAX
 3DM
 TEXT
 TXT
 DOC
 DOCX
 PAGES
 RTF
 DATA
 CSV
 DAT
 PPS
 PPT
 PPTX
 INDD
 PDF
 XLR
 XLS
 XLSX
 CAD
 DWG
 DXF
 VWX
 C4D
 SKP
 */

void exstensionListInit() {
  //VIDEOS 0-19
  exstensionList[0] = "mp4";
  exstensionList[1] = "mov";
  exstensionList[2] = "mpg";
  exstensionList[3] = "mxf";
  exstensionList[4] = "wmv";
  exstensionList[5] = "vob";
  exstensionList[6] = "swf";
  exstensionList[7] = "srt";
  exstensionList[8] = "rm";
  exstensionList[9] = "m4v";
  exstensionList[10] = "flv";
  exstensionList[11] = "avi";
  exstensionList[12] = "EMPTY";
  exstensionList[13] = "EMPTY";
  exstensionList[14] = "EMPTY";
  exstensionList[15] = "EMPTY";
  exstensionList[16] = "EMPTY";
  exstensionList[17] = "EMPTY";
  exstensionList[18] = "EMPTY";
  exstensionList[19] = "EMPTY";
  //IMAGES 20 - 39
  exstensionList[20] = "png";
  exstensionList[21] = "jpg";
  exstensionList[22] = "jpeg";
  exstensionList[23] = "bmp";
  exstensionList[24] = "psd";
  exstensionList[25] = "gif";
  exstensionList[26] = "ico";
  exstensionList[27] = "ai";
  exstensionList[28] = "eps";
  exstensionList[29] = "svg";
  exstensionList[30] = "EMPTY";
  exstensionList[31] = "EMPTY";
  exstensionList[32] = "EMPTY";
  exstensionList[33] = "EMPTY";
  exstensionList[34] = "EMPTY";
  exstensionList[35] = "EMPTY";
  exstensionList[36] = "EMPTY";
  exstensionList[37] = "EMPTY";
  exstensionList[38] = "EMPTY";
  exstensionList[39] = "EMPTY";
  //IMAGE SEQUENCE 40 - 59
  exstensionList[40] = "tga";
  exstensionList[41] = "dpx";
  exstensionList[42] = "tiff";
  exstensionList[43] = "EMPTY";
  exstensionList[44] = "EMPTY";
  exstensionList[45] = "EMPTY";
  exstensionList[46] = "EMPTY";
  exstensionList[47] = "EMPTY";
  exstensionList[48] = "EMPTY";
  exstensionList[49] = "EMPTY";
  exstensionList[50] = "EMPTY";
  exstensionList[51] = "EMPTY";
  exstensionList[52] = "EMPTY";
  exstensionList[53] = "EMPTY";
  exstensionList[54] = "EMPTY";
  exstensionList[55] = "EMPTY";
  exstensionList[56] = "EMPTY";
  exstensionList[57] = "EMPTY";
  exstensionList[58] = "EMPTY";
  exstensionList[59] = "EMPTY";
  //AUDIO 60 - 79
  exstensionList[60] = "wav";
  exstensionList[61] = "aif";
  exstensionList[62] = "mpeg";
  exstensionList[63] = "mp3";
  exstensionList[64] = "EMPTY";
  exstensionList[65] = "EMPTY";
  exstensionList[66] = "EMPTY";
  exstensionList[67] = "EMPTY";
  exstensionList[68] = "EMPTY";
  exstensionList[69] = "EMPTY";
  exstensionList[70] = "EMPTY";
  exstensionList[71] = "EMPTY";
  exstensionList[72] = "EMPTY";
  exstensionList[73] = "EMPTY";
  exstensionList[74] = "EMPTY";
  exstensionList[75] = "EMPTY";
  exstensionList[76] = "EMPTY";
  exstensionList[77] = "EMPTY";
  exstensionList[78] = "EMPTY";
  exstensionList[79] = "EMPTY";
  //3D 80 - 99
  exstensionList[80] = "3ds";
  exstensionList[81] = "obj";
  exstensionList[82] = "dae";
  exstensionList[83] = "lwo";
  exstensionList[84] = "lws";
  exstensionList[85] = "lxo";
  exstensionList[86] = "blend";
  exstensionList[87] = "fbx";
  exstensionList[88] = "max";
  exstensionList[89] = "3dm";
  exstensionList[90] = "EMPTY";
  exstensionList[91] = "EMPTY";
  exstensionList[92] = "EMPTY";
  exstensionList[93] = "EMPTY";
  exstensionList[94] = "EMPTY";
  exstensionList[95] = "EMPTY";
  exstensionList[96] = "EMPTY";
  exstensionList[97] = "EMPTY";
  exstensionList[98] = "EMPTY";
  exstensionList[99] = "EMPTY";
  //TEXT 100 - 105
  exstensionList[100] = "txt";
  exstensionList[101] = "doc";
  exstensionList[102] = "docx";
  exstensionList[103] = "pages";
  exstensionList[104] = "rtf";
  exstensionList[105] = "EMPTY";
  //DATA 106-
  exstensionList[106] = "csv";
  exstensionList[107] = "dat";
  exstensionList[108] = "pps";
  exstensionList[109] = "ppt";
  exstensionList[110] = "pptx";
  exstensionList[111] = "indd";
  exstensionList[112] = "pdf";
  exstensionList[113] = "xlr";
  exstensionList[114] = "xls";
  exstensionList[115] = "xlsx";
  exstensionList[116] = "EMPTY";
  exstensionList[117] = "EMPTY";
  exstensionList[118] = "EMPTY";
  exstensionList[119] = "EMPTY";
  // CAD 120 -
  exstensionList[120] = "dwg";
  exstensionList[121] = "dxf";
  exstensionList[122] = "vwx";
  exstensionList[123] = "c4d";
  exstensionList[124] = "skp";
  exstensionList[125] = "EMPTY";
  exstensionList[126] = "EMPTY";
  exstensionList[127] = "EMPTY";
  exstensionList[128] = "EMPTY";
  exstensionList[129] = "EMPTY";
}
