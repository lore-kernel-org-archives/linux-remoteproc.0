Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FCDC433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 07:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbiESHdm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 03:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234789AbiESHdl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:33:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718E1939B1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v8so5665767lfd.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWPTFii076kMh3spx07UDdhkutNF23nYc3TRhpsUjGU=;
        b=J7PQfDdwXyofHLtaxdaRupP6u/eH6BP2lL2t+Fqq+Q0MciM7VFeqt7k9dATO4OYp3J
         LKObqclwxes4bhLdMUyIz24QoTikkBTrlIw2CJ5milvwEvvuePVK7ljo0+xHlR/8NNFY
         /jC4ZxVcnZzr2rbsEeZUGqiw795MQSbQXLjH8FXzs/2IkfiFs1wap0sbzRu42mzTSBeP
         ZVN+nMj5KGWBCQc+L8cPOn92IPSD3zeHHGVSE4ladEqXQekTPNwlEaXUHcr0Y59B5f6R
         fuoSLnjigKl1Z37AwIPEYIZl98GZ66xc0PCQrbADlA+VBfAx3XB6K7tv2ROV+LqfAmbV
         7TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWPTFii076kMh3spx07UDdhkutNF23nYc3TRhpsUjGU=;
        b=oVDV4a/Fld+oCCW3EuXuy9ibxk0BhR64qAAEhNabnY7qftEjipabp7qkF+wd3X7E5T
         QqweVj0MDTd0IIUtbSFnWbQuqYGeQb3Po7DaKRvkM3KzYAbiPjoVEEZlFDKihFxWqVWW
         nQ5r1opjcPDSuJqXQfKRmz4q9Qqb4L+jziK++t7wpH/S1WzCz74gueQZf4ohGEdheXaH
         aDWD9gqTCPpPMvoPMq88CIrC0wfZrpmkjhYpMKhEhPed7AxACAVtt4G+YnmmMUbPzWcr
         dZ2W2nS4dKAJXMT0wOyUAgSWUo+CI9RA8CPfKiHRSh6/VYzLNek5klqrrTHf8mxkjZnv
         H9Vw==
X-Gm-Message-State: AOAM530LXcmq8yiGW5Aedt6lW7Lqs5xKuumElcC8y34JSpBvnpUGa4c7
        bYRU/0c5hTeBi5xEylkJgZx+JQ==
X-Google-Smtp-Source: ABdhPJyZnvswo5nLJZ+ZWjSAifqug4KpIFoaZsRIfX0IUXe8RU4GMwQ2xYnT/pIqdk0DsfJh8Beyng==
X-Received: by 2002:a05:6512:1051:b0:473:b70c:941a with SMTP id c17-20020a056512105100b00473b70c941amr2364085lfb.238.1652945614854;
        Thu, 19 May 2022 00:33:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512201000b0047255d21159sm187484lfb.136.2022.05.19.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] rpmsg: qcom: glink: remove unused name
Date:   Thu, 19 May 2022 09:33:29 +0200
Message-Id: <20220519073330.7187-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
References: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
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

