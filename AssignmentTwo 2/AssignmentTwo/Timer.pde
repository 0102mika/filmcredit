// class for Timer
class Timer {
  int timeStarted;
  int interval;
  
  Timer(int _totalTime) {
    timeStarted = _totalTime;
  }

  void start() {
    interval = millis();
  }

  boolean isFinished() {
    int elapsedTime = millis()-timeStarted;
    if (elapsedTime > interval) {
      return true;
    }else {
      return false;
    }
  }
}