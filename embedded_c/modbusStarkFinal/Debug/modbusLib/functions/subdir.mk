################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../modbusLib/functions/mbfunccoils.c \
../modbusLib/functions/mbfuncdiag.c \
../modbusLib/functions/mbfuncdisc.c \
../modbusLib/functions/mbfuncholding.c \
../modbusLib/functions/mbfuncinput.c \
../modbusLib/functions/mbfuncother.c \
../modbusLib/functions/mbutils.c 

OBJS += \
./modbusLib/functions/mbfunccoils.o \
./modbusLib/functions/mbfuncdiag.o \
./modbusLib/functions/mbfuncdisc.o \
./modbusLib/functions/mbfuncholding.o \
./modbusLib/functions/mbfuncinput.o \
./modbusLib/functions/mbfuncother.o \
./modbusLib/functions/mbutils.o 

C_DEPS += \
./modbusLib/functions/mbfunccoils.d \
./modbusLib/functions/mbfuncdiag.d \
./modbusLib/functions/mbfuncdisc.d \
./modbusLib/functions/mbfuncholding.d \
./modbusLib/functions/mbfuncinput.d \
./modbusLib/functions/mbfuncother.d \
./modbusLib/functions/mbutils.d 


# Each subdirectory must supply rules for building sources it contributes
modbusLib/functions/%.o modbusLib/functions/%.su modbusLib/functions/%.cyclo: ../modbusLib/functions/%.c modbusLib/functions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../modbusLib/functions -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-modbusLib-2f-functions

clean-modbusLib-2f-functions:
	-$(RM) ./modbusLib/functions/mbfunccoils.cyclo ./modbusLib/functions/mbfunccoils.d ./modbusLib/functions/mbfunccoils.o ./modbusLib/functions/mbfunccoils.su ./modbusLib/functions/mbfuncdiag.cyclo ./modbusLib/functions/mbfuncdiag.d ./modbusLib/functions/mbfuncdiag.o ./modbusLib/functions/mbfuncdiag.su ./modbusLib/functions/mbfuncdisc.cyclo ./modbusLib/functions/mbfuncdisc.d ./modbusLib/functions/mbfuncdisc.o ./modbusLib/functions/mbfuncdisc.su ./modbusLib/functions/mbfuncholding.cyclo ./modbusLib/functions/mbfuncholding.d ./modbusLib/functions/mbfuncholding.o ./modbusLib/functions/mbfuncholding.su ./modbusLib/functions/mbfuncinput.cyclo ./modbusLib/functions/mbfuncinput.d ./modbusLib/functions/mbfuncinput.o ./modbusLib/functions/mbfuncinput.su ./modbusLib/functions/mbfuncother.cyclo ./modbusLib/functions/mbfuncother.d ./modbusLib/functions/mbfuncother.o ./modbusLib/functions/mbfuncother.su ./modbusLib/functions/mbutils.cyclo ./modbusLib/functions/mbutils.d ./modbusLib/functions/mbutils.o ./modbusLib/functions/mbutils.su

.PHONY: clean-modbusLib-2f-functions

