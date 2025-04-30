################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbusLib/tcp/mbtcp.c 

OBJS += \
./modbusLib/tcp/mbtcp.o 

C_DEPS += \
./modbusLib/tcp/mbtcp.d 


# Each subdirectory must supply rules for building sources it contributes
modbusLib/tcp/%.o modbusLib/tcp/%.su modbusLib/tcp/%.cyclo: ../modbusLib/tcp/%.c modbusLib/tcp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../modbusLib/tcp -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbusLib-2f-tcp

clean-modbusLib-2f-tcp:
	-$(RM) ./modbusLib/tcp/mbtcp.cyclo ./modbusLib/tcp/mbtcp.d ./modbusLib/tcp/mbtcp.o ./modbusLib/tcp/mbtcp.su

.PHONY: clean-modbusLib-2f-tcp

