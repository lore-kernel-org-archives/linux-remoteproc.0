Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0236CC4332E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D084923715
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbhAGXf3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 18:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbhAGXf3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 18:35:29 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39BFC061285
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 15:34:11 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id q137so7899926iod.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 15:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXvh8jYOYWtdC8QC3OBzUsPQ0KcpblQhbm1OQDC0Ass=;
        b=hLK246czR6y41dWnJ6Ykv8dKD3cB3MKIt1vxoKGRLQ/bwq8kBn6gf4SpnQu+kt7cMS
         GiWFB68A7v+bYEY03QRvwTctkQRPf8OgL2pUkcFhWJ5aYG0ZJfVAvmPwIy/yf4uyOqLz
         S3Jo/Usapg5IfpOar/YJFys0OfIDH4pnHtm+7215amwMkvhwPVL8+NVAQyChpeF5bNkz
         0nFyavqBsnytWpnH3OtL2NqLji1SZ0d5tT/RIUOAcUYrxxY4zygh7Db4KwsKMGzGaU0a
         2lhe/nX/rePRZ7E42VA+Zlt/AyCah2l8rudzPBmTdaSl41ZZEQvg2E1hirPbd1iEC1iT
         JrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXvh8jYOYWtdC8QC3OBzUsPQ0KcpblQhbm1OQDC0Ass=;
        b=eD3dogajHMvUX0hauESKr8KA7As0O2oWjeDAFQiaUWT7Aglno8k20VQ9zrBBTRE8My
         pI+j0xtg+H7uUZ59UGU3PF+01tcKRnTFVk2RvI6bxfs10SRe4hj8U099xRWQSDqkDr83
         BwLSyOBn+83KexNXJ3VmS7drTeRyalKpZbzbuFqq2o8KhNW3I/XhGW6ewomHSqe4jLPw
         qDCX/iylCjKxqQqaKEZhtxrRw3XzF87G20jNmacHIroFMwZ6NFp67tKmmAN+M3AP4i+V
         3BPEhk6Yh/b1kVUg7DfDdRwmOAx8ZiBGwXmCN9gR+Yo5d4PjUFEDXNuKn9mn889Gg+Ih
         Ijjw==
X-Gm-Message-State: AOAM531AopTQXU/UzEirvyUxYbRKRJVy5pCNYdz3iwUc6CYfXB8qDnvG
        ramxBmgBni550dFPMd/L//NpVA==
X-Google-Smtp-Source: ABdhPJxJSgiPtz+sh9VkfGJzoQQQOw3sDE8aSzL2A8Ep/tM98HlIWU98VvYmIVawQg32aW2ffIfStg==
X-Received: by 2002:a6b:6f09:: with SMTP id k9mr3230986ioc.30.1610062451444;
        Thu, 07 Jan 2021 15:34:11 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o195sm5648521ila.38.2021.01.07.15.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:34:10 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, lkp@intel.com, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/4] net: ipa: declare the page pointer type in "gsi_trans.h"
Date:   Thu,  7 Jan 2021 17:34:03 -0600
Message-Id: <20210107233404.17030-4-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107233404.17030-1-elder@linaro.org>
References: <20210107233404.17030-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The second argument to gsi_trans_page_add() is a page pointer.
That declaration is found in header files used by "gsi_trans.h" for
(at least) arm64 and x86 builds, but apparently not for alpha
builds.

Fix this by adding a declaration of struct page to the top of
"gsi_trans.h".

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi_trans.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ipa/gsi_trans.h b/drivers/net/ipa/gsi_trans.h
index 4d4606b5fa951..3a4ab8a94d827 100644
--- a/drivers/net/ipa/gsi_trans.h
+++ b/drivers/net/ipa/gsi_trans.h
@@ -13,6 +13,7 @@
 
 #include "ipa_cmd.h"
 
+struct page;
 struct scatterlist;
 struct device;
 struct sk_buff;
-- 
2.20.1

