// in this program, countinous blocking and periodic tasks are created
void vContinousProcessingTask(void* Parameters){
  char* TaskName;
  TaskName = (char*)Parameters;
  for(;;){
    Serial.print(TaskName);
  }
}
void vPeriodicTask(void* vParameters){
  TickType_t xLastWakeTime;

  const TickType_t xTaskDelay = pdMS_TO_TICKS(250);

  xLastWakeTime = xTaskGetTickCount();

  for(;;){
    Serial.println("Periodic Task is Executing wait");


    vTaskDelayUntil(&xLastWakeTime,xTaskDelay);
  }
}

//void vtaskdisp(void *vparameters){
//  static char buf[512];
//  vTaskList(buf);
//  Serial.println(buf);
//  for(;;){

//  }
//}

  static const char* Task1Text = "continous Task 1 is running\r\n";
  static const char* Task2Text = "continous Task 2 is running\r\n";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  // create task one
  xTaskCreate(vContinousProcessingTask,"task one",1000,(void *)Task1Text,1,NULL);

  // create task two
  xTaskCreate(vContinousProcessingTask,"task two",1000,(void *)Task2Text,1,NULL);

  //create periodic task
  xTaskCreate(vPeriodicTask,"periodic task",2000,NULL,2,NULL);

  // create display task
  //xTaskCreate(vtaskdisp,"display_task",1000,NULL,1,NULL);

  //vTaskStartScheduler();

}

void loop() {
  // put your main code here, to run repeatedly:

}
