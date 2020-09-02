Return-Path: <SRS0=C6No=CL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F41C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 08:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 377B02078B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 08:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bCBFH+rV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgIBIwX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Sep 2020 04:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIBIwV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 04:52:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04111C061245
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 01:52:20 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id c15so1983559plq.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w3VbD7LbrSIV+AJhlX9wGvBGH7WMn863FXViRRDiMM4=;
        b=bCBFH+rVPID9ii0sH5CtTpsTmP3uO1pnii5mbbyYZCsdeRY9cVTRSgJ2SDfFbmBeFv
         VoQ2HIF0sinQ2qjlxZCckhUePRL+hIUe0W0ZAqBqKC35HETCBYZTpFBasWVjYJMSll5y
         Jik6wgaxs4frbjmWajns1AmZYL0HBhZpC9v2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w3VbD7LbrSIV+AJhlX9wGvBGH7WMn863FXViRRDiMM4=;
        b=rT39e/CFQB5JenFf894hjXvNllOTm6sVO9bz9O3eBVOY6lzl5clH8S8HFRwJxUeLSx
         /qTmQq3OHcieQypi1zXKBsFBm7espOZmFpG2CVaDTpXjBSo/WWgE7s0hI06CQl+4dCy4
         3/pFmEgwSQiTgTvhQllfw083r62Rp7jtmWK9wEtYSM8zCCI/YVRg7iboqLIu2xfZT0Wx
         MiybxVz48jXTHYSQuQs8WN17RLUGBUwMn85/05oIwIv6Htr/uoXnShSru/eWBdMNr2kL
         W3ua9Mad7eEFKWD/jyDKWjVKdNS/jgfhUdDgiZvk8Sjx/jtfJWkfx/b1uVW/I1R8bWYO
         Lfbw==
X-Gm-Message-State: AOAM533cchknpwhd37tAu+jx+45v5kKRU4+BuMX2KNhmV1nTldtmhi+P
        miwuVzfeYCTXDNPnGF0uPwtzTw==
X-Google-Smtp-Source: ABdhPJxKqtFkU/U9HA+gDoFaweJo/+5PSsuycPrw6yluyFQdgQr0IsbJb68L4DRa/jf4kZLEuEiISw==
X-Received: by 2002:a17:90b:796:: with SMTP id l22mr1381398pjz.199.1599036740488;
        Wed, 02 Sep 2020 01:52:20 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id x22sm4698693pfn.41.2020.09.02.01.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 01:52:19 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH RESEND] remoteproc: scp: add COMPILE_TEST dependency
Date:   Wed,  2 Sep 2020 17:51:59 +0900
Message-Id: <20200902085159.1392703-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This will improve this driver's build coverage.

Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
Hi Ohad, Bjorn,

As explained in
https://www.spinics.net/lists/linux-media/msg175991.html, we need this
patch in order to merge a driver series in the media tree. If that looks
ok to you, can we pull it in the media tree along with the series that
depends on it?

 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..d1fcada71017 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
 
 config MTK_SCP
 	tristate "Mediatek SCP support"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select RPMSG_MTK_SCP
 	help
 	  Say y here to support Mediatek's System Companion Processor (SCP) via
-- 
2.28.0.526.ge36021eeef-goog

