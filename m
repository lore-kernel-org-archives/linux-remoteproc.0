Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E9C4361A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7235207A5
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 16:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgLCQAJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Dec 2020 11:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgLCQAJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Dec 2020 11:00:09 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7295BC061A4F
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Dec 2020 07:59:29 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id j30so1638008pgj.17
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Dec 2020 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=6HgvkaQctZ39JQLge67/z5sx8Qune1Xo2JUMse28/RE=;
        b=Queth6MrO/59wTlsy5aNmyQhZ/H27qYAc0006X179F/ZV0wEn+c6iXSIH9/dMrIdSQ
         9/rM+NV7svjaMTwCmrmxU3vOKzdiddBQHabn+AsIq5IZYyCAErWX7tNqyxzfo5sK97Zd
         W3NxWUSSec8jqEi3yaDuMl6KF2dX7d2EVatshuS72MuEchpOw1shcJ3edIoxN+GmQROg
         XwhOr+C/WvKdrm/B+RdPIpPDrRD2ulG2qMBMuDMnOstZdiN4HGk8lG9i7I89x2AFhzEp
         OhGf/Puz85FPx57sqVH0HxyeR4IOXlzEJDu49OUuZbiaaqpRI5bwTwgzD0jv4uisA8YA
         1M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=6HgvkaQctZ39JQLge67/z5sx8Qune1Xo2JUMse28/RE=;
        b=CBbncj2kt3BzuoyEhhvZJ6xKgTdgV+I4vMEsTtXBovDEy+FXLZnJ0cD3gDQbs9hcJ8
         wKv+U96W5sXMUcmcUOo0+URwgM3qKpID6wr9qQRHymmvFtLqJd7RMfmg06atzCQG+EYs
         GxwB/RbhI/VUFhvE4FFUeTzv/GNIll7mBwqfOl9CHW9TQjb706SrrV93E4bS2okyT/9B
         oi3uMhCYXnYP0Vd2u9ywJGIdbJdg1o57SLrLXWr6y/XL59JFYxyA8E8nvfEzQXEtOGEU
         yINhk5gUJ45Khu6ew8hse6qwWiU2t3hOlodDUUki/9wRcQhbnS1zjD0OuhpVrsf0Lb5A
         YbSA==
X-Gm-Message-State: AOAM531DB1CNLUYuC9k7EL2q5GZ8WDZfGZRisI2ABfgNK8dkkFPr6xVC
        ko/cwK6Y3K3C0VwJdrC8FQn3QJFwTKlf
X-Google-Smtp-Source: ABdhPJz+1XJC9kxgToM5jl+h5Yn+AzhAPNrKOpubWS4WAxsCrAuq2jhUyDztT9ag7Zqi5ju0VUh6IiWiEftc
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr707022pja.0.1607011168564; Thu, 03 Dec 2020 07:59:28 -0800 (PST)
Date:   Thu,  3 Dec 2020 23:59:14 +0800
Message-Id: <20201203155914.3844426-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3] remoteproc/mediatek: unprepare clk if scp_before_load fails
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org,
        mathieu.poirier@linaro.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixes the error handling to unprepare clk if scp_before_load fails.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v2[2]:
- fix the "Fixes" tag format

Changes from v1[1]:
- add "Fixes" tag
- remove an unneeded change

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203030436.3583198-1-tzungbi@google.com/

 drivers/remoteproc/mtk_scp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..5e5705fe35a8 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
+leave:
 	clk_disable_unprepare(scp->clk);
 
 	return ret;
-- 
2.29.2.454.gaff20da3a2-goog

