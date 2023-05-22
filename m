Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89347C7EE26
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 May 2023 07:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjEVHsu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 May 2023 03:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbjEVHsa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 May 2023 03:48:30 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172F4B9
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 May 2023 00:47:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30a4ebbda56so1655470f8f.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 May 2023 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741576; x=1687333576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
        b=aJRU56KCSo3rpIlXDTIxgutOm21kKy4pCK66q+4n23HGRVPpaHZ5t/IbiMDcg7xCuv
         4GCem5qCSVC6EYh9WGOI8/10GlUS5tuxOR2nUWxbeeJF167/MDDiSn4dWSw0S+LLy31t
         CF/ABoFrh40zfGyBbPC+qXy3UqY4m4fe6+D/rlof4kyKWHt2VEZRsXwcoONP6Dheffpk
         BbXo0EkS57WXREeM5uUaCQh+FhxLv2bVH34MMgZRF7x01Sj2FVKrqsB9bLYAK8y8+o74
         LSFCN5M2zDH3pSfwQpdZPksdF7Cs7/6XzjjGKsqE2zouxyHOWZNyA4v9LbT7x5WN9ET+
         NcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741576; x=1687333576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
        b=LPSTPIeyOMU5nrTE8LdQD58NtEqzdaKEj42XWkz+QWrRwXHStFM78rqf6k79brh3b+
         3Vq6FSdnXDVFx6v8eH/8032KA1a0RjxEaDfIpVSZ+rPBmBfxmzOY4cQVdLf7UrLpWKYv
         YQtBT1L9l70ndXuf6xWEPCA3cSTCdaQgAy4s5oSBJtNLCb4o4CyR+l0tduCvpiVkm0Gs
         L9YCpustBA5vx5PL9e72BLsu6g9TYOWvL+nen4DZgia1NMLufpvP0SWFBtuei2IcJcZL
         pUfRHmPzv6IVqM5miO8t0hT4UMdPUz37Qe0ASj/pWOfr/sIoloB5jNGh6uUhiiRWNxLg
         rIwg==
X-Gm-Message-State: AC+VfDz6hTH8VQuVs+N0SKwKgvYSzXh1aJF1H25x2eJX5kbiKHvTlzHe
        eae1x9buNgcZIGPYcpSRK0sihw==
X-Google-Smtp-Source: ACHHUZ5WPY0s+puoCLwPIv3+dZIthZntG1qO8mejkYgqwA0xER2gHbAwLfhkvLu0SZTyKxPKdCZmfw==
X-Received: by 2002:adf:de10:0:b0:306:2dd6:95d3 with SMTP id b16-20020adfde10000000b003062dd695d3mr8301383wrm.22.1684741576394;
        Mon, 22 May 2023 00:46:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d53c2000000b002ffbf2213d4sm6816964wrw.75.2023.05.22.00.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:46:15 -0700 (PDT)
Date:   Mon, 22 May 2023 10:46:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: stm32: Fix error code in stm32_rproc_parse_dt()
Message-ID: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is a cut and paste bug so this code was returning the wrong
variable.  It should have been "ddata->hold_boot_rst" instead of
"ddata->rst".

Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0e322697d210..a7457777aae4 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
 	if (IS_ERR(ddata->hold_boot_rst))
-		return dev_err_probe(dev, PTR_ERR(ddata->rst),
+		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
 				     "failed to get hold_boot reset\n");
 
 	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
-- 
2.39.2

