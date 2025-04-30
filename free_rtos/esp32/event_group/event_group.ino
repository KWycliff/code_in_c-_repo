// a demo, freeRtos event group example

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"

#define TaskOne_Bit (1UL << 0UL)
#define TaskTwo_Bit (1UL << 1UL)
#define TaskThree_Bit (1UL << 2UL)

 static EventGroupHandle_t xEventGroup;

static void BitSettingTask(void* pvParameters){
  const TickType_t Delay200 = pdMS_TO_TICKS(500);
  for(;;){
    // delay for 200ms before starting the next loop
    vTaskDelay(Delay200);

    Serial.println("Bit 0 is about to be set");
    xEventGroupSetBits(xEventGroup,TaskOne_Bit);

    //delay another 200ms to set the second bit
    vTaskDelay(Delay200);

    Serial.println("Bit 1 is about to be set");
    xEventGroupSetBits(xEventGroup,TaskTwo_Bit);

    //delay another 200ms to set the third bit
    vTaskDelay(Delay200);

    Serial.println("Bit 2 is about to be set \r\n");
    xEventGroupSetBits(xEventGroup,TaskThree_Bit);
  }
}

static void EventBitReading(void* pvParameters){
  EventBits_t xEventGroupValue;
  const EventBits_t xBitsToWait = (TaskOne_Bit|TaskTwo_Bit|TaskThree_Bit);

  for(;;){
    xEventGroupValue = xEventGroupWaitBits(xEventGroup, // event group to read
                                      xBitsToWait, // bits to test
                                      pdTRUE, // clear bits if unblocking condition is met
                                      pdTRUE, // don't wait for all the bits to unblock
                                      portMAX_DELAY // don't time out
    );
    if((xEventGroupValue&TaskOne_Bit) !=0){
      Serial.println("Event bit 0 was set");
    }
    if((xEventGroupValue&TaskTwo_Bit) !=0){
      Serial.println("Event bit 1 was set");
    }
    if((xEventGroupValue&TaskThree_Bit) !=0){
      Serial.println("Event bit 2 was set");
    }
  }
}

void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);

  xEventGroup = xEventGroupCreate();

  xTaskCreate(BitSettingTask,"bit setting task",1000,NULL,1,NULL);

  xTaskCreate(EventBitReading,"Bit Reading",1000,NULL,2,NULL);



}

void loop() {
  // put your main code here, to run repeatedly:

}
