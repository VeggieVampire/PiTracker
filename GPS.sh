
#need to create wrapper for KML file.


while true; do
       read -n 200 LINE < /dev/ttyUSB0
		echo $LINE |grep GPRMC| tr '[,]' '[\t]' |awk '{print $4}' > GPS.log
			
			latitude=$(cat GPS.log)
			if [ -z "$latitude" ]; then
				echo ""
			else
				echo $LINE |grep GPRMC| tr '[,]' '[\t]' |awk '{print $6}' > GPS.log
				longitude=$(cat GPS.log)
				degrees2=${longitude:0:3}
				echo "print (${longitude:3:10}/60)" | python >test.log
				minutes2=$(cat test.log)
				echo $LINE |grep GPRMC| tr '[,]' '[\t]' |awk '{print $7}' > test.log
				GPSLon=$(cat test.log) 
				if [ "$GPSLon" == "E" ]; then
					#echo "You are East of hemisphere "
					echo -n $degrees2"."${minutes2:2:5}",">>Google.KML
					
				else
					#echo "You are West of hemisphere "
					echo -n "-"$degrees2"."${minutes2:2:5}",">>Google.KML
				fi
				echo $LINE |grep GPRMC| tr '[,]' '[\t]' |awk '{print $4}' > GPS.log
				latitude=$(cat GPS.log)
				degrees=${latitude:0:2}
			
				echo "print (${latitude:2:10}/60)" | python >test.log
				minutes=$(cat test.log)
				
				echo $LINE |grep GPRMC| tr '[,]' '[\t]' |awk '{print $5}' > test.log
				GPSLat=$(cat test.log)
					if [ "$GPSLat" == "N" ]; then
						#echo "You are North of hemisphere "
						echo -n $degrees"."${minutes:2:5}" ">>Google.KML
					else
						#echo "You are South of hemisphere "
						echo -n "-"$degrees"."${minutes:2:5}" ">>Google.KML
					fi
				
				
			fi
done


#need to create closer for KML file.