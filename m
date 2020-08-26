Return-Path: <SRS0=heY5=CE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AC7C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333E22074A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qm/4WZiz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHZQp6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 26 Aug 2020 12:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgHZQpn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:43 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123F9C061799
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z18so1148413pjr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lYOgLwnu7WcXXfGvAZrIa+HvcswO98ITukkP4wr02mQ=;
        b=Qm/4WZizP1KnyzgrqrSHdleNAP9snMSeWa1K5KztBk5eaOiDE1sfr5M06EEs7mq51Q
         ojW3MSEtGwhKk0v0h5flQ3LUG8aI68i2z2HYgyTb8rNm6N3QTm2iqZbnPrVaUuPMeCum
         cqpoYqEHg3wO/Xc0VJMXnoCEbD8G82Eqnv9KsmcoaNAU00Xuz23+s7qmIJK5az0cXhio
         jy77TmnzR4OTRHk25OIsp6rz5RrlvgQe+x+JeEwjQyqrKROf2EqT0XIjUOeVEyHKvLsz
         AwILZNfUx/NmEXjBUnfUMdCAMWAPUFgM9Kmp9ehd+2DpSLHzR77lVA57Ujw3FmYtrIQa
         bqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lYOgLwnu7WcXXfGvAZrIa+HvcswO98ITukkP4wr02mQ=;
        b=t3R0Ga5HMP4iqfSVTll65M4vCffcMfOi0nyOil2rT/LAMa8SIJO4+PGeMFs5vcvIWs
         gnh+t4eg01s+hv9Tb9GC6SGtmkQPrNZqTgIECNT+pXi6XRO1rfUiGw9AtrYoK8XBhi4p
         AVqdwr14R2pRP4yLn/Z0LBf2DBm+TPdqXRU/A5nk7g2U+qNaBbYvvyvSQTUAWxmpUd84
         n2hjIcBnof7GhzlWIfDLBEwE4fuMv8pifFW+U9ao4miWVT27+BNwTQfG6ebHUK7Czqke
         lyMHS8uWgbs256VJpkzPAyKuhjmh59sSUQ6w+IsRROIUTkNoibMpL29qtzELyMc43P3W
         5NAw==
X-Gm-Message-State: AOAM531jZ+o14mRxvWc/C0ctWTbcwFGWQAd2bTzbWOUgn4Oka1fck2LU
        jlsDVNJLg5jAbislU0jNhij7R9lde0o1/A==
X-Google-Smtp-Source: ABdhPJweiYXaAr9UZI8x6z3Q44YMLqlq8O7xiCK7/w7vL2hDv8FZ/av6l24rnOYusePiQaYrD9OW2w==
X-Received: by 2002:a17:90a:39c8:: with SMTP id k8mr7142436pjf.19.1598460336599;
        Wed, 26 Aug 2020 09:45:36 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:36 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] remoteproc: Add new detach() remoteproc operation
Date:   Wed, 26 Aug 2020 10:45:21 -0600
Message-Id: <20200826164529.224476-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826164529.224476-1-mathieu.poirier@linaro.org>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new detach() operation in order to support scenarios where
the remoteproc core is going away but the remote processor is
kept operating.  This could be the case when the system is
rebooted or when the platform driver is removed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index fe383392a821..1a57e165da2c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	tell the remote processor that the core is going away
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -382,6 +383,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

