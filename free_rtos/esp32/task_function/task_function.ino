void vTaskFunction(void* parameters){
  char* TaskName;
  TickType_t ticks;
  TickType_t xLastWakeTime;
  TaskName = (char*)parameters;
  ticks = pdMS_TO_TICKS(1000);
  xLastWakeTime = xTaskGetTickCount();
  for(;;){
    Serial.print(TaskName);
    vTaskDelayUntil(&xLastWakeTime,ticks);
    //vTaskDelay(ticks);//(1000/portTICK_PERIOD_MS);   //this is a task blocking function
  }
}
static const char* Task1Text = "task 1 is running \r\n";
static const char* Task2Text = "task 2 is running \r\n";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  // create task1 from task function
  xTaskCreate(vTaskFunction,"Task one",1000,(void*)Task1Text,1,NULL);

  // create task2 from the same task function
  xTaskCreate(vTaskFunction,"Task two",1000,(void*)Task2Text,2,NULL);

  // start freeRtos scheduler
  vTaskStartScheduler();

}

void loop() {
  // put your main code here, to run repeatedly:

}
