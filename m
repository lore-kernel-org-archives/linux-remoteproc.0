Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DA0C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sun,  1 May 2022 10:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344576AbiEAKjN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 1 May 2022 06:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345417AbiEAKjB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 1 May 2022 06:39:01 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D986C0B
        for <linux-remoteproc@vger.kernel.org>; Sun,  1 May 2022 03:35:34 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so13696361ede.8
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 May 2022 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LSWa1hQdoTzioWCbWfTtV4IOIT9RSgkMC0aJIZAhKE=;
        b=sPkfVotvDIXhLsObMkJpjRsPJqzNemWS52CcpizWKGwTcuI2isWrGDfOYWzljPIwWV
         HIye0z2DwsI6SMQP5nl1kFnmiawxdVbmPK/uwFSLTDRrsIfooTCMFJ4ihXjDfeZ2pZUC
         jBpUim2GPIzNxEuh5/Z2CLUxXca3yMPVPZsss8Xu2jkTpaHnVe14Blhmuk0C6q6/zGEX
         YhSEzRxFVZqTBF3maWG3kvfVsRgC3aHPfU51S3YHSv3NZ3195B1eeCb8k/hzXK/rfMuK
         hqf10wRDjEm8foKAsbAbPnsZLBEs5+hm69TwdW66tVb4Vu0Cj2kqJ6Vm5DITnsYFqKhp
         bCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LSWa1hQdoTzioWCbWfTtV4IOIT9RSgkMC0aJIZAhKE=;
        b=YXG3FWWY4guhVe6I8TjKf6ld1GOJN61y655FCfBblnNhu2tczfmwIZiCIIrdLY4wE1
         SclhqGZP0s8iPC0jKD+0BRY5fM6zp4iH/qlVHv3NXadpzdLGg67pUbNn5zkAeOhw3lR/
         t2skItLh7XF1wXNFytR12JhXwJ0+yoEuZhRkO2oxP+lJqxLBbb/jKnXlVLQsi0YBnmF5
         Py9pGDfBiePpjwDCfMn+dePLqhIIJkEakRfxaw9BltcW3zFvDYXSgC8R6VQOqtcI3UvA
         Eh0KfDPNJ377atb8WrYUah/wIK3qBRBu/7NlEWq1rC0KpRirnbxx1RHzOycHxHTfa7ih
         jylg==
X-Gm-Message-State: AOAM531+l0K11WAU8UGMt0P9c93RlUmjiM/LE+IF7uWHoGyJ7aQoXfSZ
        Hpx193tnMwUXOkg8MV2b3WwnGSXlgISCpg==
X-Google-Smtp-Source: ABdhPJwLrbsl6NqHFpbmWGvgSLWCqc0KwZS8CYztYMsY51fM7uVTperdxPLK4DFj74a5ODizeCxaCA==
X-Received: by 2002:a05:6402:298b:b0:41d:675f:8b44 with SMTP id eq11-20020a056402298b00b0041d675f8b44mr8131185edb.377.1651401332808;
        Sun, 01 May 2022 03:35:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] rpmsg: qcom: glink: remove unused name
Date:   Sun,  1 May 2022 12:35:17 +0200
Message-Id: <20220501103520.111561-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The qcom_glink.name is read from DTS but never used further, never
referenced, so drop it.  This also fixes kerneldoc warning:

  drivers/rpmsg/qcom_glink_native.c:125:
    warning: Function parameter or member 'name' not described in 'qcom_glink'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 5bc5a0a6a8a7..72a1c0fd091d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -98,8 +98,6 @@ struct glink_core_rx_intent {
 struct qcom_glink {
 	struct device *dev;
 
-	const char *name;
-
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox_chan;
 
@@ -1755,10 +1753,6 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		dev_err(dev, "failed to add groups\n");
 
-	ret = of_property_read_string(dev->of_node, "label", &glink->name);
-	if (ret < 0)
-		glink->name = dev->of_node->name;
-
 	glink->mbox_client.dev = dev;
 	glink->mbox_client.knows_txdone = true;
 	glink->mbox_chan = mbox_request_channel(&glink->mbox_client, 0);
-- 
2.32.0

