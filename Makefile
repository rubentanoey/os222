# REV08: Mon 30 May 2022 10:00
# REV07: Tue 03 Aug 2021 09:00
# REV06: Fri 23 Jul 2021 10:00
# REV05: Mon 19 Jul 2021 13:00
# REV02: Tue 15 Jun 2021 11:00
# START: Mon 15 Feb 2021 09:00

SITEURL="template.vlsm.org"

ALL: 004.md 005.md 006.md 007.md 008.md 009.md .siteHack

004.md: 004.pmd _config.yml Gemfile _layouts/default.html Makefile \
        _includes/navbar.html \
        _includes/footer.html _includes/head.html _includes/google-analytics.html \
	assets/css/style.css assets/scripts/includeScript.py 
	python assets/scripts/includeScript.py < 004.pmd > 004.md

005.md: 005.pmd assets/scripts/sources.list assets/scripts/clean-system.sh \
        assets/scripts/debs.sh 
	python assets/scripts/includeScript.py < 005.pmd > 005.md

006.md: 006.pmd assets/scripts/clean-home.sh \
        assets/scripts/set-rbenv1.sh
	python assets/scripts/includeScript.py < 006.pmd > 006.md

007.md: 007.pmd
	python assets/scripts/includeScript.py < 007.pmd > 007.md

008.md: 008.pmd assets/configs/config-linux-kernel.txt
	python assets/scripts/includeScript.py < 008.pmd > 008.md

009.md: 009.pmd
	python assets/scripts/includeScript.py < 009.pmd > 009.md

.siteHack: _site/sitemap.xml
	@bash  .siteHack $(SITEURL)
	@touch .siteHack

.phony: ALL

