// A program to send and receive structures from a freeRtos queue

QueueHandle_t xQueue;

// Enumerated type to define the source of data
typedef enum{
  sender1,
  sender2
}DataSource_t;

//structure type that will be passed onto the queue
typedef struct 
{
  uint8_t ucValue;
  DataSource_t eDataSource;
}Data_t;

//declare two variables that will be passed on to the queue
static const Data_t xStructsToSend[2] = 
{
  {100,sender1},
  {200,sender2}
};

static void vSenderTask(void* vparameters){
  BaseType_t xStatus;
  const TickType_t xTicksToWait = pdMS_TO_TICKS(500);
  for(;;){
    //send queue
    xStatus = xQueueSend(xQueue,vparameters,xTicksToWait);

    if(xStatus!=pdPASS){
      Serial.println("Could not send to queue");
    } 
  }
}

static void vReceiverTask(void* vparameters){
  Data_t xReceiverStruct;
  BaseType_t xStatus;

  for(;;){
    if(uxQueueMessagesWaiting(xQueue) != 3){
      Serial.println("Queue should have been full");
    }
    xStatus = xQueueReceive(xQueue,&xReceiverStruct,0);

    if(xStatus == pdPASS){
      if(xReceiverStruct.eDataSource == sender1){
        Serial.print("From sender1 = ");
        Serial.println(xReceiverStruct.ucValue);
      }
      else{
        Serial.print("From sender2 = ");
        Serial.println(xReceiverStruct.ucValue);
      }
    }
    else{
      Serial.print("could not receive from queue");
    }
  }
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  xQueue = xQueueCreate(3,sizeof(Data_t));

  if(xQueue != NULL){
    xTaskCreate(vSenderTask,"sender 1",1000,(void*)&(xStructsToSend[0]),2,NULL);
    xTaskCreate(vSenderTask,"sender 2",1000,(void*)&(xStructsToSend[1]),2,NULL);
    xTaskCreate(vReceiverTask,"Receiver",1000,NULL,1,NULL);
    vTaskStartScheduler();
  }
  else{

  }

  for(;;){

  }

}

void loop() {
  // put your main code here, to run repeatedly:

}
