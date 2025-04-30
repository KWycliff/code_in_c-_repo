
void vtask1(void* pvparameters){
  for(;;){
    Serial.print("task1_executing \r\n");
    vTaskDelay(1000/portTICK_PERIOD_MS);
  }
}

void vtask2(void* pvparameters){
  xTaskCreate(vtask1,"task_1",1000,NULL,1,NULL);
  for(;;){
    Serial.print("task2_running \r\n");
    vTaskDelay(1000/portTICK_PERIOD_MS);
  }
}


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  xTaskCreatePinnedToCore(vtask1,"task_2",1000,NULL,2,NULL,0);

  xTaskCreatePinnedToCore(vtask2,"task_2",1000,NULL,1,NULL,1);

}

void loop() {
  // put your main code here, to run repeatedly:

}
