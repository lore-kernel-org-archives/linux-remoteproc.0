Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8275FC4363A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 03:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDC220838
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 03:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVy3cd1d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgJ3Dr6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Oct 2020 23:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3Dr5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Oct 2020 23:47:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6A8C0613CF;
        Thu, 29 Oct 2020 20:47:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g12so4064632pgm.8;
        Thu, 29 Oct 2020 20:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pu6SkmJfdZiNGR7CU5WnbayuT7AOpBefhlB5Tkwk5xc=;
        b=TVy3cd1dgGNGl6yfNDkfIAHZ0NL8beVKGrgTAWi7hkv+0jlO7A0jXHWF+jnAkRXzKF
         jcd0ISyPrGAXx/3PvlFXugFL8C6sdJJGU1x/nn8w+XWH+vrfxC6SHt7pP7fV5aSiqjeN
         4ERlJ6UsYaKMIYCsIyIHoGMrhkuohO6RaVaK9NXnkkMidvtg2+vyOqtckHauUq7T91uf
         dxN1U2UUY/qdNP/oL/zODs9iqrMeSC1sxagsdD8ulsbjuzBxT9cT/kNo6QXEQrFAfJ0V
         bSOTqpxW+txj50sbw3B3/DTl/aQg3/AjuV49NnZOKWi8rehes2XS6w3mmVeKdEjxoNYn
         cUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pu6SkmJfdZiNGR7CU5WnbayuT7AOpBefhlB5Tkwk5xc=;
        b=gXdUcWB2OtKLeNvi3lSgkc26TuraWwF/rTj8CXrvSCMJR9NWmYOgpRGb6KAPhz3Fnr
         WX5IPBSYE3NDInXnEB5VxDvwI2vq66BIIHOiLfxtVV/YoP0WOT/A5DCmTdhElL8kRx7c
         fUBTp7C3Jl57L+ir/sHPKUF3K9JnE/5Ulx57rClW5WRg+aZGL+RzyEfbGh04PcUNzGOq
         qcE/xR/wACeSV2NrZXDEoFcbs5hVw9ylCCIt2CW5fG1FXYjgSE/qhYdVJPYl37ZlzwcO
         jX0ImpEknwPml8pwbWu+SJYhFKwCRpSRm2mVJznDA6EkqR8ehpuaUmEA3JvcsOA3IY1S
         zxCA==
X-Gm-Message-State: AOAM532TrhB5n2yxeWqtUaonevBZ+e4wij4CkG3YNa3LasWGuu/fcMhd
        vIDIT/eH81v583dzicF5YXvNEIQzGBU=
X-Google-Smtp-Source: ABdhPJzZlgmgsMwButX+90yazphawW+h01P1aUNi5yLvFtzFTC8QeUD0pwRKTF+dxqEX+ceEwqvnfA==
X-Received: by 2002:a63:6c6:: with SMTP id 189mr448872pgg.133.1604029677223;
        Thu, 29 Oct 2020 20:47:57 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f21sm4323093pfn.173.2020.10.29.20.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 20:47:56 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH v2 1/2] hwspinlock: sprd: fixed warning of unused variable 'sprd_hwspinlock_of_match'
Date:   Fri, 30 Oct 2020 11:46:53 +0800
Message-Id: <20201030034654.15775-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030034654.15775-1-zhang.lyra@gmail.com>
References: <20201030034654.15775-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

The macro function of_match_ptr() is NULL if CONFIG_OF is not set, then
Clang compiler would complain the of_device_id variable is unused.

But using of_match_ptr() is space saving, for this case, the unused structure
'sprd_hwspinlock_of_match' would be not built into symbol table if CONFIG_OF
is not set, probably depends on the compiler though.

So adding __maybe_unsed seems a good approach to fix this warning.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: d8c8bbbb1aba ("hwspinlock: sprd: Add hardware spinlock driver")
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/hwspinlock/sprd_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 36dc8038bbb4..4c63e2546064 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -138,7 +138,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 					 SPRD_HWLOCKS_NUM);
 }
 
-static const struct of_device_id sprd_hwspinlock_of_match[] = {
+static const __maybe_unused struct of_device_id sprd_hwspinlock_of_match[] = {
 	{ .compatible = "sprd,hwspinlock-r3p0", },
 	{ /* sentinel */ }
 };
-- 
2.20.1

