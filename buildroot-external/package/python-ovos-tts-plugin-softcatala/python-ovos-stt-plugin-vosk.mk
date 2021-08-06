################################################################################
#
# python-ovos-tts-plugin-softcatala
#
################################################################################

PYTHON_OVOS_TTS_PLUGIN_SOFTCATALA_VERSION = 0.1.0
PYTHON_OVOS_TTS_PLUGIN_SOFTCATALA_SOURCE = ovos-tts-plugin-softcatala-$(PYTHON_OVOS_TTS_PLUGIN_SOFTCATALA_VERSION).tar.gz
PYTHON_OVOS_TTS_PLUGIN_SOFTCATALA_SITE = https://files.pythonhosted.org/packages/1f/e2/87e51e5d479203a67615a427a3d6310db96401e1e6e81b0805b564329d09
PYTHON_OVOS_TTS_PLUGIN_SOFTCATALA_SETUP_TYPE = setuptools

$(eval $(python-package))
