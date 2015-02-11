#include <FlowCommandHandler.h>

#define SET_LED1_COMMAND "SET LED #1"
#define GET_STATUS_COMMAND "GET STATUS"

void setup() {                
  Serial.begin(115200);
  g_EnableConsole = true;
  g_EnableConsoleInput = true;
  
  pinMode(PIN_LED1, OUTPUT);   
  
  
  FlowCommandHandler.attach(SET_LED1_COMMAND, setLED1);
  FlowCommandHandler.attach(GET_STATUS_COMMAND, getStatus);
}

bool led1 = LOW;
void setLED1(ReadableXMLNode &params, XMLNode &response)
{
    led1 = !led1;
    digitalWrite(PIN_LED1, led1);
}

void getStatus(ReadableXMLNode &params, XMLNode &response)
{
     XMLNode &statusNode = response.addChild("status");
  
     XMLNode &ledStatusNode = statusNode.addChild("ledStatus");
     
     // add a child-of-a-child node then set the content to
     // a string depending on a boolean check
     XMLNode &led1Node = ledStatusNode.addChild("led1");
     if (led1 == HIGH)
     {
       led1Node.setContent("ON");
     } 
     else 
     {
       led1Node.setContent("OFF");
     }
     
     
     // set an integer value as the content of another node
     // (millis() gives the number of millis the Arduino skecth
     // has been running)
     XMLNode &uptimeNode = statusNode.addChild("uptime");
     uptimeNode.setContent(millis());
     
     
     // calculate an aproximation of PI (using Zu's ratio)
     // then set add a decimal number to the pi node, specifying
     // that we want this value to 5 decimal places
     
     // see http://en.wikipedia.org/wiki/Mil%C3%BC
     double approxPi = 355.0/113.0;
     
     XMLNode &piNode = statusNode.addChild("pi");
     piNode.setContent(approxPi, 5);
}

void loop() {
}
