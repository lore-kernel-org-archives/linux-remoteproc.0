Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D7AC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 02:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30BE7230FE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 02:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbhAGCbu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Jan 2021 21:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbhAGCbu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Jan 2021 21:31:50 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7712C0612F1
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jan 2021 18:31:09 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id f19so3870445qtx.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jan 2021 18:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=tNysKkCMZfVPOEF1Rqcdgg1STtCMPOn28jLi9xU4sRo=;
        b=gZCxS3Qx0a2mPHdct3VLekV6zlfpRBbW377QpRAcUnlZsXnYIEX0TJKZFPMavk7L8q
         1+lYkZG08d8XABjLTKlm0kf2MAAUFGJpAojUrmruB6Nrf8z1Te5S1ivCjP0GVYMOANxB
         auRm8f5xyT7VQ6Sf7TxYnq0KmwPBEytKLjYkiU5KO82QJ86k7t9mdzRpfkZZVE56dOBk
         pzIAEqkGnudhmnOljX+tgX1hslPIBQErlh4t1W2H98cq16loFYCeQGHDI3TLNa7LXFFh
         S3dqQc9IQKjfUqJWlJeNw/K0q2I1wsD5OxM20QSrMD4HCyv8oTRsaYqgLTxWWDDMIIxW
         vN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=tNysKkCMZfVPOEF1Rqcdgg1STtCMPOn28jLi9xU4sRo=;
        b=KCJ3eoU7P9Mxe+TUxmar5dwKlKgGnh+NQJw23QUCl7sRIKM+SVulBNKZ1JkgpQnG/T
         jpE60R/020mV0lrZjGv3boA9JGcjEgBFKtgD2lJIRewzJqbr85QwrB7+HWmGS3xe9ah9
         eUY70Uigl/e/n7zBDQsWpuyMJjoSjkgW1Xx388W4Bzjkvf6LfrozPOm4JJrJOVdKbRKR
         k0OJKzAIe/AXycXHcL7gt9Weml1+Jy4f4ZSAU8x+oj36dUNVBubB4Jl1HjB0H2v7pZC8
         mQzr4i0kuwH+XLjsyUhE9nDVbib4X9AYhId5wcIGstKjYIgpZc6+rOedNEwwibG52M22
         01Qw==
X-Gm-Message-State: AOAM530wDYX1l+9SqB0fClDZhnUuvo1rpzfLirrVFSRVSsYcjP2f7mXW
        GdBLMxLG9KStem5Z+ArV6NTiTT6KAA6r
X-Google-Smtp-Source: ABdhPJz4AGltbzoejR8dMF7WllRpmHxZwwc4BkoGIX+vicw/ugDUH2TD8KEmZXaDNJ9+P93XWZjVpB10F8su
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:f888:: with SMTP id
 u8mr55647qvn.47.1609986668860; Wed, 06 Jan 2021 18:31:08 -0800 (PST)
Date:   Thu,  7 Jan 2021 10:30:20 +0800
Message-Id: <20210107023020.3224002-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2] remoteproc/mediatek: enable MPU for all memory regions in
 MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
memory region.  It defines whether a memory region can be managed by MPU
or not.

In the past, due to the default settings in the register, MT8192 SCP
works luckily.  After enabling L1TCM, SCP starts to access memory region
that is not included in the default settings.  As a result, SCP hangs.

Enables MPU for all memory regions in MT8192 SCP.

Note that the register is read only once when SCP resets.  Thus, it must
be set from kernel side.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- Adds more details in commit message.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214051047.859110-1-tzungbi@google.com/ 

 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 94bc54b224ee..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f025aba67abc..130c0b9511df 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.29.2.729.g45daf8777d-goog

