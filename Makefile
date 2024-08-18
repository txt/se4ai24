define Fish

          O  o
     _\_   o
  \\\\/  o\ .
  //\___=
     ''
endef
export Fish # hummm

Pandoc =      \
	-s           \
	-f markdown   \
	--mathjax      \
	--css style.css \
	--highlight-style kate        \
	-H $(Etc)/favicon.html         \
	--include-before=$(Etc)/head.md \
	--include-after=$(Etc)/foot.md   \
  --indented-code-classes=python,numberLines  

Cyan=\033[36m
Yellow=\033[93m
White=\033[0m

#------------------------------------------------------
Top=$(shell git rev-parse --show-toplevel)
Etc=$(Top)/etc

SHELL = bash
.SILENT:

help: ## show help
	printf '\nmake [$(Yellow)what$(White)]\n'
	grep -hE '^[^ \t#].*## .*$$' $(MAKEFILE_LIST) \
	| grep -vE '(grep|awk)' \
	| sort \
	| gawk 'BEGIN {FS=":.*?## "};{printf "$(Cyan)%10s$(White) : %s\n",$$1,$$2}'
	printf "$(Cyan) $$Fish $(White)\n"

pull: ## get updates from cloud
	git pull --quiet

push: ## save local changes to cloud
	read -ep "Why this push? " x; git commit -am "$$x" --quiet
	git push --quiet -u --no-progress
	git status --short   

style.css: $(Etc)/style.css; cp $^ $@

%.html: %.md  style.css ## md -> html
	echo "$@ ... "
	pandoc $< -o $@ $(Pandoc)
