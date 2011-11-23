-- Run `ghci`, load this file, and call `triplet`.

triplet = [ (a, b, c) |    -- when this was 'a*b*c' it was giving strange
            a <- [1..400], -- result, so i changed it into this, and
            b <- [1..500], -- manualy 'producted' them.
            c <- [1..600],
            a + b + c == 1000,
            a**2 + b**2 == c**2,
            b < c, a < b ]
