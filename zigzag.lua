local zigzag = {}

function zigzag.encode(int)
    if int < 0 then
        return ~(int << 1)
    else
        return int << 1
    end
end

function zigzag.decode(uint)
    if uint & 1 == 1 then
        return ~(uint >> 1)
    else
        return uint >> 1
    end
end

return zigzag