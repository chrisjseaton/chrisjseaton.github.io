.DEFAULT_GOAL := help
.POSIX=
.SUFFIXES=

serve: ## Run the site locally at localhost:4000
	bundle exec jekyll serve

update_dependencies: ## Update ruby dependencies
	bundle update

.require-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'
