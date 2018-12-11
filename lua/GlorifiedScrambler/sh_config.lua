
GlorifiedScrambler.config.SCRAMBLE_LIST = {
    -- Thing to type, seconds to finish, lowest cash prize, lowest scramble points.
    -- { "Yeet", 3, 500, 2 }
    -- WARNING: The highest possible amount of cash one can get is lowest cash * time, for example:
    -- If you finish a 10 second scramble in 1 second with lowest cash set to 1000, you will get ( 10 - 1 ) * 1000, so $9000
    -- This only happens on scrambles with positive values and with timers above 2.
    { "troll", 5, -100, -2 },
    { "lol", 1, 100, 1 },
    { "photosynthesis", 3, 300, 3 },
    { "supercalifragilisticexpialidocious", 10, 1000, 10 },
    { "cousin", 2, 200, 2 },
    { "behead", 2, 200, 2 },
    { "inhibition", 3, 300, 3 },
    { "moon", 2, 150, 2 },
    { "rehearsal", 3, 250, 3 }
}

GlorifiedScrambler.config.SCRAMBLE_MIN_TIME = 15 -- The minimum amount of time after a scramble completes for the next one.
GlorifiedScrambler.config.SCRAMBLE_MAX_TIME = 30 -- The maximum amount of time after a scramble completes for the next one.