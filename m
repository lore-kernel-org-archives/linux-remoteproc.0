Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E064C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC9B0206E2
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtiuiNP7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgFATBW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 15:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbgFAR4D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:56:03 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E1EC05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:56:02 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q24so171575pjd.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UjRIi2EJxbL5MBHfOKyrAGQUtxoKwiBe/CM48DHAMvM=;
        b=XtiuiNP724RWlnK84qm9/l1Ohi6G22E5lgTFSt4VRQFtx4jQQi5z8CziOfBSHWV7ae
         X7tjiaz1jgwd13ysS5MS2pOV7lNtEofx5PURxUVko8WUZzwtgojiMJT6CnqCYUYM+b3z
         unMjjSsTMU6AOj8+YcFmkpy57FoXzTwuEgaIQHmPGmq3ooZNZPmuSSzOwaJnOQCXCLV1
         w9c2kcoXlePiTbsAx3Kwdm8btVOuETPx9FFjf9T8hvEgrrHFLmtS59XaQCC1h+d98LgV
         9OZkPnhaiseYjnLZt/GGkIZMAUOzyumOlm595fNYngpxtwk2K1tZJ0qCyzunV9fn9Nl9
         m8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UjRIi2EJxbL5MBHfOKyrAGQUtxoKwiBe/CM48DHAMvM=;
        b=A/GrUjtn2c5gJcdlTioXsGS/wgazXis5Ww2zO3/x3FU/0z07IsYNws9tfPFYOlyq+f
         hlyHE34zrwYwwLrNmewwxKAzYoTlgLhqR28ZfKIWRTgmig2mZ8xPY5MqBh6aSKWksp8Y
         FQ3PsxWr6GS30FbFgaCWd4t2gFx0fkq1aaqKlXiiNRFhFsSI5IPV/P1R6TgJlpsf2cny
         5JZsnj1W7dBsJCRtHg+jATd64z9u5L8INntFVcRr6NdoxI1Uw4lzH/bwWaEWokp+w1wk
         SKhB002m09NoMJEJ1hz5Hstvf++O9S5L8hoIz1bzFQIIOfcLlnW5T7pmxoLYWX91vgF0
         CvIg==
X-Gm-Message-State: AOAM530UZWr8zQDLm9rG2ZylRFIhj+CxFAIV/Azwg+LAfV7jTH5PtL1b
        jm5F0QiFNlnmyymDiWpfmME4Aw==
X-Google-Smtp-Source: ABdhPJy5nT7+CY/1aFdlTpP4oiTag5rh3vPEE5Tw3v78GbxlhWqMZA7DHmoAbLMSI6xhzJOof+CiwA==
X-Received: by 2002:a17:902:7e41:: with SMTP id a1mr20962820pln.72.1591034162457;
        Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 06/11] remoteproc: stm32: Properly set co-processor state when attaching
Date:   Mon,  1 Jun 2020 11:55:47 -0600
Message-Id: <20200601175552.22286-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce the required mechanic to set the state of the M4 in order
to properly deal with scenarios where the co-processor has been
stated by another entity.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 80fd8fd831da..2154c8b90a2a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,13 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define M4_STATE_OFF		0
+#define M4_STATE_INI		1
+#define M4_STATE_CRUN		2
+#define M4_STATE_CSTOP		3
+#define M4_STATE_STANDBY	4
+#define M4_STATE_CRASH		5
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -635,12 +642,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
+				     unsigned int *state)
+{
+	/* See stm32_rproc_parse_dt() */
+	if (!ddata->m4_state.map) {
+		/*
+		 * We couldn't get the coprocessor's state, assume
+		 * it is not running.
+		 */
+		state = M4_STATE_OFF;
+		return 0;
+	}
+
+	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
+}
+
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	unsigned int state;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -663,6 +688,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_get_m4_status(ddata, &state);
+	if (ret)
+		goto free_rproc;
+
+	if (state == M4_STATE_CRUN)
+		rproc->state = RPROC_DETACHED;
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.20.1

