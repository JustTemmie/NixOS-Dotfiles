function fish_prompt
	set -l last_status $status
	set -l stat
	if test $last_status -ne 0
		set stat (set_color red)"[$last_status]"(set_color normal) ' '
	end

	set -l git_branch_status (git branch 2> /dev/null | sed -n '/\* /s///p')
	set -l git_branch
	if string length -q -- $git_branch_status
		set git_branch (set_color cyan)"($git_branch_status) "(set_color normal)
	end

        set -l time_str
        if set -q CMD_DURATION
            if test $CMD_DURATION -gt 5000
                set -l total_seconds (math "floor($CMD_DURATION / 1000)")
                if test $total_seconds -ge 3600
                    set -l hours (math "$total_seconds / 3600")
                    set -l minutes (math "($total_seconds % 3600) / 60")
                    set -l seconds (math "$total_seconds % 60")
                    set time_str "[$hours:"(string format '%02d' $minutes)":"(string format '%02d' $seconds)"] "
                else if test $total_seconds -ge 60
                    set -l minutes (math "$total_seconds / 60")
                    set -l seconds (math "$total_seconds % 60")
                    set time_str "[$minutes:"(string format '%02d' $seconds)"] "
                else
                    set time_str "[$total_seconds] "
                end
            end
        end

        set -l state "$(set_color f5a9b8)$(whoami)$(set_color white)@$(set_color 5bcefa)$(uname -n)"

	string join '' -- (set_color b000b5) $time_str $state ' ' (set_color green) (prompt_pwd --full-length-dirs 3) (set_color normal)
	string join '' -- $stat $git_branch '> '
end
