import java.util.Date;
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

//String contentFullName, contentVersioned;

String friendlyDate;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  background(0);
  currentTime();
}

void mousePressed() {
  println("[PROGRAM RUNNING]... \n");
  println("SWEEPING FILES... \n");
  fileSweep();
  println("FINDING VERSIONS... \n");
  versionFind();
  println("COPYING FILES... \n");
  copyFiles();
  println("\n[PROGRAM COMPLETE] \n");
}

void  currentTime() {
    if (minute() < 10) {
      friendlyDate = hour() + ":0" + minute() + "." + second() + "  -  " + month() + "/" + day() + "/" + year();
    } else {
      friendlyDate = hour() + ":" + minute() + "." + second() + "  -  " + month() + "/" + day() + "/" + year();
    }
  }
