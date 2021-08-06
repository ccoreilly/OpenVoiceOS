################################################################################
#
# mycroft-skill-wikipedia-for-humans
#
################################################################################

MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_VERSION = cabe223d2aa725532912648fd11a89a327e081a8
MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_SITE = git://github.com/JarbasSkills/skill-wikipedia-for-humans
MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_SITE_METHOD = git
MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRLOCATION = home/mycroft/.local/share/mycroft/skills
MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRNAME = skill-wikipedia-for-humans.jarbasskills

define MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRLOCATION)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRNAME)
	cp -dpfr $(@D)/* $(TARGET_DIR)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRLOCATION)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRNAME)
	cp -dpfr $(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DL_DIR)/git/.git* \
		$(TARGET_DIR)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRLOCATION)/$(MYCROFT_SKILL_WIKIPEDIA_FOR_HUMANS_DIRNAME)
endef

$(eval $(generic-package))
