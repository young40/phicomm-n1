dirw()
{
	if [ -d "$1/.git" ]
	then
		echo $1
		local url=$1
		git --work-tree="${url}" --git-dir="${url}/.git" remote -v

		echo ""
	fi


	for file in $1/*
	do
		if [ -d "$file" ]
		then
			dirw "$file"
		fi
	done
}

dirw `pwd`
