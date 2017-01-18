.PHONY: deploy-site

deploy-site:
	git subtree push --prefix static/ origin gh-pages
