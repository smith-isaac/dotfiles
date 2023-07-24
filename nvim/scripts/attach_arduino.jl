using JSON

boards_json = JSON.parse(readchomp(`arduino-cli board listall --format json`))
board_list = boards_json["boards"]

println("Boards available")
for (i, board) in enumerate(board_list)
    println("$i:\t$(board["name"])")
end

print("Select board: ")
board_num = tryparse(Int, readline())

while isnothing(board_num) || board_num < 1 || board_num > length(board_list)
    print("Please select valid board number: ")
    global board_num = tryparse(Int, readline())
end

board = board_list[board_num]
board_fqbn = board["fqbn"]
println("Selected board: $(board["name"]) (fqbn: $board_fqbn)")

ports_json = JSON.parse(readchomp(`arduino-cli board list --format json`))

println("\nConnected boards")
for (i, port) in enumerate(ports_json)
    match_board = get(port, "matching_boards", nothing)
    println("$i:\t$(port["port"]["label"])" * (isnothing(match_board) ? "" : " ($(match_board[1]["name"]))"))
end

print("Select port: ")
port_num = tryparse(Int, readline())

while isnothing(port_num) || port_num < 1 || port_num > length(ports_json)
    print("Please select valid port: ")
    global port_num = tryparse(Int, readline())
end

port = ports_json[port_num]["port"]["label"]
println("Selected port: $(port)\n")

println("Attaching board \"$(board["name"])\" on port $port to sketch")
run(`arduino-cli board attach -b $(board_fqbn) -p $(port)`);
