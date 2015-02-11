#include <FlowCommandHandler.h>

#define SET_LED1_COMMAND "SET LED #1"

void setup() {                
  Serial.begin(115200);
  g_EnableConsole = true;
  g_EnableConsoleInput = true;
  
  pinMode(PIN_LED1, OUTPUT);   
  
  
  FlowCommandHandler.attach(SET_LED1_COMMAND, setLED1);
}

bool led1 = LOW;
void setLED1(ReadableXMLNode &params, XMLNode &response)
{
    led1 = !led1;
    digitalWrite(PIN_LED1, led1);
    
    response.setContent("Hello FlowCloud!");
}


void loop() {
}
