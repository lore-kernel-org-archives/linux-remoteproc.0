Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA90AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Sep 2021 13:29:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7AF8611CA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Sep 2021 13:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240907AbhI1Na4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Sep 2021 09:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240786AbhI1Naz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Sep 2021 09:30:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC465C061604;
        Tue, 28 Sep 2021 06:29:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y35so32154218ede.3;
        Tue, 28 Sep 2021 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8PejLxm4SFdDXt81mt1kIwDT+MXJ6Y+DXlP8b+z5rc=;
        b=X641APYUKRwyU7set0YbgqCRIk2FIV25LCF01ettUgoYDvPM8NgvB9NqzrcNrRk94f
         7JQiA0D5Pxgs9RpLWIcIOcA/mci+hYYoJ2M/EGOcMEfuabbVmY5Zk1JgXYxw3k9sxiBm
         4fVPDnZQ0kpfqfPQLbWXSmz9JNdXla/iHb6mvJfGp9JpaLaA5VBWY6q9EKnkozFuC3SO
         HcmKkQH8g7PEzqPQ2RkSYbYoMDwKtunD0i0ztIAIAdq4Hfb4yn7FW7fwyU9agTzA7+EK
         GlbdgADVsNBK6Tnk9F1NrHVGDD3XZbCyTpAkU17I3MBCZcUQdTrHRYFkt93Ciz0/kw9y
         df+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O8PejLxm4SFdDXt81mt1kIwDT+MXJ6Y+DXlP8b+z5rc=;
        b=j/bT4t3WOmoyAxhL+QRiNvbaTLywzwyAjyelWUp0AnIOEZpzkMYuOzZ6k1VOXGsTXY
         Go27bDLQ3aPdEdLTHBVOF0CIL5qeMwXQ1r8MmjYHCn1G0KBwUIDQCDF1+jalST4cXZVD
         +gjcz6crJBOaNxWsbSwq/HMgiyiAaXAJk3DviN1DhAK9f/WrBMMdo8OUHf/v79A0zwIa
         ZiuptDUjgNEfXbBAIT9kOQPJpS1R1uacC7idVlKHkSB2zAPwO8qtqsoe/QvfCOztFaDw
         F7TDWnz/fH3f4FfXw1LXSaN3hzf64rRphvyACoHGzH/P+K1rKQxdrXLRZ0HCwyEeKtgA
         BYRg==
X-Gm-Message-State: AOAM530h9YGe6IrwIE+cjNjEC9XwHtSvR4f9ulA+P3S7rJvjq9COQc5u
        M6URyKmxygqZ2vvuofj9JijjQZmSBOM=
X-Google-Smtp-Source: ABdhPJwIq1+NQtw9AG0XKYrFusdIXdlV0ewv2YzGPs+dHi1A/DL7/b4lpHfdXBhVDSNlcMi/ep1FbA==
X-Received: by 2002:a17:906:7217:: with SMTP id m23mr6532121ejk.466.1632835748341;
        Tue, 28 Sep 2021 06:29:08 -0700 (PDT)
Received: from neptune.. ([188.27.128.17])
        by smtp.gmail.com with ESMTPSA id cr9sm12970056edb.17.2021.09.28.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:29:07 -0700 (PDT)
From:   Alexandru Ardelean <ardeleanalex@gmail.com>
X-Google-Original-From: Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org,
        Alexandru Ardelean <ardeleanalex@gmail.com>
Subject: [PATCH] rpmsg: virtio_rpmsg_bus: use dev_warn_ratelimited for msg with no recipient
Date:   Tue, 28 Sep 2021 16:29:02 +0300
Message-Id: <20210928132902.1594277-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Alexandru Ardelean <ardeleanalex@gmail.com>

Even though it may be user-space's fault for this error (some application
terminated or crashed without cleaning up it's endpoint), the rpmsg
communication should not overflow the syslog with too many messages.

A dev_warn_ratelimited() seems like a good alternative in case this can
occur.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 8e49a3bacfc7..546f0fb66f1d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -749,7 +749,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		/* farewell, ept, we don't need you anymore */
 		kref_put(&ept->refcount, __ept_release);
 	} else
-		dev_warn(dev, "msg received with no recipient\n");
+		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
 	rpmsg_sg_init(&sg, msg, vrp->buf_size);
-- 
2.31.1

