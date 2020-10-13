import wiringpi as pi
pi.setup()
pi.pin_mode(15, output)
loop
    runtime.delay(1000)
	pi.digital_write(15, pi.high)
    runtime.delay(1000)
	pi.digital_write(15, pi.low)
end
