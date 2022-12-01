# This software is released under the Pylar AI creative ML license, see LICENSE.md.

player01=Player01 # Aquí va tu jugador
player02=Player02 # Aquí va el jugador 2 de la IA o amigo que quieras
player03=Player03 # Aquí va el jugador 3 de la IA o amigo que quieras
player04=Player04 # Aquí va el jugador 3 de la IA o amigo que quieras

guanyades=0
guanyadesplayer02=0
guanyadesplayer03=0
guanyadesplayer04=0

inicial=0
final=40

seed=$(($RANDOM % 1000000))

for i in {$inicial..$final}; do
    ./Game $player01 $player02 $player03 $player04 -s $seed <default.cnf >default.res 2>./matches/docs/docs$seed.pylar
    res=$(cat ./matches/docs/docs$seed.pylar | tail -n 2 | head -n 1)
    if [[ "$res" == *"$player01"* ]]; then
        guanyades=$(($guanyades + 1))
    elif [[ "$res" == *"$player02"* ]]; then
        guanyadesplayer02=$(($guanyadesplayer02 + 1))
    elif [[ "$res" == *"$player03"* ]]; then
        guanyadesplayer03=$(($guanyadesplayer03 + 1))
    elif [[ "$res" == *"$player04"* ]]; then
        guanyadesplayer04=$(($guanyadesplayer04 + 1))
    fi
done
echo "$seed" >>./matches/data/data$seed.pylar
echo "" >>./matches/data/data$seed.pylar
echo -e "Strategy\t$player01\t$player02\t$player03\t$player04" >>./matches/data/data$seed.pylar
echo -e "Wins\t$guanyades\t$guanyadesplayer02\t$guanyadesplayer03\t$guanyadesplayer04" >>./matches/data/data$seed.pylar
echo -e "Losses\t$(($final - $guanyades))\t$(($final - $guanyadesplayer02))\t$(($final - $guanyadesplayer03))\t$(($final - $guanyadesplayer04))" >>./matches/data/data$seed.pylar
echo -e "Win %\t$(($guanyades * 100 / $final))%\t$(($guanyadesplayer02 * 100 / $final))%\t$(($guanyadesplayer03 * 100 / $final))%\t$(($guanyadesplayer04 * 100 / $final))%" >>./matches/data/data$seed.pylar
echo -e "Loss %\t$((100 - $guanyades * 100 / $final))%\t$((100 - $guanyadesplayer02 * 100 / $final))%\t$((100 - $guanyadesplayer03 * 100 / $final))%\t$((100 - $guanyadesplayer04 * 100 / $final))%" >>./matches/data/data$seed.pylar
echo "" >>./matches/data/data$seed.pylar

echo -e "Seed\t$seed" >>./matches/archive/book.pylar
echo -e "Strategy\t$player01\t$player02\t$player03\t$player04" >>./matches/archive/book.pylar
echo -e "Wins\t$guanyades\t$guanyadesplayer02\t$guanyadesplayer03\t$guanyadesplayer04" >>./matches/archive/book.pylar
echo -e "Losses\t$(($final - $guanyades))\t$(($final - $guanyadesplayer02))\t$(($final - $guanyadesplayer03))\t$(($final - $guanyadesplayer04))" >>./matches/archive/book.pylar
echo -e "Win %\t$(($guanyades * 100 / $final))%\t$(($guanyadesplayer02 * 100 / $final))%\t$(($guanyadesplayer03 * 100 / $final))%\t$(($guanyadesplayer04 * 100 / $final))%" >>./matches/archive/book.pylar
echo -e "Loss %\t$((100 - $guanyades * 100 / $final))%\t$((100 - $guanyadesplayer02 * 100 / $final))%\t$((100 - $guanyadesplayer03 * 100 / $final))%\t$((100 - $guanyadesplayer04 * 100 / $final))%" >>./matches/archive/book.pylar

./Game $player01 $player02 $player03 $player04 -s $seed <default.cnf >./matches/library/match$seed.pylar
