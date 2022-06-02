# !/bin/bash
# user-agent
useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
# start exploit
echo """                                                                
  ####  ###### #####  ####  ###### #####  #    # ###### #####  
 #    # #        #   #      #      #    # #    # #      #    # 
 #      #####    #    ####  #####  #    # #    # #####  #    # 
 #  ### #        #        # #      #####  #    # #      #####  
 #    # #        #   #    # #      #   #   #  #  #      #   #  
  ####  ######   #    ####  ###### #    #   ##   ###### #    # 
    i make this just for fun and educational purposes.
    not responsible for the illegal activities. thx 


"""
function scan_start(){
        getdomain=$(echo ${site_lst}| cut -d "/" -f1 | sort -u)
        getserver=$(curl -s ${site_lst} | awk '/far fa-hdd/{getline; print}' | sed 's/^[ \t]*//;s/[ \t]*$//')
                if [[ $getserver =~ "Windows" || $getserver =~ "Linux" || $getserver =~ "windows" || $getserver =~ "linux" ]]; then
                        echo "[ Domain ] - ${getdomain} - [ Name server ] - ${getserver}"
                else
                        echo "[ Domain ] - ${getdomain} -  [ CANT GET NAME SERVER ]"
                fi
}
# multi thread
for site_lst in $(cat $1); do
        scan_start "$site_lst" &
        while (( $(jobs | wc -l) >= 20 )); do
                sleep 0.1s
                jobs > /dev/null
        done
done
wait