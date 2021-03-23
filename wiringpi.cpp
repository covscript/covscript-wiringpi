/*
* Covariant Script wiringPi Support
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* Copyright (C) 2017-2021 Michael Lee(李登淳)
*
* Email:   lee@covariant.cn, mikecovlee@163.com
* Github:  https://github.com/mikecovlee
* Website: http://covscript.org.cn
*/
#include <covscript/cni.hpp>
#include <covscript/dll.hpp>
#include <wiringSerial.h>
#include <wiringPi.h>

CNI_ROOT_NAMESPACE
{
    CNI_VALUE_CONST(input,      INPUT)
    CNI_VALUE_CONST(output,     OUTPUT)
    CNI_VALUE_CONST(pwm_output, PWM_OUTPUT)
    CNI_VALUE_CONST(pud_off,    PUD_OFF)
    CNI_VALUE_CONST(pud_down,   PUD_DOWN)
    CNI_VALUE_CONST(pud_up,     PUD_UP)
    CNI_VALUE_CONST(high,       HIGH)
    CNI_VALUE_CONST(low,        LOW)
    // GPIO Functions
    CNI_V(setup,             wiringPiSetup)
    CNI_V(pin_mode,          pinMode)
    CNI_V(pud_cntl,          pullUpDnControl)
    CNI_V(digital_write,     digitalWrite)
    CNI_V(pwm_write,         pwmWrite)
    CNI_V(digital_read,      digitalRead)
    CNI_V(analog_read,       analogRead)
    CNI_V(analog_write,      analogWrite)
    // Timing Functions
    CNI_V(time,              micros)
    CNI_V(delay,             delayMicroseconds)
    // Serial Port Functions
    CNI_V(serial_open,       serialOpen)
    CNI_V(serial_close,      serialClose)
    CNI_V(serial_putchar,    serialPutchar)
    CNI_V(serial_print,      serialPuts)
    CNI_V(serial_data_avail, serialDataAvail)
    CNI_V(serial_getchar,    serialGetchar)
    CNI_V(serial_flush,      serialFlush)
}
