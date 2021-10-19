Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4081CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 15:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A791610A1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 15:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhJSPkl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Oct 2021 11:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232316AbhJSPkk (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Oct 2021 11:40:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BE7860FDA;
        Tue, 19 Oct 2021 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634657908;
        bh=Xcu0ti1CrEPVbEOMFRZB3Nrs6ksiNbx5Kbg6zn4tiP8=;
        h=From:To:Cc:Subject:Date:From;
        b=gOI649YoxcBVASk+3Tlr4NXy/eF/h7NW4W2uMUTbBf6LFfT+bu3xsqWBbaRdv+UM/
         V06SD0yEZajtL1Ex7OeLtIOjfl1WiRZGRFQEf2I9tZVmmGHDgIOuSaHq5G2zLpnZVV
         iKh3n/uxpBPZXif3WB2SoUFGD7x5G8Bb8hQ8nTId81UiFAxWZQHmaxm8rjUvvFx6Af
         v+DCeqVvlQHU0F2+z0A6df+Hi3acmN6x7zaA3Bs3tf/ktC/D2gq7aNjLEgws7sxnuw
         Bzz1q3jhLaRTzynqcrUmT0hz9lat3r2/4Efnra2qECUAAhzU2RU11zjBClnuOpiXUT
         oyysrrDkugq2A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: fix linking against QMP
Date:   Tue, 19 Oct 2021 17:38:04 +0200
Message-Id: <20211019153823.477524-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

With QCOM_AOSS_QMP=m, the built-in q6v5 code fails to link:

ld.lld: error: undefined symbol: qmp_send
>>> referenced by qcom_q6v5.c
>>>               remoteproc/qcom_q6v5.o:(q6v5_load_state_toggle) in archive drivers/built-in.a

ld.lld: error: undefined symbol: qmp_get
>>> referenced by qcom_q6v5.c
>>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_init) in archive drivers/built-in.a

ld.lld: error: undefined symbol: qmp_put
>>> referenced by qcom_q6v5.c
>>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_init) in archive drivers/built-in.a
>>> referenced by qcom_q6v5.c
>>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_deinit) in archive drivers/built-in.a

Apparently it is meant to work without that code, so add
another hacky dependency to prevent the broken link, but
explicitly allow it to be built without QCOM_AOSS_QMP.

QCOM_Q6V5_COMMON is a hidden symbol, but add the dependency
there anyway to give a hint in case another user comes up and
misses gets this wrong again.

Fixes: c1fe10d238c0 ("remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f2e961f998ca..d45e47b873b1 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -171,11 +171,13 @@ config QCOM_Q6V5_COMMON
 	tristate
 	depends on ARCH_QCOM
 	depends on QCOM_SMEM
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 
 config QCOM_Q6V5_ADSP
 	tristate "Qualcomm Technology Inc ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
@@ -198,6 +200,7 @@ config QCOM_Q6V5_MSS
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
@@ -214,6 +217,7 @@ config QCOM_Q6V5_PAS
 	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
@@ -235,6 +239,7 @@ config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
-- 
2.29.2

