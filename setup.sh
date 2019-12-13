#!/bin/bash
#Comments



ARGUMENTS=$#
#echo "You Provided $ARGUMENTS program arguments"
if [ "$ARGUMENTS" -ne 2 ]; then
    echo "Invalid # of Arguments"
    exit 1
    fi

NAME=$1
TYPE=${2,,}


#echo "Argument 1: $NAME"
#echo "Argument 2: $TYPE"

#echo ${TYPE,, lower}
#echo $TYPE | tr '[:lower:]'
#TYPE="${TYPE,,}"

FOLDER=project_$NAME
#echo "$FOLDER"

DIRECTORY=$(pwd)
#echo "Location: $DIRECTORY"

if [ $TYPE != ".py" ] && [ $TYPE != "python" ] && [ $TYPE != ".c" ] && [ $TYPE != "c" ] && [ $TYPE != ".js" ] && [ $TYPE != "javascript" ]; then
    echo "Not Valid Program Type"
    exit 1
    fi
if [ -d $FOLDER ]; then
    echo "Directory Exist"
    exit 1
    fi
mkdir -p $FOLDER
cd $FOLDER

if [ $TYPE == ".py" ] || [ $TYPE == "python" ]; then
    touch $NAME.py
    touch README
    echo "$NAME.py
    Krishna Pandian
    Functionality:
    
    " >> README

    echo "#$NAME.py
    #Krishna Pandian
    #Description:

    main():
        return 0
    
    if __name__ == '__main__' 
        main()" >> $NAME.py

elif [ $TYPE == ".c" ] || [ $TYPE == "c" ]; then
    touch $NAME.c
    touch $NAME.h
    touch Test.c
    touch Makefile
    touch README

    echo "$NAME.c
    Krishna Pandian
    Functionality:
    
    " >> README

    echo "//Test.c
    //Krishna Pandian
    //Description:

    #include \"string.h\"
    #include \"stdlib.h\"
    #include \"$NAME.h\"

    int main(){
        return EXIT_SUCCESS;
    }
    
    " >> Test.c

    echo "//$NAME.c
    //Krishna Pandian
    //Description:

    #include \"string.h\"
    #include \"stdlib.h\"
    #include \"$NAME.h\"

    //Struct Definitions:

    //Function Definitions:
    
    " >> $NAME.c

    echo "//$NAME.h
    //Krishna Pandian
    //Description:

    //Struct Declarations:

    //Function Declarations:
    " >> $NAME.h

    echo "
#------------------------------------------------------------------------------
# Makefile for any client of any ADT in C
# Krishna Pandian
#------------------------------------------------------------------------------

CLIENT         = 
ADT            = $NAME
SOURCE         = \$(CLIENT).c
OBJECT         = \$(CLIENT).o
ADT_SOURCE     = \$(ADT).c
ADT_OBJECT     = \$(ADT).o
ADT_HEADER     = \$(ADT).h
COMPILE        = gcc -c -std=c99 -Wall
LINK           = gcc -o
REMOVE         = rm -f
MEMCHECK       = valgrind --leak-check=full

\$(CLIENT) : \$(OBJECT) \$(ADT_OBJECT) 
	\$(LINK) \$(CLIENT) \$(OBJECT) \$(ADT_OBJECT) 

\$(OBJECT) : \$(SOURCE) \$(ADT_HEADER) 
	\$(COMPILE) \$(SOURCE)

\$(ADT_OBJECT) : \$(ADT_SOURCE) \$(ADT_HEADER)
	\$(COMPILE) \$(ADT_SOURCE)

clean :
	\$(REMOVE) \$(CLIENT) \$(OBJECT) \$(ADT_OBJECT) 

memcheck : \$(CLIENT)
	\$(MEMCHECK) \$(CLIENT)
    
    " >> Makefile

elif [ $TYPE == ".js" ] || [ $TYPE == "javascript" ]; then
    touch $NAME.js
    touch README
    echo "$NAME.js
    Krishna Pandian
    Functionality:
    
    " >> README

    echo "//$NAME.js
    //Krishna Pandian
    //Description:

    main():
        return 0
    
    ">> $NAME.js

fi
