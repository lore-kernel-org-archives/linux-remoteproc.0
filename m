Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF252C43331
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 02:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA0ED22D6E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 02:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbhAFCjr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 21:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbhAFCjq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 21:39:46 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3D9C061360
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jan 2021 18:38:19 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id o6so1371700iob.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jan 2021 18:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jp4jA5VOpxCAdanHFN3bi6TajwKIp0Iz6erEpMOg0cE=;
        b=rFAwaVSdLbBQiw6Kmmz1bVo0cshRtSGy6SrHqayvtCZ+SAXxc/2kt7Xfij6fwvj0gy
         K1Gr2dRFvZ7ninidIi5m/zsInBqSCo7kQ0Zi7jdm0QbQJYhxmYbXymccCcOErNHnljuW
         XcqAOBH4rsuph9FFqxpNXoTm3uA4Kp1ip6X+Q7Ah9i/bBiPt4kZJnXyBneulaYYNJ132
         qLPOnkeg6AkaaG+3Nsk9szYSjZMevnmTEzr3XgfMoEwI0AiQqsylTAM4rcCcg04ucv6f
         Mu9fvxDc5fY2ynK7PlnamlnMqt6utThhUPMrc/ymd71zuj49yee+0Bhodx2Ro2yMes0Y
         KDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jp4jA5VOpxCAdanHFN3bi6TajwKIp0Iz6erEpMOg0cE=;
        b=rSLO9QfEFN1zib5PrFhPdUjRj/CT0BsaZFPE+ljdp7VxTncNRjWvQ3Jre9giFaZCqY
         +ZZY9/a8RSJR/JJOelJ1GLfCkJe2cX20wjPK2Z5B3xdRgI53Y4Sc1OGe7qjJxoCB2xsv
         7fmDVwg5T0CT+GsenGzP0c/uRBbQcgrT1VD4sU39OWmM8oN0HXI7rmIUHpPDo97Qkqlh
         Uo+LkJMVx/tUqO4t3g9gvpKebnSf6PBdUL4rBVD5nqvkNOs38+kH7taym5YIXdGzJ+ts
         bk/wL1v0DKTXkMs8eq8jH3PxHPXcnQ3d5VxO2PFlm2wYbSGDR5y/QruxgtSITMPw8PNO
         bG2Q==
X-Gm-Message-State: AOAM530cT64BPlLoIPAFvABY1RO0juOB0dxvSFUCBE1fSrEpnTShJa+A
        fOiiPe399fUHwtVtA5Lwsk6I5A==
X-Google-Smtp-Source: ABdhPJzSLxMjstBlx99fWxDr2h+/Ajt+Uj5J8I3vGJRM4+L5cn3Sijho6Y2AgshvvWdkscHBeCCyWg==
X-Received: by 2002:a6b:5f0e:: with SMTP id t14mr1556852iob.80.1609900699177;
        Tue, 05 Jan 2021 18:38:19 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm631755ior.42.2021.01.05.18.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 18:38:18 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/3] net: ipa: support COMPILE_TEST
Date:   Tue,  5 Jan 2021 20:38:12 -0600
Message-Id: <20210106023812.2542-4-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106023812.2542-1-elder@linaro.org>
References: <20210106023812.2542-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Arrange for the IPA driver to be built when COMPILE_TEST is enabled.

Update the help text to reflect that we support two Qualcomm SoCs.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
index 9f0d2a93379c5..10a0e041ee775 100644
--- a/drivers/net/ipa/Kconfig
+++ b/drivers/net/ipa/Kconfig
@@ -1,9 +1,10 @@
 config QCOM_IPA
 	tristate "Qualcomm IPA support"
-	depends on ARCH_QCOM && 64BIT && NET
-	depends on QCOM_Q6V5_MSS
+	depends on 64BIT && NET
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
+	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_QMI_HELPERS
-	select QCOM_MDT_LOADER
 	help
 	  Choose Y or M here to include support for the Qualcomm
 	  IP Accelerator (IPA), a hardware block present in some
@@ -11,7 +12,8 @@ config QCOM_IPA
 	  that is capable of generic hardware handling of IP packets,
 	  including routing, filtering, and NAT.  Currently the IPA
 	  driver supports only basic transport of network traffic
-	  between the AP and modem, on the Qualcomm SDM845 SoC.
+	  between the AP and modem, on the Qualcomm SDM845 and SC7180
+	  SoCs.
 
 	  Note that if selected, the selection type must match that
 	  of QCOM_Q6V5_COMMON (Y or M).
-- 
2.20.1

