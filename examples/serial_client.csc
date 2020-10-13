import network, regex, imgui, imgui_font
import codec.json as json
using  network
using  imgui

var data_1 = new array
var data_2 = new array
var data_3 = new array

var packet_validate_head = regex.build("^([0-9]+)\\s+$")

function receive_data(sock)
    var head = sock.receive(8)
    var result_head = packet_validate_head.match(head)
    if !result_head.ready()
        return null
    end
    sock.send("RECVHEAD")
    var size = result_head.str(1).to_number()
    var data = sock.receive(size)
    sock.send("RECVDATA")
    return json.to_var(json.from_string(data))
end

var sock = new tcp.socket
runtime.wait_for(2000, []()->sock.connect(tcp.endpoint("192.168.233.41", 1024)), {})

# Init ImGUI
var app = window_application(1280, 720, "Sensor Monitor")
var font = add_font_extend_cn(imgui_font.source_han_sans, 24)
var window_opened = true
style_color_dark()

while !app.is_closed()
    app.prepare()
    push_font(font)
    begin_window("Main", window_opened, {flags.no_collapse, flags.no_title_bar, flags.no_move, flags.no_resize})
        set_window_pos(vec2(-50, 0))
        set_window_size(vec2(app.get_window_width() + 100, app.get_window_height()))
        var dat = receive_data(sock)
        data_1.push_back(dat.Lux)
        if data_1.size > 100
            data_1.pop_front()
        end
        data_2.push_back(dat.Tem)
        if data_2.size > 100
            data_2.pop_front()
        end
        data_3.push_back(dat.Hum)
        if data_3.size > 100
            data_3.pop_front()
        end
        plot_lines("\n\n\n\n\n\n\n\n光照读数, 当前为" + dat.Lux + "lux", "", {0,  1023, data_1...})
        plot_lines("\n\n\n\n\n\n\n\n温度读数, 当前为" + dat.Tem + "°C",  "", {0,  50,   data_2...})
        plot_lines("\n\n\n\n\n\n\n\n湿度读数, 当前为" + dat.Hum + "%",   "", {30, 100,  data_3...})
    end_window()
    pop_font()
    app.render()
end