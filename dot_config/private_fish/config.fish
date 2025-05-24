if status is-interactive
    # commands to run in interactive sessions can go here

    set -U fish_features shared_history
    function __merge_history --on-event fish_prompt
        history --merge
    end
end

# Go environment configuration
fish_add_path /usr/local/go/bin
