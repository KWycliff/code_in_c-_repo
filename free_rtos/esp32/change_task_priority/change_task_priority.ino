TaskHandle_t xTask2Handle = NULL;

void vTask1(void* parameters){
  UBaseType_t uxPriority;

  uxPriority = uxTaskPriorityGet(NULL);
  for(;;){
    Serial.println("Task 1 is running");
     
    Serial.println("About to raise task 2 priority");

    vTaskPrioritySet(xTask2Handle,(uxPriority+1));
  }
}

void vTask2(void* parameters){
  UBaseType_t uxPriority;

  uxPriority = uxTaskPriorityGet(NULL);
  for(;;){
    Serial.println("Task 2 is running");

    Serial.println("About to reduce task 2 priority");

    vTaskPrioritySet(NULL,(uxPriority - 2));
  }
}


void setup() {
  // put your setup code here, to run once:
  // set the baud rate
  Serial.begin(9600);

  //create Task one
  xTaskCreate(vTask1,"Task one",1000,NULL,2,NULL);

  // create Task two
  xTaskCreate(vTask2,"Task two",1000,NULL,1,&xTask2Handle);

  vTaskStartScheduler();

}

void loop() {
  // put your main code here, to run repeatedly:

}
