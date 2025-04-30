// in this program, a binary semaphore is implemented
// to sych an interrupt to a task
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/timers.h"
#include "semphr.h"
#include "portmacro.h"

#define mainINTERRUPT_NUMBER 3

static void vPeriodicTask(void *pvParameters){
  const TickType_t xDelay500 = pdMS_TO_TICKS(500);

  for(;;){
    //block until it is time to generate the software interrupt again
    vTaskDelay(xDelay500);

    // print string b4 generation of the interrupt
    Serial.print("Periodic Task: about to generate interrupt \r\n");
    // generate interrupt
    vPortGenerateSimulatedInterrupt(mainINTERRUPT_NUMBER);
    // print string after generation of interrupt
    Serial.print("Periodic Task: interrupt generated\r\n\r\n\r\n");

  }

}

static void vTaskHandler(void *pvParameters){
  for(;;){
    //use semaphore to wait for an event
    xSemaphoreTake(xBinarySemaphore,portMAX_DELAY);
    //processing happens after an event has occured
    Serial.print("Handler Task: processing Event\r\n");
  }
}

static uint32_t InterruptHandler(void){
  BaseType_t xHighPrioriyTaskWoken;
  xHighPrioriyTaskWoken = pdFALSE;

  xSemaphoreGiveFromISR(xBinarySemaphore,xHighPrioriyTaskWoken);

  portYEILD_FROM_ISR(xHighPrioriyTaskWoken);

}


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  //create binary semaphore
  xBinarySemaphore = xSemaphoreCreateBinary();

  if(xBinarySemaphore != NULL){
    xTaskCreate(vTaskHandler,"Task_handler",1000,NULL,3,NULL);

    xTaskCreate(vPeriodicTask,"periodic_tgask",1000,NULL,1,NULL);

    vPortSetInterruptHandler(mainINTERRUPT_NUMBER,InterruptHandler);

  }

  for(;;){

  }

}

void loop() {
  // put your main code here, to run repeatedly:

}
