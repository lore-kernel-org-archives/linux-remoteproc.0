Return-Path: <SRS0=Z/7o=6H=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F692C55189
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 00:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 489A120776
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 00:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efBg576e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDWAiP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Apr 2020 20:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726387AbgDWAiN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:13 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD32CC08E859
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f20so1975336pgl.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGHZwN0LAtzrhReD8egvVxlgtUx+R63R7VOmTzodM+8=;
        b=efBg576eZ3LUkjyh6JULzCvgRV6yCqC5mm4AgOB3N/VfTEEiHJimPGf8zeU1nm5wxM
         ZA1vW/k9iqnx1GqD8FhQtgyeAEi2QhPzNlYobt2OVT2wYNL9VVLoWtwUNe1GhUuB4mlA
         EJplX/hsPmC6c0fY009d2HbeAioIMxQPcTURTtSHZbrDjTVJ4Ta1TcG0xurKjpJvblsf
         bPg/4P1FV+cJEGCMWKzQ37qXDVdi/72wEoLihvqgKZYNgx9g2Ml6vIug8aO5pH8YYzEn
         ZYvSTCOXf+122Z+97YBazi0uVR4s/lMlcVW45nhgdgWZAG8sOVYZhXv9AxPp4WVqu+8t
         boVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGHZwN0LAtzrhReD8egvVxlgtUx+R63R7VOmTzodM+8=;
        b=X7Cr+h6S/1oERFREb/UpjEedNf865bACSxO2W74eWIpO0kQWx7kepCes6Q/kWVmyH/
         ENpNbHLceKjxmvvEgztxfuKgtkFj7qxQaX2+IinFsAc2odlZchmiow0KRO7bIP2XN5wH
         kU2OX3XmohsbbfXRjfkHKjlQURI8Vze0gNVOTn336VcXEGXzGwZkusHTuiq9d/2wKC48
         neKPKtkn/0cAaz2JZJ06cMAQY+cyD7UgxN8oVnue9FYgP7AjHE8nAor51D4wjW0BgmXk
         0ot9dBiAgplDhSmZHKq6x1mflECmBX+81YbgejUfGVLvxFNf5x6fHP8mDAsScbZi1VkQ
         TwNg==
X-Gm-Message-State: AGi0PuYrGJ+KUKBLaX1E98WXOOiOj0q/lx6Op6sBEvMK70hO1Z9J6Z0+
        NaVovg1dzLE4GSiBURxEC+1zNw==
X-Google-Smtp-Source: APiQypLw7baTFhOiMTOokbF+ufVlwrh986MOwTUTryb0kDUEMg0FFP2DHqyjonVdeqr6H3GxSDFX8w==
X-Received: by 2002:a62:6585:: with SMTP id z127mr1191227pfb.217.1587602291258;
        Wed, 22 Apr 2020 17:38:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 3/4] rpmsg: glink: Integrate glink_ssr in qcom_glink
Date:   Wed, 22 Apr 2020 17:37:35 -0700
Message-Id: <20200423003736.2027371-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200423003735.2PayESMMDBlfXky2mrSlSkQZp6B5XZVAMBAYTQsJG6c@z>

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

