gitpath (){
  path=$1
  path=`echo ${path} | sed -e "s/\(\w\):/\/\1/"`
  path=${path//\\//}
  echo ${path}
}

# extract relative path
file=`gitpath $1`

rootDir=`git rev-parse --show-toplevel`
rootDir=`gitpath ${rootDir}`

relativePath=${file#${rootDir}}

# extract branch name
branch=`git branch --contains | cut -d " " -f 2`

# build URL
remoteBase=`git config --get remote.origin.url`
# git@github.com:kimurayuuji/gitlinksendto.git => https://github.com/kimurayuuji/gitlinksendto
remoteBase=${remoteBase/://}
remoteBase=${remoteBase/git@/http:\/\//}
remoteBase=${remoteBase/.git//}

start ${remoteBase}tree/${branch}${relativePath}
