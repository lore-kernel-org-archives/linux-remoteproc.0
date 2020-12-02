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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45D6C64E8A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 04:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A36922202
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 04:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgLBEqp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Dec 2020 23:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgLBEqp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Dec 2020 23:46:45 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD221C0617A7
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Dec 2020 20:46:04 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id r29so364520qtu.21
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Dec 2020 20:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=KaD/sETMhQdwAs4CxEJvlROU3dFFHCWo0dFsT9X/rFw=;
        b=HqtyOa7OG56z5TA7PLMydmHYJxsAKx/WMKSXgBPdXYpQbAMfKonL5cSXWbbkl9KjhI
         JdBgvEZTXZGjXhN6yukz5tIIIB3ZeA9f4vzH0+fw1J2jwW2B6ZMxm6iP/KSgC2G1SmGE
         yT3qY0rHdTKa1M0OD9DYU4abtt/AQeZIex8J8aWxexSKwHtb9aa2mpwwX8TSm8p+wk0Y
         DVEJLOxa5SnTwD59EFqZrWzmxpPLeyTlMbxwmWzV6F44qStm3c6oTqAvK1Fucqh/+uXs
         /JWUHmohoaQ+K0MYpGXJX9J1qsGzS2EclWMkPNb2tsBOLgtTwmcbK0QyEqnoBjG9CSv+
         pKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=KaD/sETMhQdwAs4CxEJvlROU3dFFHCWo0dFsT9X/rFw=;
        b=Ik7qgclQtkifa3hqQ59pTLM8fmtnwDzEEiO1nSHjvb8xfQ14u6NND/whFHDfXVpei9
         EdBggOlq5vJlcibKl7tMshXIHwlwZAkNa+MVfhxuygEFb/P43JEs3P27j1fTwJ4LIdva
         JT1ykhzOh1SnV2992GxCUQgdIDTz1mt3aiq+ii2nN5C+n6f7xmXoPRkY7TTnLdrRtJfx
         Dcskik8BrjhSzsjoLMhhzLeU8sEipnCZ9agaGEbJZ7oM5fOds4No+H4x3flvclJ1BEpj
         3yepXlMOEWVmkqBAvJkW/PfgirQToV3AFOvxhiJ5wSpjW+WU125/rCOKbQNw2iYJplfD
         c4aw==
X-Gm-Message-State: AOAM530iOgt2SJDfSrVCo7BFbCOEMa76Ugwyh0zk9L3DkQgCpf/tAbUx
        pKSnSqE1dXyrcL0gxJXRWP+RMmxYdGml
X-Google-Smtp-Source: ABdhPJxIqcCBWdbzcwmEwprb6kcsp08cmzPY7xMIsej180ilIQOQ7gBZtgOPoEGoGa4RkKipRh5+zEF+lUBj
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:4721:: with SMTP id
 l1mr908110qvz.30.1606884364037; Tue, 01 Dec 2020 20:46:04 -0800 (PST)
Date:   Wed,  2 Dec 2020 12:45:37 +0800
Message-Id: <20201202044537.2500497-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] remoteproc/mediatek: unprepare clk if scp_before_load fails
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
        pihsun@chromium.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixes the error handling to unprepare clk if scp_before_load fails.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..c7d49c861adb 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -350,11 +350,11 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
+leave:
 	clk_disable_unprepare(scp->clk);
-
 	return ret;
 }
 
-- 
2.29.2.454.gaff20da3a2-goog

