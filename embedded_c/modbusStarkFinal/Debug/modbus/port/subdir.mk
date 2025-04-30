################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbus/port/portevent.c \
../modbus/port/portserial.c \
../modbus/port/porttimer.c 

OBJS += \
./modbus/port/portevent.o \
./modbus/port/portserial.o \
./modbus/port/porttimer.o 

C_DEPS += \
./modbus/port/portevent.d \
./modbus/port/portserial.d \
./modbus/port/porttimer.d 


# Each subdirectory must supply rules for building sources it contributes
modbus/port/%.o modbus/port/%.su modbus/port/%.cyclo: ../modbus/port/%.c modbus/port/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/include" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/rtu" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/ascii" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/functions" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/port" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbus-2f-port

clean-modbus-2f-port:
	-$(RM) ./modbus/port/portevent.cyclo ./modbus/port/portevent.d ./modbus/port/portevent.o ./modbus/port/portevent.su ./modbus/port/portserial.cyclo ./modbus/port/portserial.d ./modbus/port/portserial.o ./modbus/port/portserial.su ./modbus/port/porttimer.cyclo ./modbus/port/porttimer.d ./modbus/port/porttimer.o ./modbus/port/porttimer.su

.PHONY: clean-modbus-2f-port

