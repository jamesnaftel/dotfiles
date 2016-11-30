# bashrc
#

# Source dotfiles
for file in ~/.{exports,aliases,functions,prompts}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

