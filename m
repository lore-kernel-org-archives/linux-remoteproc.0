Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4320C00A89
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B96A206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPWMYgB5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbgJ3T52 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T52 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:28 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33A3C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 15so6091245pgd.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRY6fl6qdiJ37muV/R9kDKMsDgeMJstCKTSUeBcPTBY=;
        b=wPWMYgB5Rru9JhhRQy3CiX2nQVYJctuXhiaWRXQO15gYvqDUdo0tNI7bIDUlHabUv6
         HeZw2Q8QMWW/XCi3GWOODH6VrhzXh39w0ipWzLtanyZkxgo839iByw6mAVf+Qom968Qv
         CNoht/ywiyaXSO1IKG3UpxpXCPEZP5mpnxmxn9ZtiX46xA5ff5kHkBWz3yj/tw9MHbnU
         xSjL0s2ezOjAotFJzJT4+FUvdvpbkhyHT521TwZBQO3OKqmJU1fO55lEPQ/JM7BzkYD1
         nfLeIMTO/9yLawCh01qreYvyzKqwXcE5OJXtW2tz7yASTUKsTMkpUjJRZPH2hwQlUZz/
         5YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRY6fl6qdiJ37muV/R9kDKMsDgeMJstCKTSUeBcPTBY=;
        b=NQH45I4vR7BUF52qUJeKTVKOYVbzVm8EdMBKaGD4OSH7LnJydv53gTuisv3kfqQaJC
         HZBeJ5WdvQIOFZmGHIOW24jDhHQGCsamZoFV+GTTsGR4eoa+l5rBTWy/UUXh9J2h7DuF
         iC3X2/FPaiTfmp3e1jIwDnaTEbdgWz5DI+8ykhKsHmI+TT1Uu5fHSI1KsaJ7jMTXVP2Q
         iVkMoOO7pGjQJucWbB6kWMvVXetoA+uQM+z8F7RkgdqFHJYGkYYn2LgYo9pwuozTp6+S
         ImH/9o5NX7EeJ2W5IhxtECtHUx5J2G5HYvO89MrucAfHfzdnT90nTX6x/n9UBTE5c0vr
         Z7SA==
X-Gm-Message-State: AOAM533PmbpEplAk9eCRPaxJWlK70Enm9ka8KZ/bByj86ikxgzpdGuzy
        ZS3LJtg0bjtQIZGcrCQCdKIKksol0edSxFcb
X-Google-Smtp-Source: ABdhPJzsfhoL31gUwlw6rtFL77NIe3Bpn2l1KbK2xhVbMZLGu9B19+vtXQqewWLE69KgikjFLCXsuQ==
X-Received: by 2002:a62:154b:0:b029:155:df74:5a53 with SMTP id 72-20020a62154b0000b0290155df745a53mr10943478pfv.39.1604087847572;
        Fri, 30 Oct 2020 12:57:27 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:27 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 12/14] remoteproc: Properly deal with detach request
Date:   Fri, 30 Oct 2020 13:57:11 -0600
Message-Id: <20201030195713.1366341-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to detach a remote processor
that has been attached to or booted by the remoteproc core.  For
that to happen a rproc::ops::detach() operation need to be
available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 6 ++++++
 drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index d06f8d4919c7..3a3830e27050 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -42,6 +42,12 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (!strncmp(cmd, "detach", len)) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 96751c087585..b05fad2178bb 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -235,6 +235,12 @@ static ssize_t state_store(struct device *dev,
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (sysfs_streq(buf, "detach")) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

