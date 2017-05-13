function peco_nvimbuf
  if test -e $NVIM_LISTEN_ADDRESS
    set -l flags --layout bottom-up
    if test -n $argv
      set flags --query "$argv" $flags
    end

    nvimbuf | peco $flags | read word
    if [ $word ]
      commandline -a $word
    end
  else
    echo "no nvim"
    commandline -f repaint
  end
end

