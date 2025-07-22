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

	string join '' -- '[' (date +%H:%M:%S) '] ' (set_color blue) (whoami)@(uname -n) ' ' (set_color green) (prompt_pwd --full-length-dirs 3) (set_color normal)
	string join '' -- $stat $git_branch '> '
end
