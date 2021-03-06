# Reference commands for publishing.

GITHUB_PROJECT_NAME=iccm-eu-schedule
# Also update the spreadsheet ID in src/app/data/spreadsheetIDs.ts
YEAR_NAME=2021

all:
	ng build --prod --output-path docs/$(YEAR_NAME) --base-href /$(GITHUB_PROJECT_NAME)/$(YEAR_NAME)/
	cp docs/$(YEAR_NAME)/index.html docs/$(YEAR_NAME)/404.html
	sed 's/###YEAR_NAME###/$(YEAR_NAME)/g' docs/index.html.in > docs/index.html
	# Omit Test Data
	-rm -f docs/$(YEAR_NAME)/assets/sheet-export.json
	# install bof display pages
	cp -r bof/ docs/$(YEAR_NAME)/
	@echo
	@echo "Configure github project to publish from docs folder:"
	@echo "https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-your-github-pages-site-from-a-docs-folder-on-your-master-branch"
	@echo "make project available at https://<user_name>.github.io/$(GITHUB_PROJECT_NAME)/$(YEAR_NAME)/"

