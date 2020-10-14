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
    CNI(millis)
    CNI(delay)
    // Serial Port Functions
    CNI_V(serial_open,       serialOpen)
    CNI_V(serial_close,      serialClose)
    CNI_V(serial_putchar,    serialPutchar)
    CNI_V(serial_print,      serialPuts)
    CNI_V(serial_data_avail, serialDataAvail)
    CNI_V(serial_getchar,    serialGetchar)
    CNI_V(serial_flush,      serialFlush)
}
