-- Not my code: originally from https://redd.it/3t6s7k (author deleted; failed to ask for permission).
-- Tested on Linux and Windows. Date is set to dd/mmm/yy and time to machine-wide format.
-- Save as "mpvhistory.lua" in your mpv scripts dir. Log will be saved to mpv default config directory.

local HISTFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.config')..'/mpv/mpvhistory.log';

mp.register_event('file-loaded', function()
    local title, logfile;

    title = mp.get_property('media-title');  
    title = (title == mp.get_property('filename') and '' or ('(%s)'):format(title));

    logfile = io.open(HISTFILE, 'a+');
    logfile:write(('[%s] %s %s\n'):format(os.date('%d/%b/%y %X'), mp.get_property('path'), title));    
    logfile:close();
end)
