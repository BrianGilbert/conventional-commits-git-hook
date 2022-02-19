
.PHONY: install
install:
	git config --global init.templatedir '~/.git-templates'
	mkdir -p ~/.git-templates/hooks
	ln -sf $$PWD/commit-msg-hook.sh $$HOME/.git-templates/hooks/commit-msg
	mkdir -p $$HOME/.sailr

.PHONY: uninstall
uninstall:
	rm -rf $$HOME/.git-templates/hooks/commit-msg

.PHONY: update
update:
	git pull

.PHONY: test
test:
	./scripts/run_unit_tests.sh
	./scripts/run_functional_tests.sh $$HOME/.git-templates/hooks/commit-msg
