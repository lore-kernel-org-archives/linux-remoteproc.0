Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FBAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Jan 2022 23:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344281AbiASXVm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Jan 2022 18:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344228AbiASXVm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Jan 2022 18:21:42 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D9BC06161C
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jan 2022 15:21:42 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id b136-20020a621b8e000000b004bfc3cd755cso2476642pfb.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jan 2022 15:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=R3Y/gOk08NgtXcS6vykPovrhRLCA2DpTaWszWvKKMv8=;
        b=c5zgx/4itJnifU5XQnptwovLjitu5KxUpdScwBHS9ppYLx8ucjI2vrBYnNg7vFwLG7
         VzFrLBx5t7DPwx/PJAna5plHjt7e7TgHwB/G8MXte8rSpYlwAoWRr14WybVs89QLUesC
         pgsTFv1yPQkaCAzYO9fu7jkDmk6hMnMFPUc864hF/qsMPw8X1Jt+FCfsiojcg4ZvbLI8
         102AZ7T1DxZAm95v5nl9qYZeoJWr2IO5mHLblewk4l/t/GU9ST8RtuDlZHyxZZkRdK9Z
         Vfk2b+ssBm7uP69bDqqQQSekf/OqZkeGdNNLY8VgwQdSTBKxSAxeWdSLPREam0I4Tzqy
         FLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=R3Y/gOk08NgtXcS6vykPovrhRLCA2DpTaWszWvKKMv8=;
        b=XDeHWSlM6n9O0+OnopSdnV1RXiS5QOEpySI+VjmoKk/o26Yjn9Jwc/cKlQHKpkSlD9
         ni52skNrGefgCSIhVDE68D9NobN+3+j7ZlWCA7lqepHbKS36EE5nhJL8wHonr/Hl3FZT
         FQshRlnm/tlCLID/U86OU5lGQ4PXyieiJ8zGAPs2WFjJPSXR0JXX2AoiBBlOzTc3Lx/b
         U0e03PQUEvuMv1/diRJIv+aqF7fI92e4ixYAcUzbK7Z/X93ARtemqNh8sA1Er+mBG0a0
         Fbg4TNOYzH2/jTZX8upx3uKbg8h8ZR3KTkRUh2QK+ikxuFYEOQdaIvBmPlUxJJQGKv73
         dTsw==
X-Gm-Message-State: AOAM533ST21rfbMDH8OyFzUruYNyg5qjgRB6cmZExc0CROMXdwSLhBzP
        OBIhjUi++lx5vsndVgJ7UYVXnzrMn/M=
X-Google-Smtp-Source: ABdhPJy0tmrWl2qzWMTzlH8xT25SOYiP2Mzw6nzK3q3lsalSqLQ2INJtAheVNXowbPrtzMsxUnxlwxnh370=
X-Received: from adelva.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:b2b])
 (user=adelva job=sendgmr) by 2002:a05:6a00:2408:b0:4c1:e1a1:770 with SMTP id
 z8-20020a056a00240800b004c1e1a10770mr32410337pfh.70.1642634501702; Wed, 19
 Jan 2022 15:21:41 -0800 (PST)
Date:   Wed, 19 Jan 2022 23:21:39 +0000
Message-Id: <20220119232139.1125908-1-adelva@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [PATCH] remoteproc: Fix count check in rproc_coredump_write()
From:   Alistair Delva <adelva@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        stable@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Check count for 0, to avoid a potential underflow. Make the check the
same as the one in rproc_recovery_write().

Fixes: 3afdc59e4390 ("remoteproc: Add coredump debugfs entry")
Signed-off-by: Alistair Delva <adelva@google.com>
Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: stable@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: kernel-team@android.com
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b5a1e3b697d9..581930483ef8 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -76,7 +76,7 @@ static ssize_t rproc_coredump_write(struct file *filp,
 	int ret, err = 0;
 	char buf[20];
 
-	if (count > sizeof(buf))
+	if (count < 1 || count > sizeof(buf))
 		return -EINVAL;
 
 	ret = copy_from_user(buf, user_buf, count);
-- 
2.30.2

