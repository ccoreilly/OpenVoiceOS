################################################################################
#
# mycroft-skill-ovos-mycroftgui
#
################################################################################

MYCROFT_SKILL_OVOS_MYCROFTGUI_VERSION = 67aa80c4ffc57ee2cc93f1d06b59717ccc5663d4
MYCROFT_SKILL_OVOS_MYCROFTGUI_SITE = git://github.com/OpenVoiceOS/skill-ovos-mycroftgui
MYCROFT_SKILL_OVOS_MYCROFTGUI_SITE_METHOD = git
MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRLOCATION = home/mycroft/.local/share/mycroft/skills
MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRNAME = skill-ovos-mycroftgui.openvoiceos

define MYCROFT_SKILL_OVOS_MYCROFTGUI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRLOCATION)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRNAME)
	cp -dpfr $(@D)/* $(TARGET_DIR)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRLOCATION)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRNAME)
	cp -dpfr $(MYCROFT_SKILL_OVOS_MYCROFTGUI_DL_DIR)/git/.git* \
		$(TARGET_DIR)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRLOCATION)/$(MYCROFT_SKILL_OVOS_MYCROFTGUI_DIRNAME)
endef

$(eval $(generic-package))
