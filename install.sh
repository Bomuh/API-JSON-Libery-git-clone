if [ ! -s include/asterisk.h ] ; then
        echo "please cd into the directory where the asterisk source has been untarred"
        exit
fi
cp asterisk-res_json/res_json.c addons/.
cp asterisk-res_json/cJSON.h include/asterisk/.
cp asterisk-res_json/cJSON.c addons/.
echo "editing addons/Makefile: add res_json to the list of modules built, and"
echo "    res_json.so: cJSON.o res_json.o"
echo "res_json.so: cJSON.o res_json.o" >> addons/Makefile
sed -i '36i\            res_json \\' addons/Makefile
echo "editing main/asterisk.exports.in:"
sed -i '44i\                LINKER_SYMBOL_PREFIXcJSON_*; \' main/asterisk.exports.in
