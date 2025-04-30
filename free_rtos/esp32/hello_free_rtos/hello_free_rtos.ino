

int count1 = 0;
int count2 = 0;
int count3 = 0;
// create the freeRtos tasks
void task1(void* parameters){ 
  for(;;){ // infinite for loop
    Serial.print("Task1_Count: ");
    Serial.println(count1++);
    vTaskDelay(1000/portTICK_PERIOD_MS);

    if(count1==100){
      vTaskDelete(NULL);
    }
  }
}
void task2(void* parameters){ 
  for(;;){ // infinite for loop
    Serial.print("Task2_Count: ");
    Serial.println(count2++);
    vTaskDelay(1000/portTICK_PERIOD_MS);

    if(count2==200){
      vTaskDelete(NULL);
    }
  }
}
void task3(void* parameters){ 
  for(;;){ // infinite for loop
    Serial.print("Task3_Count: ");
    Serial.println(count3++);
    vTaskDelay(1000/portTICK_PERIOD_MS);
    
    if(count3==250){
      vTaskDelete(NULL);
    }
  }
}
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //create the freeRtos tasks
  xTaskCreate(
    task1, // function name
    "Task_one", // task name
    1000, // stack size or available memory
    NULL, // Task parameters
    1, // Task priority
    NULL // Task_Handle
  );

  xTaskCreate(
    task2, // function name
    "Task_two", // task name
    1000, // stack size or available memory
    NULL, // Task parameters
    1, // Task priority
    NULL // Task_Handle
  );

  xTaskCreate(
    task3, // function name
    "Task_three", // task name
    1000, // stack size or available memory
    NULL, // Task parameters
    1, // Task priority
    NULL // Task_Handle
  );

}

void loop() {
  // put your main code here, to run repeatedly:

}
