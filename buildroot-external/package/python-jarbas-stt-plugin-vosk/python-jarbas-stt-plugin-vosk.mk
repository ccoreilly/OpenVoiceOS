################################################################################
#
# python-jarbas-stt-plugin-vosk
#
################################################################################

PYTHON_JARBAS_STT_PLUGIN_VOSK_VERSION = 0.2.1
PYTHON_JARBAS_STT_PLUGIN_VOSK_SOURCE = jarbas-stt-plugin-vosk-$(PYTHON_JARBAS_STT_PLUGIN_VOSK_VERSION).tar.gz
PYTHON_JARBAS_STT_PLUGIN_VOSK_SITE = https://files.pythonhosted.org/packages/0d/7f/4dd4ef8b8e5ba4389d26fbb66049b776d1c2699fd7b421ea47d4598c84c0
PYTHON_JARBAS_STT_PLUGIN_VOSK_SETUP_TYPE = setuptools

$(eval $(python-package))
