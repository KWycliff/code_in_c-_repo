#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/timers.h"
// in this program, a simple freeRtos timer is implementaed

#define main1_SHOT_TIMER_PERIOD pdMS_TO_TICKS(3333)
#define mainAUTO_TIMER_PERIOD pdMS_TO_TICKS(500)

uint8_t ulCallCount = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  TimerHandle_t xOneShotTimer; // one time shot software timer handle
  TimerHandle_t xAutoReloadTimer; // auto reload software timer handle

  BaseType_t xTimer1Started;
  BaseType_t xTimer2Started;

  xOneShotTimer = xTimerCreate("single Short",main1_SHOT_TIMER_PERIOD,pdFALSE,0,prvOneShortCallBack);

  xAutoReloadTimer = xTimerCreate("single Short",mainAUTO_TIMER_PERIOD,pdTRUE,0,prvAutoReloadCallBack);

  //check if the software timers were created
  if((xOneShotTimer != NULL)&& (xAutoReloadTimer != NULL) ){
    //APIs sending commands to the defaut command queue
    xTimer1Started = xTimerStart(xOneShotTimer,0);
    xTimer2Started = xTimerStart(xAutoReloadTimer,0);

    //check if the commands were correctly created
    if((xTimer1Started == pdPASS)&&(xTimer2Started == pdPASS)){
      //start the scheduler
      //vTaskStartScheduler();
    }
  }
  for(;;){

  }

}

// one shot callback function
static void prvOneShortCallBack(xTimerHandle xTimer){
  TickType_t xTimeNow;
  // get the current time using special freeRtos function
  xTimeNow = xTaskGetTickCount();
  Serial.print("one short timer is executing  ");
  Serial.println(xTimeNow);
  // file scope variable
  ulCallCount++;
}

// Auto Reload callback function
static void prvAutoReloadCallBack(xTimerHandle xTimer){
  TickType_t xTimeNow;
  // get the current time using special freeRtos function
  xTimeNow = xTaskGetTickCount();
  Serial.print("Auto Reload timer is executing  ");
  Serial.println(xTimeNow);
  // file scope variable
  ulCallCount++;
}

void loop() {
  // put your main code here, to run repeatedly:

}
