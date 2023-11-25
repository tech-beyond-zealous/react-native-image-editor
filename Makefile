# create git tag
VERSION := 0.6.0
GIT_COMMIT_MESSAGE := "Update pod name and readme"
npm-version:
	@echo "Updating version..."
	@jq '.version = "$(VERSION)"' package.json > "tmp.json" && mv "tmp.json" package.json
	
tag:
	git tag -a $(VERSION) -m "Release $(VERSION)"
	git push origin $(VERSION)

git-push-all:
	git add .
	git commit -m $(GIT_COMMIT_MESSAGE)
	git push origin master

all: git-push-all tag npm-version npm-publish
