Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/4] rpmsg: glink: Integrate glink_ssr in qcom_glink
Date: Wed, 22 Apr 2020 17:37:35 -0700
Message-Id: <20200423003736.2027371-4-bjorn.andersson@linaro.org>
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>, Siddharth Gupta <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In all but the very special case of a system with _only_ glink_rpm,
GLINK is dependent on glink_ssr, so move it to rpmsg and combine it with
qcom_glink_native in the new qcom_glink kernel module.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/Kconfig                                    | 6 +++---
 drivers/rpmsg/Makefile                                   | 3 ++-
 drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} | 4 ----
 drivers/soc/qcom/Kconfig                                 | 9 ---------
 drivers/soc/qcom/Makefile                                | 1 -
 include/linux/rpmsg/qcom_glink.h                         | 7 +------
 6 files changed, 6 insertions(+), 24 deletions(-)
 rename drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} (97%)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index a9108ff563dc..f96716893c2a 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -24,13 +24,13 @@ config RPMSG_MTK_SCP
 	  remote processors in MediaTek platforms.
 	  This use IPI and IPC to communicate with remote processors.
 
-config RPMSG_QCOM_GLINK_NATIVE
+config RPMSG_QCOM_GLINK
 	tristate
 	select RPMSG
 
 config RPMSG_QCOM_GLINK_RPM
 	tristate "Qualcomm RPM Glink driver"
-	select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK
 	depends on HAS_IOMEM
 	depends on MAILBOX
 	help
@@ -40,7 +40,7 @@ config RPMSG_QCOM_GLINK_RPM
 
 config RPMSG_QCOM_GLINK_SMEM
 	tristate "Qualcomm SMEM Glink driver"
-	select RPMSG_QCOM_GLINK_NATIVE
+	select RPMSG_QCOM_GLINK
 	depends on MAILBOX
 	depends on QCOM_SMEM
 	help
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ae92a7fb08f6..ffe932ef6050 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -2,8 +2,9 @@
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
+qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
+obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
-obj-$(CONFIG_RPMSG_QCOM_GLINK_NATIVE) += qcom_glink_native.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
diff --git a/drivers/soc/qcom/glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
similarity index 97%
rename from drivers/soc/qcom/glink_ssr.c
rename to drivers/rpmsg/qcom_glink_ssr.c
index 847d79c935f1..dcd1ce616974 100644
--- a/drivers/soc/qcom/glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -164,7 +164,3 @@ static struct rpmsg_driver qcom_glink_ssr_driver = {
 	},
 };
 module_rpmsg_driver(qcom_glink_ssr_driver);
-
-MODULE_ALIAS("rpmsg:glink_ssr");
-MODULE_DESCRIPTION("Qualcomm GLINK SSR notifier");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 19332ea40234..5140bd82f1be 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -35,15 +35,6 @@ config QCOM_GENI_SE
 	  driver is also used to manage the common aspects of multiple Serial
 	  Engines present in the QUP.
 
-config QCOM_GLINK_SSR
-	tristate "Qualcomm Glink SSR driver"
-	depends on RPMSG
-	depends on QCOM_RPROC_COMMON
-	help
-	  Say y here to enable GLINK SSR support. The GLINK SSR driver
-	  implements the SSR protocol for notifying the remote processor about
-	  neighboring subsystems going up or down.
-
 config QCOM_GSBI
 	tristate "QCOM General Serial Bus Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 5d6b83dc58e8..e9cacc9ad401 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -3,7 +3,6 @@ CFLAGS_rpmh-rsc.o := -I$(src)
 obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
 obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
-obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
 obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
 obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
 obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index 09daa0acde2c..daded9fddf36 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -12,6 +12,7 @@ struct qcom_glink;
 struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 					    struct device_node *node);
 void qcom_glink_smem_unregister(struct qcom_glink *glink);
+void qcom_glink_ssr_notify(const char *ssr_name);
 
 #else
 
@@ -23,12 +24,6 @@ qcom_glink_smem_register(struct device *parent,
 }
 
 static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
-
-#endif
-
-#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SSR)
-void qcom_glink_ssr_notify(const char *ssr_name);
-#else
 static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
 #endif
 
-- 
2.24.0
