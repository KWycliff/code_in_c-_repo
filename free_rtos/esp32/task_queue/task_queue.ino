// in this program, am creating a queue to enable tasks to communicate

QueueHandle_t xQueue;

static void vTaskSender(void* parameters){
  int32_t lValueToSend; // local variable to hold values passed in to the task via the task parameters
  BaseType_t xStatus; // return status

  lValueToSend = (uint32_t)parameters;  //passin the value to send to the queue via the task parameter


  for(;;){
    
    xStatus = xQueueSendToBack(xQueue,&lValueToSend,0);

    if(xStatus != pdPASS){
      Serial.println("could not send to the queue");
    }

  }
}

static void vTaskReceiver(void* parameters){
  int32_t lReceivedValue; // local variable to hold values read from the queue
  BaseType_t xStatus; //return status
  const TickType_t xTicksToWait = pdMS_TO_TICKS(100);
  for(;;){
    if(uxQueueMessagesWaiting(xQueue) != 0){
      Serial.println("queue is empty");
    }

    xStatus = xQueueReceive(xQueue,&lReceivedValue,xTicksToWait);
    if(xStatus = pdPASS){
        Serial.print("Received val =");
        Serial.println(lReceivedValue);
    }
    else{
      Serial.println("could not receive from the queue");
    }
  }
}


void setup() {
  // put your setup code here, to run once:
  // set the baud rate
  Serial.begin(9600);

  xQueue = xQueueCreate(5,sizeof(int32_t));

  if(xQueue != NULL){
    //create two tasks to send data to the queue
    xTaskCreate(vTaskSender,"Sender1",1000,(void*)100,1,NULL);
    xTaskCreate(vTaskSender,"Sender2",1000,(void*)200,1,NULL);

    //create a task that will read from the queue with a higher priority
    xTaskCreate(vTaskReceiver,"receiver",1000,NULL,2,NULL);

  }

}

void loop() {
  // put your main code here, to run repeatedly:

}
