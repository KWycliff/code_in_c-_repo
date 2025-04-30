################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbusLib/acii/mbascii.c 

OBJS += \
./modbusLib/acii/mbascii.o 

C_DEPS += \
./modbusLib/acii/mbascii.d 


# Each subdirectory must supply rules for building sources it contributes
modbusLib/acii/%.o modbusLib/acii/%.su modbusLib/acii/%.cyclo: ../modbusLib/acii/%.c modbusLib/acii/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../modbusLib/acii -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbusLib-2f-acii

clean-modbusLib-2f-acii:
	-$(RM) ./modbusLib/acii/mbascii.cyclo ./modbusLib/acii/mbascii.d ./modbusLib/acii/mbascii.o ./modbusLib/acii/mbascii.su

.PHONY: clean-modbusLib-2f-acii

