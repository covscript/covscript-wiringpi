import wiringpi as pi
pi.setup()
pi.pin_mode(15, output)
pi.pin_mode(16, input)
loop
	if pi.digital_read(16) == 0
		pi.digital_write(15, pi.high)
	else
		pi.digital_write(15, pi.low)
	end
end
