################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/modbus_crc/mbcrc.c 

OBJS += \
./libraries/modbus_crc/mbcrc.o 

C_DEPS += \
./libraries/modbus_crc/mbcrc.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/modbus_crc/%.o libraries/modbus_crc/%.su libraries/modbus_crc/%.cyclo: ../libraries/modbus_crc/%.c libraries/modbus_crc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../libraries/modbus_crc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-libraries-2f-modbus_crc

clean-libraries-2f-modbus_crc:
	-$(RM) ./libraries/modbus_crc/mbcrc.cyclo ./libraries/modbus_crc/mbcrc.d ./libraries/modbus_crc/mbcrc.o ./libraries/modbus_crc/mbcrc.su

.PHONY: clean-libraries-2f-modbus_crc

