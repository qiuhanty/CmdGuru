################## Beginning of CmdGuru ##################
#### https://github.com/qiuhanty/CmdGuru ####

##################
# Configuration
##################
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
MARK_COLOR=96 # Light cyan
DIR_COLOR=95 # Light magenta
CMD_COLOR=96 # Light cyan
SN_COLOR=94 # Light blue
COMMENT_COLOR=95 # Light magenta
DELIMITER_COLOR=91 # Light red
HINT_COLOR=92 # Light green
ECHO_COLOR=32 # Green
ERROR_COLOR=31 # Red
CDMARK="$HOME/.cd_bmarks"
CMDLIST="$HOME/.cmd"
TMPCMDLIST="$HOME/.cmd_tmp"

##################
# check whether pbcopy/xclip exists
##################
os_type='unknown' # default, unknown
pbcopy=`which pbcopy 2> /dev/null`
if [ "X${pbcopy}" != "X" ]; then
  os_type='MacOS'
  else
    xclip=`which xclip 2> /dev/null`
    if [ "X${xclip}" != "X" ]; then
      os_type='linux' # Linux Desktop with xclip installed.
    fi
fi

##################
# Mark/Goto a directory
##################
function m()
{
  if [ ! -r ${CDMARK} ]; then
    # Create the file if not exist
    touch ${CDMARK}
  fi
  local dir=""
  if [ $# -lt 1 ];then
    # Remove empty lines
    sed '/^$/d' ${CDMARK} > ${CDMARK}.$$;
    # Sort based on bookmarks
    sort -u ${CDMARK}.$$ > ${CDMARK} ;
    rm ${CDMARK}.$$;
    # Prompt all the directories
    if [ "$os_type" = "MacOS" ]; then
      # xxxTODO: support terminal color for Mac
      sed '' ${CDMARK};
      echo "_________________________________"
      echo -n "Which one to choose(E to edit):";
    else
      # Use terminal colors on Linux/Unix
      cat ${CDMARK} | sed "s/^/\\e[${MARK_COLOR}m/" \
        | sed "s/\t/\\\t\\e[${DIR_COLOR}m/" \
        | sed 's/$/\\n/' | sed 's/e\[/\\e\[/g' > ${CDMARK}.$$
      echo -ne " "`cat ${CDMARK}.$$`
      rm ${CDMARK}.$$
      echo -e "\e[${DELIMITER_COLOR}m_________________________________"
      echo -ne "\e[${HINT_COLOR}mWhich one to choose(E to edit):";
    fi
    read mark;
    if [ "X${mark}" = "X" ]; then
      return;
    fi
    if [ "${mark}" = "E" ]; then
      if [ "X${EDITOR}" = "X" ]; then
        vim ${CDMARK};
      else
        $EDITOR ${CDMARK};
      fi
      return;
    fi
    echo $dir;
    if [ "$os_type" = "MacOS" ]; then
      dir=`grep -E "^${mark}\t" ${CDMARK} | awk -F"\t" '{print $2}'`;
    else
      dir=`grep -P "^${mark}\t" ${CDMARK} | awk -F"\t" '{print $2}'`;
    fi
    if [ "X${dir}" = "X" ]; then
      return;
    fi
    if [ "$os_type" = "MacOS" ]; then
      echo $dir;
    else
      echo -e "\e[${ECHO_COLOR}m"$dir;
    fi
    # Jump to the dest directory
    builtin cd "$dir";
  else
    if [ "$os_type" = "MacOS" ]; then
      dir=`grep -E "^$*\t" ${CDMARK} | awk -F"\t" '{print $2}'`;
    else
      dir=`grep -P "^$*\t" ${CDMARK} | awk -F"\t" '{print $2}'`;
    fi
    if [ "X${dir}" != "X" ]; then
      if [ "$os_type" = "MacOS" ]; then
        echo $dir;
      else
        echo -e "\e[${ECHO_COLOR}m"$dir;
      fi
      builtin cd "$dir";
      return;
    fi
    # Add [mark, pwd] to directory list
    # Use tab as delimiter
    echo "$*	$PWD" >> ${CDMARK};
  fi
}

##################
# Search for command
##################
if [ "X${EDITOR}" = "X" ]; then
  alias cmd='vim $CMDLIST'
else
  alias cmd='$EDITOR $CMDLIST'
fi
function s() {
  cat $CMDLIST > ${TMPCMDLIST}.$$
  for args in $@ # match each keyword
  do
    mv ${TMPCMDLIST}.$$ ${TMPCMDLIST}.$$.$$
    grep -i $args ${TMPCMDLIST}.$$.$$ > ${TMPCMDLIST}.$$
    rm ${TMPCMDLIST}.$$.$$
  done
  # Prompt all the matches in reverse order
  if [ "$os_type" = "MacOS" ]; then
    # xxxTODO: support terminal color for Mac
    sed = ${TMPCMDLIST}.$$ | sed '/./N; s/\n/ /' | sed -n '1!G;h;$p'
  else
    sed 's/\\/\\\\/g' ${TMPCMDLIST}.$$ | sed "s/^/\\e[${CMD_COLOR}m/" | sed = | sed '/./N; s/\n/ /' \
      | sed "s/^/\\e[${SN_COLOR}m/" | sed "s/ \/\/ / \\e[${COMMENT_COLOR}m# /" \
      | sed 's/$/\\n/' | sed 's/e\[/\\e\[/g' | sed -n '1!G;h;$p' > ${TMPCMDLIST}.$$.$$
    echo -ne " "`cat ${TMPCMDLIST}.$$.$$`
    rm ${TMPCMDLIST}.$$.$$
  fi
  # Number of matches
  local total=`sed -n '$=' ${TMPCMDLIST}.$$ `
  if [ "X${total}" = "X" ]; then
    rm ${TMPCMDLIST}.$$ >& /dev/null
    if [ "$os_type" = "MacOS" ]; then
      echo "Sorry, no match!"
    else
      echo -e "\e[${ERROR_COLOR}mSorry, no match!"
    fi
    return;
  fi
  if [ $total -eq 1 ]; then
    line=1;
  else
    if [ "$os_type" = "MacOS" ]; then
      echo "_________________________________"
      echo -n "Which one to choose[1 -- $total]:"
    else
      echo -e "\e[${DELIMITER_COLOR}m_________________________________"
      echo -ne "\e[${HINT_COLOR}mWhich one to choose[1 -- $total]:"
    fi
    read line
    # Only digits allowed
    input_check=`echo $line|sed -e s/\[^0-9\]/0/g`
    if [ "X${line}" = "X"  -o $line != $input_check ]; then
      line=1;
    fi
    if [ $line -gt $total  -o $line -eq 0 ]; then
      line=1;
    fi
  fi
  # echo the chosen command
  sed -n "$line"p ${TMPCMDLIST}.$$ | sed -e 's/ \/\/ .*//' | sed 's/[ \t]*$//'
  # Send the command to system clipboard or history, without comments and EOL,
  # so that you have a chance to modify it before executing
  if [ "$os_type" = "MacOS" ]; then
    sed -n "$line"p ${TMPCMDLIST}.$$ | sed -e 's/ \/\/ .*//' | tr -d "\n" \
      | sed 's/[ \t]*$//' | tr -d "\n" | pbcopy
  else
    if [ "$os_type" = "linux" ]; then
      sed -n "$line"p ${TMPCMDLIST}.$$ | sed -e 's/ \/\/ .*//' | tr -d "\n" \
        | sed 's/[ \t]*$//' | tr -d "\n" | xclip | echo `xclip -o` | xclip -selection clipboard
    else
      sed -n "$line"p ${TMPCMDLIST}.$$ | sed -e 's/ \/\/ .*//' \
        | sed 's/[ \t]*$//' > ${TMPCMDLIST}.$$.$$
      # Append the command to history, so it could be recalled by "!!" later
      builtin history -r ${TMPCMDLIST}.$$.$$
      rm ${TMPCMDLIST}.$$.$$ >& /dev/null
    fi
  fi
  rm ${TMPCMDLIST}.$$ >& /dev/null
}

##################
# Dump the previous command to $CMDLIST
##################
function d()
{
  if [ $# -lt 1 ];then
    # Dump the last command in history to command list
    cmd=`history 2 | sed -n 1p | sed 's/^[ \t]*[0-9]*  //'`
    echo $cmd >> $CMDLIST
  else
    # Dump the given command to command list
    echo $* >> $CMDLIST
  fi
  # echo the command just added
  tail -1 $CMDLIST
}

################## End of CmdGuru ##################
