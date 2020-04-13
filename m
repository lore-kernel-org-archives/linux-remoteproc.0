Return-Path: <SRS0=OzSZ=55=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5658EC2BB1D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3963520732
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HeMosw6Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387901AbgDMTeK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Apr 2020 15:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387890AbgDMTeJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 15:34:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC015C00860E
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:08 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h69so2370578pgc.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gU2cOA3BiSfFddDcALcj2wG+E3K4HvoumOkViRH8D+8=;
        b=HeMosw6YchIKbW/5m0S6mmisN7wfVCq+TFADyM7X/zjgLv6x8SfDaXjGs2EzZ7xbOd
         UBMg2roQLdvuMY8OaV/fAMYaNgPC2z9n2P+bGekXRp7uKpViPwRn1KOC0+5uS0BcKPlh
         RQprc/CcgjZiejIbY9+g1EMg4ZPCZ3190q4L8IhDegAdu31HMcDZO63Zo/mcXRvkm8fw
         1/PCPGpN22nPOw+bqr5ShQElpx1tQ78R+9GIvSzOSg2ECJ9FVle10VLVTQ1pmv6OXhNb
         Bnonk89IUQY4mxJdgLMrNHElPGyTmPJIV2bd3VFYk36GBc4946tZa9oElN4tmnRYj+fD
         mfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gU2cOA3BiSfFddDcALcj2wG+E3K4HvoumOkViRH8D+8=;
        b=M3X/UIAWB+lXLZwo8mjqOA3IuiPlWnNGdwtW636ROgYYdJPpgTlv7ENg05xrPXN+YC
         B0DD8QXWxFRIC41kkktCpD9s/ERkalbAd/tX2T91wBIlWkyVoFLG8j+8ePav9keQWPMf
         DM8MTiA0Ra5NxWW+IiHqjIJdlBQT0PS8NLjGDl5pr1/GOCWVOn5SGtEptIs2KtSiY3xR
         kVdxJ5nUgmJD057ixiRSnU2ViEgEP6iNgDYFniXlIMYcc55TqaF3JPWLrH6bHIHYRYaf
         Io3QiJUDFxLg7LYOUZedX9P0Wm/gU5adqNy+aWxY5QVL0xPfdnXzrVukKGyds0dDg1NW
         6iLg==
X-Gm-Message-State: AGi0PuYPjzuwQFu07V29n0Q2yzA7RmWQaL7HJNjfZYQy2yF8dmwPRafd
        Bk4FX+Mnj9owWLtgOLyPctNw2w==
X-Google-Smtp-Source: APiQypLO7Rs9j/m1litrgLroiUDnC44EIiP0dbxzfEPDsTKCchKHqeCUne1a6mCxPCvBCRZVLL04xA==
X-Received: by 2002:a63:cc03:: with SMTP id x3mr18918025pgf.28.1586806448202;
        Mon, 13 Apr 2020 12:34:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ml24sm7032330pjb.48.2020.04.13.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 12:34:07 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: Get rid of tedious error path
Date:   Mon, 13 Apr 2020 13:34:01 -0600
Message-Id: <20200413193401.27234-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200413193401.27234-1-mathieu.poirier@linaro.org>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200413193401.6sPqEejbJMGj-rkURPacGZzMPGwvGmafdi0RwSWgd8c@z>

Get rid of tedious error management by moving firmware and operation
allocation after calling device_initialize().  That way we take advantage
of the automatic call to rproc_type_release() to cleanup after ourselves
when put_device() is called.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c272d78f07e8..10009b95867a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2061,12 +2061,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc)
 		return NULL;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto free_rproc;
-
-	if (rproc_alloc_ops(rproc, ops))
-		goto free_firmware;
-
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2079,12 +2073,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto out;
+
+	if (rproc_alloc_ops(rproc, ops))
+		goto out;
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
-		put_device(&rproc->dev);
-		return NULL;
+		goto out;
 	}
 
 	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
@@ -2105,11 +2104,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
-
-free_firmware:
-	kfree(rproc->firmware);
-free_rproc:
-	kfree(rproc);
+out:
+	put_device(&rproc->dev);
 	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
-- 
2.20.1

