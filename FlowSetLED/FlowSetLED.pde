#include <FlowCommandHandler.h>

#define SET_LED1_COMMAND "SET LED #1"

void setup() {                
  Serial.begin(115200);
  g_EnableConsole = true;
  g_EnableConsoleInput = true;
  
  pinMode(PIN_LED1, OUTPUT);   
  
  
  FlowCommandHandler.attach(SET_LED1_COMMAND, setLED1);
}

#define STATE_ON "ON"
#define STATE_OFF "OFF"

bool led1 = LOW;
void setLED1(ReadableXMLNode &params, XMLNode &response)
{
    ReadableXMLNode stateNode = params.getChild("state");
    const char *stateContent = stateNode.getValue();
    if (strncmp(stateContent, STATE_ON, strlen(STATE_ON)) == 0)
    {
      led1 = HIGH;
    } 
    else if (strncmp(stateContent, STATE_OFF, strlen(STATE_OFF)) == 0)
    {
      led1 = LOW;
    }
        
    digitalWrite(PIN_LED1, led1);
}


void loop() {
}
