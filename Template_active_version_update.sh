#!/bin/bash
echo "#### script execution initialized ####"
FILENAME=$1
echo $FILENAME

function update_version(){
{
	read
	while IFS=, read -r Mode Template Version
	do
		#echo "Mode $Mode , Template $Template , Version $Version"
		echo "aws pinpoint update-template-active-version --template-active-version-request Version=$Version
		--template-name $Template --template-type $Mode"
				if [ $? -eq 0 ]; then
						echo "Sucesssful: Active version for $Mode Template: '$Template' updated to: $Version"
				else
						echo "Error: Problem encountered while updating version for $Mode Template: $Template"
				fi
	done
} <  $1
}

while read -r LINE; do
   if [ "$LINE:0:1}" = "#" ]; then
	echo "Skipping Line: $LINE"
	continue
   fi
   LINE_WITH_NO_WHITESPACES="$(echo -e "${LINE}" | tr -d '[:space:]')"
   echo "Input Filename: $LINE_WITH_NO_WHITESPACES"
   
   update_version $LINE_WITH_NO_WHITESPACES
   
   if [ $? -eq 0 ]; then
		 echo "Done: Finished updating Template version."
   else
		 echo "Error: Problem calling update_template function for line '$LINE_WITH_NO_WHITESPACES'"
   fi
   
done < $FILENAME