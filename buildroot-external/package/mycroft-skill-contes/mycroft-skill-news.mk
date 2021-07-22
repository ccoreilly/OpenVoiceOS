################################################################################
#
# mycroft-skill-contes
#
################################################################################

MYCROFT_SKILL_CONTES_VERSION = 04420fd1684ba06660f001c315851812b8b174c5
MYCROFT_SKILL_CONTES_SITE = git://github.com/assistent-cat/skill-contes
MYCROFT_SKILL_CONTES_SITE_METHOD = git
MYCROFT_SKILL_CONTES_DIRLOCATION = home/mycroft/.local/share/mycroft/skills
MYCROFT_SKILL_CONTES_DIRNAME = skill-contes.assistent-cat

define MYCROFT_SKILL_CONTES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(MYCROFT_SKILL_CONTES_DIRLOCATION)/$(MYCROFT_SKILL_CONTES_DIRNAME)
	cp -dpfr $(@D)/* $(TARGET_DIR)/$(MYCROFT_SKILL_CONTES_DIRLOCATION)/$(MYCROFT_SKILL_CONTES_DIRNAME)
	cp -dpfr $(MYCROFT_SKILL_CONTES_DL_DIR)/git/.git* \
		$(TARGET_DIR)/$(MYCROFT_SKILL_CONTES_DIRLOCATION)/$(MYCROFT_SKILL_CONTES_DIRNAME)
endef

$(eval $(generic-package))
