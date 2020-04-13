Return-Path: <SRS0=OzSZ=55=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE96C2BA2B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFB0E20575
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGuxT7Dp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387895AbgDMTeK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Apr 2020 15:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387887AbgDMTeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 15:34:05 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EE0C008749
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:05 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so4222572pjb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TjOuIVToF1NlCHf/TN+d81EeLU7495kSPR6hHYE0Fk=;
        b=RGuxT7DpcK4VfIkxlFhREK8AALcVpHkQVLbiSOBe9Rmhwa/lMCBk9FuOaLEHJHlusS
         pJN5x65XaiwE4Bz51GDFC2djK+UdL1kx+AfVUFzLWEQhTJ7LTpKmZxXrt6lA+etbs9U7
         00352uM+uPYGSuDB+xQ9AG5iB/c+JW4XzvXGXC38SrQNC5Z7UEsohospYWA97qOILDQw
         fiax3Sf0/mBBaj1C9lY9c+9+stwhNul098oiIVSr/gUSgSy6ihT/jdf+Ch4i6iZtRRLJ
         T2iHHUXfE8cTihGwv7K2c/b/L7ePOqN6A32TKC3DTMW5Bqsek1dn2HajJZ3AJkO3hkkI
         gztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TjOuIVToF1NlCHf/TN+d81EeLU7495kSPR6hHYE0Fk=;
        b=e32aI2/gFqx3RTBzu/QyUJR1j33JIVV11IAL1id04kf1QT8+jRa540CQJkVuEQjQrr
         3zOk2Tc3m6XgGFCm2kRapISai4TBgVX/ygsHcKhNbYd4qcZwnDJP0IsR+ND0Q4qDXNWy
         6tV1QV4ipi/aaNiES6qVCOHE6zUFzRqn0EFx5+xNOKuO1tHrCpdsweIzGBOIUYxs1ai0
         eyYSKtD+WCesJGg9nRIs8+Mw2dkSTuojYAqu5NBP9TAOO9hzpTJVNwbFg1YlMu30qL1/
         sCtzRLpvAtdVwWk0w6qqfpeU7YcafTjkZNKBtOyJLw1FajEkIi1DANr+xzd/9La/ENnS
         NttQ==
X-Gm-Message-State: AGi0PuaDp2UyMRVis0lJiPHYhQv8syKlwCNRD2fxHIVx57NhbqjBE4Mc
        Mu1NweJS1qx+6u9vFklIXbXdAQ==
X-Google-Smtp-Source: APiQypKtMpSzbygORrjyitVbPW/AtwsKD923jVbEsASpdT9n/FTIelN3THWi9eixr3ud0NMeNVKAxQ==
X-Received: by 2002:a17:90a:1681:: with SMTP id o1mr23927367pja.55.1586806444594;
        Mon, 13 Apr 2020 12:34:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ml24sm7032330pjb.48.2020.04.13.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 12:34:04 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: Fix a bug in rproc_alloc()
Date:   Mon, 13 Apr 2020 13:33:58 -0600
Message-Id: <20200413193401.27234-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200413193401.27234-1-mathieu.poirier@linaro.org>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200413193358.wVCoKG6hqf8wRPYEBuZaicimZMULq4WzZU2fH00UmMg@z>

From: Alex Elder <elder@linaro.org>

If ida_simple_get() returns an error when called in rproc_alloc(),
put_device() is called to clean things up.  By this time the rproc
device type has been assigned, with rproc_type_release() as the
release function.

The first thing rproc_type_release() does is call:
    idr_destroy(&rproc->notifyids);

But at the time the ida_simple_get() call is made, the notifyids
field in the remoteproc structure has not been initialized.

I'm not actually sure this case causes an observable problem, but
it's incorrect.  Fix this by initializing the notifyids field before
calling ida_simple_get() in rproc_alloc().

Signed-off-by: Alex Elder <elder@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e12a54e67588..80056513ae71 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2053,6 +2053,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.type = &rproc_type;
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
+	idr_init(&rproc->notifyids);
 
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
@@ -2078,8 +2079,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	mutex_init(&rproc->lock);
 
-	idr_init(&rproc->notifyids);
-
 	INIT_LIST_HEAD(&rproc->carveouts);
 	INIT_LIST_HEAD(&rproc->mappings);
 	INIT_LIST_HEAD(&rproc->traces);
-- 
2.20.1

