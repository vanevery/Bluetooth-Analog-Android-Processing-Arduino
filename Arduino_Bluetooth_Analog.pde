
public static final String LOGTAG = "BlueToothSerialTest";
public static final String BLUETOOTH_MAC_ADDRESS = "00:06:66:42:1F:DF";
public static final int DELIMITER = 10;  // Newline in ASCII

BtSerial btserial;

int x = 0;
int y = 0;

void setup() {
  btserial = new BtSerial(this);
  String[] list = btserial.list();
  for (int i = 0; i < list.length; i++) {
    println(list[i]);
      /* 
       * 04-01 15:43:43.023: V/BlueToothTest(2722): 00:06:66:42:1F:DF
       * 04-01 15:43:43.023: V/BlueToothTest(2722): 30:17:C8:1C:CA:53
       */
  }
    
  btserial.connect(BLUETOOTH_MAC_ADDRESS);
  println("Connected");
}

void draw() {
  ellipse(x,y,x,y); 
}


public void btSerialEvent(BtSerial btserialObject) {
  try {
  // Read the data in, until we get a newline  
  String serialValue = btserialObject.readStringUntil(DELIMITER);
  println(serialValue);
    
  // The data is coming to us as an ASCII string so we have to turn it into an int
  // First we have to trim it to remove the newline
  int intSerialValue = Integer.parseInt(serialValue.trim());
  
  x = intSerialValue;
  y = intSerialValue;
  } catch (Exception e) {
   println(e.toString()); 
  }
}
