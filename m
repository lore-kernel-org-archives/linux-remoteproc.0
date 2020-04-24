Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3A4C54FCB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4524A214AF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xh2v5zI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbgDXUZJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbgDXUZI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:08 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DAEC09B04A
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x26so5148703pgc.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2iTWW4nO5SL6In2uagzPcw9ivsY9NbY9ua5sw1Z8YY=;
        b=Xh2v5zI/BaXOCyJfw0q7LclyWcz17VcHHRAtRtzAcWv4MREiZiUr1J57Qh4LJD8BbF
         xVMrr3t30yanDFyJWCs1QAlhVVOPRQE1Ayy8l+zkS5hsvfZBhqo64LotHv+13vShH52s
         wv70aHtI8AK4YzwCCPu1bRvf4t3gI0y3Gg+gu0cfcOukzcvEoZvDZK3qlFeucEIz5Xoa
         p9UPO8xv7uLv96Kr6yUS5T/DFvplz/q3gISrhvhd2RZMX+4ccKZkW0qJpKovw4Wfxlaq
         OsHB6DdRPFDTnyMA+I0y/d1mIUtmQUeUj9fgAF7r7U7fJfvPQXzbE8lz7nSADY6zUtDu
         insA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2iTWW4nO5SL6In2uagzPcw9ivsY9NbY9ua5sw1Z8YY=;
        b=LowMJz5mU5pUVQpJ3uEvDS0KUl1898deyNTliqfxhsYl/7/q4uvXh5L4uXs63Xy5mF
         5EBxjCNGMU+g6BLnRrJDUZz4dgmDYNaYdgLw+YLI4D8gSH6Gsfd6hqZ0DeIiPAIkNJhM
         TAE8hvAkjW4zcL+MkYps3DZ/Gxnc1oDBeMWOYpVlwC4yd++q7sbbxkScRUp/0IeW9fwy
         tqSp5WGr2wphNs8qGqRNVdqYHFtrUWt4oS1aHPCx5OhxRDjXlj4olqbPQx6X0Djf0ief
         dazpuzdJYapHezZZFFf5W49YudFq3vtWWGpuc1EQVHaaNJjP+2nZABpy+GpIWd8ODYxR
         N5uA==
X-Gm-Message-State: AGi0PuY2K0NDWKZo64RXE2jUIEAnheTfS6v1HNnfx+j/nztqhwVneqSX
        XOye8NRSbt3Z3Mj+wmk4P3VoUw==
X-Google-Smtp-Source: APiQypJDYCDbHcowl3s80XHCz3TTRatT6q2ZhtMCaPAqLRA3rMW4yZfkqAlnuY7yy/eBSoya9iCBlw==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr9509922pgm.171.1587759908429;
        Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/12] remoteproc: stm32: Decouple rproc from memory translation
Date:   Fri, 24 Apr 2020 14:24:54 -0600
Message-Id: <20200424202505.29562-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remote processor from the process of parsing the memory
ranges since there is no correlation between them.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0f9d02ca4f5a..91fd59af0ffe 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_of_memory_translations(struct rproc *rproc)
+static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
+					      struct stm32_rproc *ddata)
 {
-	struct device *parent, *dev = rproc->dev.parent;
-	struct stm32_rproc *ddata = rproc->priv;
+	struct device *parent, *dev = &pdev->dev;
 	struct device_node *np;
 	struct stm32_rproc_mem *p_mems;
 	struct stm32_rproc_mem_ranges *mem_range;
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.20.1

