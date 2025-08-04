function fish_prompt
        # display status of last command
	set -l last_status $status
	set -l stat
	if test $last_status -ne 0
		set stat (set_color red)"[$last_status]"(set_color normal) ' '
	end

        # display git branch
	set -l git_branch_status (git branch 2> /dev/null | sed -n '/\* /s///p')
	set -l git_branch
	if string length -q -- $git_branch_status
		set git_branch (set_color cyan)"($git_branch_status) "(set_color normal)
	end

        # show runtime if the command took more than 5 seconds to run
        set -l time_str
        if set -q CMD_DURATION
            if test $CMD_DURATION -gt 5000
                set -l total_seconds (math -s 0 "$CMD_DURATION / 1000")
                if test $total_seconds -ge 3600
                    set -l hours (math -s 0 "$total_seconds / 3600")
                    set -l minutes (math -s 0 "($total_seconds % 3600) / 60")
                    set -l seconds (math "$total_seconds % 60")
                    set time_str "($hours:"(printf '%02d' $minutes)":"(printf '%02d' $seconds)") "
                else if test $total_seconds -ge 60
                    set -l minutes (math -s 0 "$total_seconds / 60")
                    set -l seconds (math "$total_seconds % 60")
                    set time_str "($minutes:"(printf '%02d' $seconds)") "
                else
                    set time_str "($total_seconds) "
                end
            end
        end

        set -l status_entry "$stat"
        set -l time_entry "$(set_color 72ad00)$time_str"
        set -l state_entry "$(set_color f5a9b8)$(whoami)$(set_color white)@$(set_color 5bcefa)$(uname -n)"
        set -l path_entry "$(set_color green)$(prompt_pwd --full-length-dirs 2)"

	string join '' -- $git_branch $stat $time_entry $state_entry ' ' $path_entry (set_color normal) ' '
end
