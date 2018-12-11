
GlorifiedScrambler.config.SCRAMBLE_LIST = {
    -- Thing to type, seconds to finish, lowest cash prize, lowest scramble points.
    -- { "Yeet", 3, 500, 2 }
    -- WARNING: The highest possible amount of cash one can get is lowest cash * time, for example:
    -- If you finish a 10 second scramble in 1 second with lowest cash set to 1000, you will get ( 10 - 1 ) * 1000, so $9000
    -- This only happens on scrambles with positive values and with timers above 2.
    { "troll", 7, -100, -2 },
    { "lol", 2, 100, 2 },
    { "photosynthesis", 5, 300, 3 },
    { "supercalifragilisticexpialidocious", 10, 1000, 10 },
    { "cousin", 3, 200, 2 },
    { "behead", 3, 200, 2 },
    { "inhibition", 4, 300, 3 },
    { "moon", 4, 150, 2 },
    { "rehearsal", 5, 250, 3 }
}

GlorifiedScrambler.config.SCRAMBLE_TIME = 60 -- The amount of time between scrambles.