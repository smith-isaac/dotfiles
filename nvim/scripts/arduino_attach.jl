using JSON3

function fzf(items::String)::String
    return read(pipeline(`fzf`; stdin = IOBuffer(items)), String) |> chomp
end

function get_json_data(cmd::Cmd)
    return JSON3.read(cmd)
end

function select_board()::String
    all_boards = get_json_data(`arduino-cli board listall --format json`)

    board_dict = Dict([board.name => board.fqbn for board in all_boards.boards])

    selected_board_name = fzf(join(keys(board_dict), '\n'))
    return board_dict[selected_board_name]
end

function select_port()::Tuple{String, Union{String, Nothing}}
    # Reading file for now so that I can test without boards connected
    #  connected_boards = JSON3.read("./board_list_example.json")
    connected_boards = get_json_data(`arduino-cli board list --format json`)

    port_dict = Dict([board.port.address => get(board, :matching_boards, []) for board in connected_boards])

    port_list_fzf = join(["$port" *
    (isempty(board_list) ? "" : " ($(join(getindex.(board_list, :name), ", ")))")
    for (port, board_list) in port_dict], '\n')

    selected_port = first(split(fzf(port_list_fzf), ' '))

    return (selected_port,
    (isempty(port_dict[selected_port]) ? nothing : first(port_dict[selected_port]).fqbn))

end

function attach_board()
    port, fqbn = select_port()

    if isnothing(fqbn)
        fqbn = select_board()
    end

    println("Port: $port\tFqbn: $fqbn")
    if length(ARGS) >= 1 && isfile(first(ARGS))
        run(`arduino-cli board attach -p $port -b $fqbn $(first(ARGS))`);
    else
        run(`arduino-cli board attach -p $port -b $fqbn`);
    end
end

attach_board()
