import wiringpi, network, regex
using  wiringpi
using  network

var packet_validate_head = regex.build("^([0-9]+)\\s+$")

function main()
	var ep=tcp.endpoint_v4(1024)
	var a=tcp.acceptor(ep)
	var sock=new tcp.socket
	runtime.wait_until(10000, []()->sock.accept(a), {})
	setup()
	var s = serial_open("/dev/ttyACM0", 115200)
	loop
		var header = new string
		loop; until serial_data_avail(s) > 0 && char.from_ascii(serial_getchar(s)) == 'S'
		var count = 0
		while count < 7
    		if serial_data_avail(s) > 0
				header += char.from_ascii(serial_getchar(s))
				++count
    		end
		end
		serial_putchar(s, 'A')
		header += " "
		var result_head = packet_validate_head.match(header)
		if !result_head.ready()
        	system.out.println("Discard Serial Data")
			continue
    	end
		sock.send(header)
		if sock.receive(8) != "RECVHEAD"
			system.out.println("Broken Packet: RECVHEAD")
			return
		end
		var json_pkg = new string
		var data_size = result_head.str(1).to_number()
		count = 0
		while count < data_size
    		if serial_data_avail(s) > 0
				json_pkg += char.from_ascii(serial_getchar(s))
				++count
    		end
		end
		sock.send(json_pkg)
		if sock.receive(8) != "RECVDATA"
			system.out.println("Broken Packet: RECVDATA")
			return
		end
	end
end

main()