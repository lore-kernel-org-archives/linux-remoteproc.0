Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: qcom_adsp_pil: select qcom_scm
Date: Fri,  9 Dec 2016 12:47:02 +0100
Message-Id: <20161209114730.3780719-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The adsp-pil driver relies on SCM and causes a build error without it:

ERROR: "qcom_scm_pas_supported" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_scm_is_available" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_scm_pas_auth_and_reset" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_scm_pas_shutdown" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_scm_pas_mem_setup" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_scm_pas_init_image" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!

This adds a 'select', as SCM is a silent Kconfig symbol that gets
enabled implicitly by all its users.

Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 51d7ca0e10fc..1177329b7618 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -85,6 +85,7 @@ config QCOM_ADSP_PIL
 	depends on QCOM_SMEM
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
+	select QCOM_SCM
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm ADSP remote processors.
-- 
2.9.0
