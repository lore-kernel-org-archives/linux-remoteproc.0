Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73638C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 451DB6502F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhCLQZj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhCLQZP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:15 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591C5C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:15 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gb6so5389074pjb.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXhTHlq228l+0iB04Y1r45kd4DhCxMw3571PP4zILAA=;
        b=VEmmh5X9fa7g3DiKuaT8KWl1POaMjOAm+T7VEA/s9HtE3LAT5keAH5jFQKyhSL/xMS
         9uJBXewfM5+b2Q2pTgzWrVmV+u5Zklkra+XF6ZoMjwzwl3nDrYS25Sca4ZwK34BjwuaT
         fKdOhGmGki2L5vZnbr5jVEN6XKD47xT2oYXdqvo0L1b8XCgR1uYJZdPlUcn/aXTAgURg
         I89r80V6WlTTOdGZi7HbkMFBU4jDHk1ojvazPOfgEmHUj9IT73xhKzFO6Wf7Ptw2JyoU
         U0VILhPzwdvcAg87OIl0CFSYeewaobSPcU6c2uZ3UFeD0/cPDtw51Z4qZKVRZebEgqPA
         pFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXhTHlq228l+0iB04Y1r45kd4DhCxMw3571PP4zILAA=;
        b=A511l/T5zaiRL80uX46hDc4OLnJKJ4kV1BrPVzj396SUNQ+eDaohPP7RfBcemNzU1p
         8U6M9KzI26ImaYbWKT+8maXThMs6RZW7fHHbcMANCfqZ46y/3cSejAhDuK2QQp3zJIpF
         +yc+afef5UAq2omsBf6us4trMFK11kEvbTY9621LKtq4wfqmJKDfiIKKOQ4uBKHmVtMf
         BDXU0c4OXCYoeNoySxyzzsHfQ6iHARurFdqsdDFGjAVt/GbM9z8faAAzOLUdEUPXGP5+
         k1Hj0tBiBHjfZkYwRDuhXlSI5AfT06hZTA2y0ssrU0EEW5zN3TLfOT7/wpXatVszs6XR
         RcUw==
X-Gm-Message-State: AOAM532LQ1fnlkEdiyF03RA38ZF7OPZXrMwyFMqN+MUUi/CPE/OcoHFR
        Xbe2erC/9GlKnEYlP1J/I6ENnQ==
X-Google-Smtp-Source: ABdhPJy+d0zi50bylh7i8kcjhGz8ezrVQ0JqGrqHc3fNPEHAakRBEC7HmvAmHSP7MeuNaCrxFhnHAg==
X-Received: by 2002:a17:90a:a618:: with SMTP id c24mr15091131pjq.108.1615566314572;
        Fri, 12 Mar 2021 08:25:14 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:14 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 17/17] remoteproc: Refactor function rproc_cdev_release()
Date:   Fri, 12 Mar 2021 09:24:53 -0700
Message-Id: <20210312162453.1234145-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_cdev_release() to take into account the
current state of the remote processor when choosing the state to
transition to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 2db494816d5f..0b8a84c04f76 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -86,11 +86,17 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
 static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
+	int ret = 0;
+
+	if (!rproc->cdev_put_on_release)
+		return 0;
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (rproc->state == RPROC_RUNNING)
 		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		ret = rproc_detach(rproc);
 
-	return 0;
+	return ret;
 }
 
 static const struct file_operations rproc_fops = {
-- 
2.25.1

