Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54096C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27B6D64E00
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhBWXps (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbhBWXkR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:40:17 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A65C06121F
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:26 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id b145so60279pfb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=MVV3vhm//Qy9ZrlCKMb16NdKTMroR2imuUkINcRxjjux/bl+uLuSLPbpRD1+1mGIZ2
         /+sbA0DrgyiBvh1ce7jR11k4/prDQABZEu8ZLl3253su/2GxBM+oPNcmyeOpwTYRE+7z
         +rEw6KT7cYrDATX1TD0OrKkoCUkaxwMFoCtsF8rAZqLVI00FRRM7Smxj+VDWVRSjMIV3
         OThZC45qFdxVv2NFrY+eZC93qdE+bRPGGmbzveBgWmpKZ2ubGAN8sVI9cO3knHgUkDs5
         DIp1kZYv0d42wEBFiWsihBdlBZHobFfXoZup1cI+LlhkMqK7Dncr90uKVhwBfkAxZDjG
         Lq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=dv0X9cqUxtFaY8YqBmuXR94L5NP1bTj/yOxG0HCb+kOEHI/JxgTx8780II0rvodaOb
         iyZ7wfeKeZRLctqo7V0d+UBOcUQjhGFrgPbbrSBGUbTZNSZzGFzaeJGQo+7xPcSjdB9Q
         eMIU4UnMm9QZCw2xlae5p3MBs4B7c+WaWxCdHQMCOdPvDQ/wknGowbPTP8mQHylhoQAG
         /zY0ZjfeALgHBe8jdBL+4YoSUfD+ATErYLLzv0kIHLJne3md9Yao7/0TpknN5kDbbmMT
         NSc2To4P2QA5bP0i5rO8pOlOUXMLyeplkQbex0oBIQSagF4U2W2vwHkhV4u1s2VZvVdb
         V8Wg==
X-Gm-Message-State: AOAM5334iHRmLSEgOjXIQ5bv5Av5X3ITOBRGUxkKkmJFnuZ+nVuPHuux
        EZrChu7+hUboU/O2LJnXupKvzA==
X-Google-Smtp-Source: ABdhPJznFf7DZqYNrPiOXAMW7oDr5knTQMa3p2jpXOrDYXjPzd9l0Vi8c8/FZ3GcjCq+M+pXBqRevg==
X-Received: by 2002:a63:fc1c:: with SMTP id j28mr26149581pgi.281.1614123326234;
        Tue, 23 Feb 2021 15:35:26 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:25 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 08/16] remoteproc: Add new detach() remoteproc operation
Date:   Tue, 23 Feb 2021 16:35:07 -0700
Message-Id: <20210223233515.3468677-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new detach() operation in order to support scenarios where
the remoteproc core is going away but the remote processor is
kept operating.  This could be the case when the system is
rebooted or when the platform driver is removed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 51538a7d120d..eff55ec72e80 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -385,6 +386,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

