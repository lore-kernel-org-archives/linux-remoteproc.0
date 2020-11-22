Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC18DC64E75
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2307217A0
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0/F6IyZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgKVFlp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 00:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbgKVFli (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:38 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA990C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:37 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id y74so2480881oia.11
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvpm8U35Wi5xW8cDlkOEMWm9u3v4oYij+TGxaJn+sgw=;
        b=z0/F6IyZHUpoXEJ0ybXF0z+a2Xvsd86bf/HthIlSIfCqh4GOISDFivw9DlSAs43MUf
         KIiKAlMN1RyUIf05KNffeRroYx2MlnXI6wiQw8MoSLsIF4Vy4C8rBBmsZTyBTVpfIgrY
         1Qfoko5q9gxGU0WllYgLcIiywlvSd6LHUBv2z8VfFd8NtnwI9V0ihBcRW6jSIlYsplMQ
         8BHhmWltd/2s7hODDaApsQpF0l6uK4mKJKg7AY2COhy7o+orKDBnSoGDH/nlU1qMn3uT
         R5Xy6Ny3v4wBwutcyUM7HLDJCzXzVAni38fVw5XScvr1dca4ueAv2MG7Sz0ZxksNZZDD
         U9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvpm8U35Wi5xW8cDlkOEMWm9u3v4oYij+TGxaJn+sgw=;
        b=uHKSWkyZcQAKjT+bmZzO9vTrb19y1R29ArhBvu2gP0rAiGBenJhYYqL7l1fDP+HrVb
         mnkweuQrNnzxFIwTK7UJbQ18/e3EGa4KMQt7JQ7aDHW1WRB6LK9LRBMraKSszMqetQx8
         Tp2X736z6X2YghEOOYE7+ZEiVBLmCU+lbbjxF9oiWteF6MUgUdrwMftwBtPgQK+sjf5x
         5PHdwN3/ifJqakEnEQT5Xj5bFF78yHfEdlKc9slWKAx3W9XEMQFtYhAcBzTmT9O2lfS5
         a5DjkMFoaWYY8/coAn4UTcG0XYgN4l2aqmsX7HYHAh2zN+fMIkXJO1b6paVeURROLhSS
         AaGw==
X-Gm-Message-State: AOAM531muzPvsFbZ91CLrkbhYhnK/cl+7Y99hzE7qWX84OBFwFW0colk
        bFTtH3MogoA0OpBRmHCC/CN3SQ==
X-Google-Smtp-Source: ABdhPJxRJ6Pq2gDVZXh9XuwLH1m35Yf7+sfqi3oaKpZi2VQkh8xbuUn+pF/Kl/gQRDFRthtP79fiQA==
X-Received: by 2002:aca:a8c8:: with SMTP id r191mr11456932oie.138.1606023697312;
        Sat, 21 Nov 2020 21:41:37 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 4/4] remoteproc: sysmon: Improve error messages
Date:   Sat, 21 Nov 2020 21:41:35 -0800
Message-Id: <20201122054135.802935-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201122054135.802935-1-bjorn.andersson@linaro.org>
References: <20201122054135.802935-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Improve the style of a few of the error messages printed by the sysmon
implementation and fix the copy-pasted shutdown error in the send-event
function.

Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v2:
- None

 drivers/remoteproc/qcom_sysmon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index a428b707a6de..9fed11a2b4ba 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -352,9 +352,9 @@ static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
 	if (ret < 0) {
-		dev_err(sysmon->dev, "failed receiving QMI response\n");
+		dev_err(sysmon->dev, "timeout waiting for shutdown response\n");
 	} else if (resp.resp.result) {
-		dev_err(sysmon->dev, "shutdown request failed\n");
+		dev_err(sysmon->dev, "shutdown request rejected\n");
 	} else {
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
 		acked = true;
@@ -397,18 +397,18 @@ static void ssctl_send_event(struct qcom_sysmon *sysmon,
 			       SSCTL_SUBSYS_EVENT_REQ, 40,
 			       ssctl_subsys_event_req_ei, &req);
 	if (ret < 0) {
-		dev_err(sysmon->dev, "failed to send shutdown request\n");
+		dev_err(sysmon->dev, "failed to send subsystem event\n");
 		qmi_txn_cancel(&txn);
 		return;
 	}
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
 	if (ret < 0)
-		dev_err(sysmon->dev, "failed receiving QMI response\n");
+		dev_err(sysmon->dev, "timeout waiting for subsystem event response\n");
 	else if (resp.resp.result)
-		dev_err(sysmon->dev, "ssr event send failed\n");
+		dev_err(sysmon->dev, "subsystem event rejected\n");
 	else
-		dev_dbg(sysmon->dev, "ssr event send completed\n");
+		dev_dbg(sysmon->dev, "subsystem event accepted\n");
 }
 
 /**
-- 
2.28.0

