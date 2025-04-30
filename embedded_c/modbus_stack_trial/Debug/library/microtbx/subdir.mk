################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../library/microtbx/tbx_aes256.c \
../library/microtbx/tbx_assert.c \
../library/microtbx/tbx_checksum.c \
../library/microtbx/tbx_critsect.c \
../library/microtbx/tbx_crypto.c \
../library/microtbx/tbx_heap.c \
../library/microtbx/tbx_list.c \
../library/microtbx/tbx_mempool.c \
../library/microtbx/tbx_platform.c \
../library/microtbx/tbx_random.c 

OBJS += \
./library/microtbx/tbx_aes256.o \
./library/microtbx/tbx_assert.o \
./library/microtbx/tbx_checksum.o \
./library/microtbx/tbx_critsect.o \
./library/microtbx/tbx_crypto.o \
./library/microtbx/tbx_heap.o \
./library/microtbx/tbx_list.o \
./library/microtbx/tbx_mempool.o \
./library/microtbx/tbx_platform.o \
./library/microtbx/tbx_random.o 

C_DEPS += \
./library/microtbx/tbx_aes256.d \
./library/microtbx/tbx_assert.d \
./library/microtbx/tbx_checksum.d \
./library/microtbx/tbx_critsect.d \
./library/microtbx/tbx_crypto.d \
./library/microtbx/tbx_heap.d \
./library/microtbx/tbx_list.d \
./library/microtbx/tbx_mempool.d \
./library/microtbx/tbx_platform.d \
./library/microtbx/tbx_random.d 


# Each subdirectory must supply rules for building sources it contributes
library/microtbx/%.o library/microtbx/%.su library/microtbx/%.cyclo: ../library/microtbx/%.c library/microtbx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G070xx -c -I../Core/Inc -I../library/microtbx -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-library-2f-microtbx

clean-library-2f-microtbx:
	-$(RM) ./library/microtbx/tbx_aes256.cyclo ./library/microtbx/tbx_aes256.d ./library/microtbx/tbx_aes256.o ./library/microtbx/tbx_aes256.su ./library/microtbx/tbx_assert.cyclo ./library/microtbx/tbx_assert.d ./library/microtbx/tbx_assert.o ./library/microtbx/tbx_assert.su ./library/microtbx/tbx_checksum.cyclo ./library/microtbx/tbx_checksum.d ./library/microtbx/tbx_checksum.o ./library/microtbx/tbx_checksum.su ./library/microtbx/tbx_critsect.cyclo ./library/microtbx/tbx_critsect.d ./library/microtbx/tbx_critsect.o ./library/microtbx/tbx_critsect.su ./library/microtbx/tbx_crypto.cyclo ./library/microtbx/tbx_crypto.d ./library/microtbx/tbx_crypto.o ./library/microtbx/tbx_crypto.su ./library/microtbx/tbx_heap.cyclo ./library/microtbx/tbx_heap.d ./library/microtbx/tbx_heap.o ./library/microtbx/tbx_heap.su ./library/microtbx/tbx_list.cyclo ./library/microtbx/tbx_list.d ./library/microtbx/tbx_list.o ./library/microtbx/tbx_list.su ./library/microtbx/tbx_mempool.cyclo ./library/microtbx/tbx_mempool.d ./library/microtbx/tbx_mempool.o ./library/microtbx/tbx_mempool.su ./library/microtbx/tbx_platform.cyclo ./library/microtbx/tbx_platform.d ./library/microtbx/tbx_platform.o ./library/microtbx/tbx_platform.su ./library/microtbx/tbx_random.cyclo ./library/microtbx/tbx_random.d ./library/microtbx/tbx_random.o ./library/microtbx/tbx_random.su

.PHONY: clean-library-2f-microtbx

