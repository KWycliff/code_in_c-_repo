################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbusLib/rtu/mbcrc.c \
../modbusLib/rtu/mbrtu.c 

OBJS += \
./modbusLib/rtu/mbcrc.o \
./modbusLib/rtu/mbrtu.o 

C_DEPS += \
./modbusLib/rtu/mbcrc.d \
./modbusLib/rtu/mbrtu.d 


# Each subdirectory must supply rules for building sources it contributes
modbusLib/rtu/%.o modbusLib/rtu/%.su modbusLib/rtu/%.cyclo: ../modbusLib/rtu/%.c modbusLib/rtu/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../modbusLib/rtu -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbusLib-2f-rtu

clean-modbusLib-2f-rtu:
	-$(RM) ./modbusLib/rtu/mbcrc.cyclo ./modbusLib/rtu/mbcrc.d ./modbusLib/rtu/mbcrc.o ./modbusLib/rtu/mbcrc.su ./modbusLib/rtu/mbrtu.cyclo ./modbusLib/rtu/mbrtu.d ./modbusLib/rtu/mbrtu.o ./modbusLib/rtu/mbrtu.su

.PHONY: clean-modbusLib-2f-rtu

