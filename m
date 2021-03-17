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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC727C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 03:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 953B864F8F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Mar 2021 03:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCQDns (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 Mar 2021 23:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhCQDnd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Mar 2021 23:43:33 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C70C06174A
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Mar 2021 20:43:33 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id j2so18987162qtv.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Mar 2021 20:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=SAgc2wml3XejvpAqr2JtaDLGmEHKA05COtq+ks5Ch+g=;
        b=bEuTmKXAqskBXFd/wy/qeNIg15UPYvp24wIFqRiPJd8UZ9zZqsSAzUdx2kA3LnQIzd
         97WhiztLf4v7ezD/UpiOFhdSIOIIrFxXPVRlMgOj0AMFev7fqFAgbDHa1rs+ntw8mzB5
         aBqTX5CQwoAxcVxSbpoY43JJrOe3QYlUKx/m4fIGVocMeGBG73DTLgyqBGfPIK0g6fR/
         pb0/t1OZf+aYRFwJoWJ1Ny2TB31BGrYMNdfKDtLAwXxAKUGBYgxQFG1AD1nAJyyOgqS3
         Ul1MKYE1SJGj4+Vpug2mKa88fIHSBuAaoHl2D20vi1dhLx69Nx3nLuNWt4zOlIWRQ9fE
         /Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=SAgc2wml3XejvpAqr2JtaDLGmEHKA05COtq+ks5Ch+g=;
        b=N2RI5vpzPplfoRhuXi1uWWcXE/EdJhDKKILl1tgA16ystovpI81eboQM6TqHYKyFQO
         yA7XIapG1DUlSCF/OMLG0huRrB2dA4LE3iYFz9vEVwlOPz+sXiseomRb4lgZ5CHpszwd
         1q3UXgddFTVXjHKBAMkIj3SWpQXNQAjsVGjPjFEc66gza70MsV8QShU5EpToK4Z99RFf
         BAzqWx4byWRs984WMN6HD0bEP5WhhkmiPft0KOBoLvnxjLtcB1m+Itjb56l/DA+T+IgM
         mbXsuKnC8M03892WpziX/c3oYROl4ws9xioDClbbh4Yw5j3IPN8ibYD3dgF+Ek0do/sz
         uc2g==
X-Gm-Message-State: AOAM530Tgki0Li0vPksoZ1LPy3XGwLpvOSPKSRsSVt8n2xlrg7j5s9IN
        2rt2tZJgJvsT6Ybd6WfpKTfdj1YkO9At
X-Google-Smtp-Source: ABdhPJwhV5Ka0bq0Atr7uO5myqhFwKRA4fz+GSInT/He1TD10XiQ4javTnVT3LBOtwlLJTJeGeM8D73sgMjY
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:f96a:1dc6:88d5:6b7c])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:90b:: with SMTP id
 dj11mr3054173qvb.52.1615952612400; Tue, 16 Mar 2021 20:43:32 -0700 (PDT)
Date:   Wed, 17 Mar 2021 11:43:11 +0800
Message-Id: <20210317034311.2281708-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, tzungbi@google.com,
        Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DEVAPC (device access permission control) is a MPU (memory protection
unit) in MT8192.

To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
domain 3.  ATF (Arm trusted firmware) should setup memory range for the
domain.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 2 ++
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 61901f5efa05..2aa9fdf5e59b 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,8 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8192_SCP_DEVAPC_DOMAIN	0x85080
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..50bdec5a97e3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -374,6 +374,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
+	/* set to DEVAPC (device access permission control) domain 3 */
+	writel(3, scp->reg_base + MT8192_SCP_DEVAPC_DOMAIN);
+
 	return 0;
 }
 
-- 
2.31.0.rc2.261.g7f71774620-goog

