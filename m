Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22057C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 00:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8B5764F94
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 00:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCLAZa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 19:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhCLAZB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 19:25:01 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFF7C061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 16:25:01 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id x28so2735772otr.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1NdVDO8ItlMTPJ18SNyK+a0RilkRcKjF6X4ql5zLmpY=;
        b=dq/tD7Q6nCcXhNnPLw75gtYBUQCPqIIf+xTOtGP+ZPbjePnfFTOFM7J/J8bLzn100p
         en8p+dm5oReTmzl51zW9M/2rwrS8OW7fIsFSnUtyJqXN15d3T/1DdbEITWDuyYOyufNG
         oj294EHCofLeXtAxy45QYfuUqcPr9atCsIWTQ5LkSPz097zp0E6CiT3Oi30XC+4R5kSe
         b+9UeaYxq4I5NEJBUCMVW91xUmWcEr0/28keLe7hlqlAlhaKJDA4b4Ve9Zlu3ReGJ2Kd
         +62Zl5lTHP1ytqN26pN5ZzQ3w+qj8t9T6xdwILNzes5gbYZDgHgNqd9u9ySnFO7MnSTF
         1RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1NdVDO8ItlMTPJ18SNyK+a0RilkRcKjF6X4ql5zLmpY=;
        b=G7QkWY6ojuszI7hDW4LoK9OqGFqrrVwvJ6W4xiV/aVL1UgCCb47T1AIlZ5kdaCCKqp
         fbCyaM+kSKvorsoro/UJKmhFLKbfncTyNYGaB/ZOCTiOPS63PF7jn8Aw+I80DF1h5DsV
         i4F58IxsIrZMJVbnkBzOprUvxotqpKYa1tifjnWg27OmURIJw93CjIeJNlsj9YohVDSM
         /JOXrAr6R/uvcjY+n/mRbht4ZIm3o4zgRhjifpE+TOlFad0UwsI57luVhVxzT02Lg8Ku
         EHxixEMiwWlKouam+gFyU/ZDVGBZMql4AX7EPLNiHnh5RhYu08ZtCwFu11tNSv8rHZYc
         7BKw==
X-Gm-Message-State: AOAM531qU5pR6fRlg4c+Zm2s+fWaGJVGY613FPEKQ3+Cg0CpvEYXY+WN
        MriSHGqNWCFVKBY9SMzN3tn0Vg==
X-Google-Smtp-Source: ABdhPJz8SpM7A7ak878knDZAj+Ib7M0pHjwDoejGS8p9TdOLItD2ub3FrSrxElPGH2+O/D8fz3nk3w==
X-Received: by 2002:a9d:788:: with SMTP id 8mr1277709oto.197.1615508700963;
        Thu, 11 Mar 2021 16:25:00 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r20sm1016527otd.26.2021.03.11.16.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:25:00 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Provide errors for firmware-name parsing
Date:   Thu, 11 Mar 2021 16:26:05 -0800
Message-Id: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Failing to read the "firmware-name" DT property without informing the
developer is annoying, add some helpful debug prints.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 66106ba25ba3..15abfbba78d2 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1661,8 +1661,10 @@ static int q6v5_probe(struct platform_device *pdev)
 	mba_image = desc->hexagon_mba_image;
 	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
 					    0, &mba_image);
-	if (ret < 0 && ret != -EINVAL)
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(&pdev->dev, "unable to read mba firmware-name\n");
 		return ret;
+	}
 
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
 			    mba_image, sizeof(*qproc));
@@ -1680,8 +1682,10 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->hexagon_mdt_image = "modem.mdt";
 	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
 					    1, &qproc->hexagon_mdt_image);
-	if (ret < 0 && ret != -EINVAL)
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(&pdev->dev, "unable to read mpss firmware-name\n");
 		goto free_rproc;
+	}
 
 	platform_set_drvdata(pdev, qproc);
 
-- 
2.29.2

