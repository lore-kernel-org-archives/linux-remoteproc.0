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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4035C6369E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 03:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 883F621D91
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Dec 2020 03:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgLCDFg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 22:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbgLCDFg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 22:05:36 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C986C061A4E
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Dec 2020 19:04:50 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id t22so491556qtq.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Dec 2020 19:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=n1Thr1QG5H70oA7HSV+H9a2yla9+nJFCx4pWGGue+rc=;
        b=JRy3NfPfy9ofYP9u1wWVP3fc6cRMdScZf4wNMqGwvV1gBZuWnVIIp2rD++NJpZ4/Sb
         utQwHGmxkLC6g3oNyjqvZhNmLITEzL8FIE9+QJ+KsbeIV6nLKKl/Hpm0PtJc+YTtXLye
         rlN/RgeYKXW+hBkt8dbox++A+LErAiihLO0GdnO3sA8LLCK6vveLCWuvLvlqZ4DfQLtV
         61veTGfVo4uxvCPOcFSHIHSSVB8KLRXOveEisluSDDRrNiL+XOz/RSWS8wpz1YX9KwzH
         u1CJYeVZ3AkbXJBS1zh6vdHVsVRW9N/fgl2cIcNkcOg5iOOoo+knyvZFY+3GwoAP32/s
         c5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=n1Thr1QG5H70oA7HSV+H9a2yla9+nJFCx4pWGGue+rc=;
        b=q/WRG3vxX/N2XyIMpFvQ9shWe/LIz44Lo5AIgr4CJoRZS/wHzgWJHi5uPzmSGjK20O
         WyXZRDSjsx6HqfEgIHwKyLQRG3eWjnCJhb9t+tWOmpcFmiDjjXVJsi8JroGm/lkHSgoH
         9hJZuEf5wSwtk4dPCtUVSnETRHbdN8Ko/iB2CWhvt7yeyq//eiFgbJtWGCq/WS1LUzRP
         r2flyqh079UD61xQ4nL02nIJI6AmWdkNFBIzUVt2BUs4AvuDUOddrULKReueQsl/nGDZ
         te6HQ2+Nf02kQ0j8bY74c5VGpOn2k/sdCBPoDO/kOP4blVJZb545QkimLSzRCtkNKKNk
         vL8g==
X-Gm-Message-State: AOAM533awbO8wDWAHBe9VHNI0E1FW3vBmPIcUQjDgXlBSfmcPtz4A6T9
        hHNswgCu9RYw79mkRcfHARNVaAZWnrRR
X-Google-Smtp-Source: ABdhPJy+sHblLew+WFUgX1IsEjUCzi7+3RCW9sClYSBseRZ/jc7YG/WQXsgDxOg9FRePGawd+N67BpTmdy6G
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:18d0:: with SMTP id
 cy16mr1092968qvb.3.1606964689440; Wed, 02 Dec 2020 19:04:49 -0800 (PST)
Date:   Thu,  3 Dec 2020 11:04:36 +0800
Message-Id: <20201203030436.3583198-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2] remoteproc/mediatek: unprepare clk if scp_before_load fails
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

Fixes: fd0b6c1ff85a4 ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- add "Fixes" tag
- remove an unneeded change

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/

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

