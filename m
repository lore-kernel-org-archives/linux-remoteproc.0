Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08E3C433F2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B374224D2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0ch2eC3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgGNTu7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 15:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729773AbgGNTuo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88B0C061755
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so2014583pjg.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3SrIZnU0YUH2iCVYi8lfRsLpOXFKIkq3s3vt32Psx5U=;
        b=P0ch2eC3VgDErn1SdkPgrA9O7vWzyNVF0+/CuZx2zr1RX7beEuad1ItUQ5Yk2e5Tao
         6WMZilyJm1rve62WyzDHnV4/ifH/0Cco6TmOVarRcmIFSoqvvgGqC5j/jhxSx06Bg4x5
         xb3Ct+S+br+7+Vt1SY1mUy/wTOCIaP4R6tuwcmH10qWeCcju+YZUBG7R2CDMJF5YVIe1
         tizkJ58r59ks+DJ/YW9winL4TuT/SOEdwEk+LuZKJPAaWrYFA/WiJ+PVTz4E+KRHEyyk
         3rQchJzqCJhucGogm+J7pdhCTnDYJ9As1g0yCTWFRKjU1u0jdmIzRNX9gas3L1jKXN3R
         rauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3SrIZnU0YUH2iCVYi8lfRsLpOXFKIkq3s3vt32Psx5U=;
        b=Qrjz/omywfL7wjH8NmveTCE/zcRaehGp/TqgCZKYge3C6IqsVp8cRXFocqVkYahi8r
         XX779DnMYPqxaPVo46sC4s899QJMdVnKBcq8HwGkhPtH3HVXzcYui9XMu7HocHRxYHUD
         YvVRU72A8bYGcw+zxgn7PpsU63wwU1wW8KncBjaV3gWPvDp3fNa8QfMKp3sYF/L8ZSL9
         pc8GfB67eWFc/rHFkeUI0Ge2HZKPZhcYp7KIWJ+v4ie40lNhQc0TYlaxYWj9vr8MtfuH
         6U4uO3Ioql2iTHelHEfgEfXknxgFoOufkdzJ7K2woYghGwJFuzxGdv3UORpR+e0zUsct
         JyXQ==
X-Gm-Message-State: AOAM530Hbb1mJskp0N0yr/eZ7qc/7QJmz5XZML/08D3SWlLrALCE7W1N
        CUpjxf6JpoPx5K8ZgLhPXAkJ0Q==
X-Google-Smtp-Source: ABdhPJyrbkdEAbkYD3wAsFkm3BMUneo+jO6xqtT8iXbLf4XSKSzO+p7LXqFG5L9YvyDhC0FuDmMaVA==
X-Received: by 2002:a17:90b:1246:: with SMTP id gx6mr6463225pjb.85.1594756244300;
        Tue, 14 Jul 2020 12:50:44 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/9] remoteproc: Refactor function rproc_boot()
Date:   Tue, 14 Jul 2020 13:50:32 -0600
Message-Id: <20200714195035.1426873-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_boot() to properly deal with scenarios
where the remoteproc core needs to attach with a remote
processor that has already been booted by an external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ad500c291d5f..caea920ce4b8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1494,7 +1494,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int __maybe_unused rproc_actuate(struct rproc *rproc)
+static int rproc_actuate(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1905,24 +1905,30 @@ int rproc_boot(struct rproc *rproc)
 		goto unlock_mutex;
 	}
 
-	/* skip the boot process if rproc is already powered up */
+	/* skip the boot or attach process if rproc is already powered up */
 	if (atomic_inc_return(&rproc->power) > 1) {
 		ret = 0;
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "powering up %s\n", rproc->name);
+	if (rproc->state == RPROC_DETACHED) {
+		dev_info(dev, "attaching to %s\n", rproc->name);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
-	}
+		ret = rproc_actuate(rproc);
+	} else {
+		dev_info(dev, "powering up %s\n", rproc->name);
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+		/* load firmware */
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto downref_rproc;
+		}
 
-	release_firmware(firmware_p);
+		ret = rproc_fw_boot(rproc, firmware_p);
+
+		release_firmware(firmware_p);
+	}
 
 downref_rproc:
 	if (ret)
-- 
2.25.1

