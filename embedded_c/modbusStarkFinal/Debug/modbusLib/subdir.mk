################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbusLib/mb.c 

OBJS += \
./modbusLib/mb.o 

C_DEPS += \
./modbusLib/mb.d 


# Each subdirectory must supply rules for building sources it contributes
modbusLib/%.o modbusLib/%.su modbusLib/%.cyclo: ../modbusLib/%.c modbusLib/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbusLib

clean-modbusLib:
	-$(RM) ./modbusLib/mb.cyclo ./modbusLib/mb.d ./modbusLib/mb.o ./modbusLib/mb.su

.PHONY: clean-modbusLib

