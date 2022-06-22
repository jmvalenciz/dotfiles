projects_path=~/projects

function before(){ 
    #tmux new -d -s $project_name -n editor
    #tmux send-keys -t "$project_name:0.0" 'nvim' Enter
    #tmux new-window -t $project_name -n terminal
    #tmux splitw -h
    #tmux select-window -t $session:0

    codium .
    alacritty --working-directory=.&
}

function onRust(){
    echo "Rust"
}

#function onDockerfile(){
#        
#}
#
function onNode(){
     echo "Node"
}
#
#function onPhp(){
#
#}
#
function after(){
    #tmux a -t $project_name
    echo after
    kill $PPID
}
