projects_path=~/proyectos

function before(){ 
    tmux new -d -s $project_name -n editor
    tmux send-keys -t "$project_name:0.0" 'nvim' Enter
    tmux new-window -t $project_name -n terminal
    tmux splitw -h
    tmux select-window -t $session:0
}

#function onRust(){
#        
#}
#
#function onDockerfile(){
#        
#}
#
#function onNode(){
#    
#}
#
#function onPhp(){
#
#}
#
function after(){
    tmux a -t $project_name
}
