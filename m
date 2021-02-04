Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D2DC433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 15:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C99860202
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 15:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237511AbhBDPlR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Feb 2021 10:41:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:60606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237219AbhBDPk5 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 10:40:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 422E064F4A;
        Thu,  4 Feb 2021 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612453216;
        bh=oX49zY8OEwwhNvdM/kvlJEBpdDBF23mL3VHLWA6xajw=;
        h=From:To:Cc:Subject:Date:From;
        b=SFmZkxlKEWJGZ4cBkjku0jdiBKWAVeYXmZbAcjYFqpTpKsFY3+gjLigdazxK3h4mF
         l++QutmqzUUf1s5Ba/lS1UqG5h8Hg0wWzaAO8+wpWPcI3ABjJAiZzkAnpwhb5NRMCH
         ZuvJLcETBe4WQMVjuZREQ23mfKKHVQOIF7QAUs8M0hp52896rODOxVjg16E5Ya4VNS
         PAloeKywkXROy8QTMsMeNlOkieUIIMhExpUiA3NR9K6RWjzi/nrB9m6ERE2ZFm0UwZ
         e7EPpDLzfsWM0VjnnlSjpcrZNoabU0fMfgcFgntMF17dzIfXUgm2N076901MsNpZqY
         ip2oOFNowJG6w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alex Elder <elder@linaro.org>, Chris Lew <clew@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Suman Anna <s-anna@ti.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Colin Ian King <colin.king@canonical.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: fix glink dependencies
Date:   Thu,  4 Feb 2021 16:40:04 +0100
Message-Id: <20210204154010.1585457-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building the remoteproc drivers into the kernel while the qcom_glink
code is in a loadable module results in a link error:

ld.lld: error: undefined symbol: qcom_glink_ssr_notify
>>> referenced by vmlinux.o:(glink_subdev_unprepare)

Add a Kconfig dependency to avoid this.

Fixes: 8527efc59d45 ("rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config")
Fixes: 5d1f2e3c8090 ("soc: qcom: glink_ssr: Internalize ssr_notifiers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9e7efe542f69..88488af01fd9 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -155,6 +155,7 @@ config QCOM_Q6V5_ADSP
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -171,6 +172,7 @@ config QCOM_Q6V5_MSS
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
@@ -188,6 +190,7 @@ config QCOM_Q6V5_PAS
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -206,6 +209,7 @@ config QCOM_Q6V5_WCSS
 	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
@@ -238,6 +242,7 @@ config QCOM_WCNSS_PIL
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
 	select QCOM_RPROC_COMMON
-- 
2.29.2

