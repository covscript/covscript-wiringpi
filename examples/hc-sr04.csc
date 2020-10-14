import wiringpi as gpio

gpio.setup()

var echo_pin = 7, trig_pin = 8

gpio.pin_mode(echo_pin, gpio.input)
gpio.pin_mode(trig_pin, gpio.output)

function distance()
	gpio.digital_write(trig_pin, gpio.high)
	gpio.delay(10)
	gpio.digital_write(trig_pin, gpio.low)
	
	var bt = gpio.time()
	while gpio.digital_read(echo_pin) == 0
		bt = gpio.time()
	end
	
	var et = gpio.time()
	while gpio.digital_read(echo_pin) == 1
		et = gpio.time()
	end
	
	return ((et - bt) * 0.0343) / 2
end

loop
	runtime.delay(100)
	system.console.clrscr()
	system.out.println("Distance: " + distance() + "cm")
end
