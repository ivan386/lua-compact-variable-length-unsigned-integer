local cvaruint = {}

function cvaruint.encode (uint)
    local data = ""
    while (uint >> 7) > 0 do
        data = data .. string.char((uint & 127) | 128)
        uint = uint >> 7
        uint = uint - 1
    end
    return data .. string.char(uint)
end

function cvaruint.decode(data)
    local uint = 0
    local i = 0
    repeat
        local byte = data:byte(i + 1)
        uint = uint + (byte << (i * 7))
        i = i + 1
    until byte & 128 == 0
    return uint, i
end

return cvaruint