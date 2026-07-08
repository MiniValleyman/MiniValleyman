function mkcd ()
{
    last=$(eval "echo \$$#");
    if [ ! -n "$last" ]; then
        echo "Enter a directory name";
    else
        if [ -d $last ]; then
            echo "\`$last' already exists";
        else
            mkdir $@ && cd $last;
        fi;
    fi
}
