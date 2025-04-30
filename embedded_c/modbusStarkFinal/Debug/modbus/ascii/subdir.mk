################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbus/ascii/mbascii.c 

OBJS += \
./modbus/ascii/mbascii.o 

C_DEPS += \
./modbus/ascii/mbascii.d 


# Each subdirectory must supply rules for building sources it contributes
modbus/ascii/%.o modbus/ascii/%.su modbus/ascii/%.cyclo: ../modbus/ascii/%.c modbus/ascii/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/include" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/rtu" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/ascii" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/functions" -I"C:/Users/Asus/Desktop/stm32_projects/modbusStarkFinal/modbus/port" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbus-2f-ascii

clean-modbus-2f-ascii:
	-$(RM) ./modbus/ascii/mbascii.cyclo ./modbus/ascii/mbascii.d ./modbus/ascii/mbascii.o ./modbus/ascii/mbascii.su

.PHONY: clean-modbus-2f-ascii

