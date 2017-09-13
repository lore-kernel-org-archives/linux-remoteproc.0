Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: srinivas.kandagatla@linaro.org
Subject: [PATCH] remoteproc: qcom: select QCOM_SMP2P for all qcom pils
Date: Wed, 13 Sep 2017 18:04:05 +0200
Message-Id: <20170913160405.17855-1-srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

All Qualcomm PIL drivers require SMP2P module to get a functional PIL,
Currently user has to explicitly select SMP2P module, after looking
at failure logs.

Fix this by selecting SMP2P as part of dependency of pil kconfig itself.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/remoteproc/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8891a8e50f12..052c9e20abb6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -87,6 +87,7 @@ config QCOM_ADSP_PIL
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
+	select QCOM_SMP2P
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm ADSP remote processors.
@@ -102,6 +103,7 @@ config QCOM_Q6V5_PIL
 	select MFD_SYSCON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
+	select QCOM_SMP2P
 	help
 	  Say y here to support the Qualcomm Peripherial Image Loader for the
 	  Hexagon V5 based remote processors.
@@ -114,6 +116,7 @@ config QCOM_WCNSS_PIL
 	select QCOM_MDT_LOADER
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
+	select QCOM_SMP2P
 	help
 	  Say y here to support the Peripheral Image Loader for the Qualcomm
 	  Wireless Connectivity Subsystem.
-- 
2.11.0
