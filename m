Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBCDC4742C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 04:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74DA92083B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 04:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCL6DA3P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbgKEEuk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 23:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730986AbgKEEuf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 23:50:35 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71DFC0613CF
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 20:50:35 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id j6so127980oot.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 20:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rkVPfPXhshaukUCMauMgnylUImITZ+1YVILqFo4Qmt8=;
        b=qCL6DA3P2yHRwk3ltNkvjsvo01LdCn/n8WIEQp1D2XSx3n7ejscKF7XVTDSbGRL8Yw
         pv9p3TxfK1aeisN4bJOHu5prWSC4G25cR18n5cvHQIeAbSAJuDrELKNuaUYnHpX9WPPI
         Hb5j4E5XisP8RgNvSCAoZaf69DCpmdZN/19DlyNMaVoWOduMqzJSqgeArp3ecOOpHrEE
         PrCdUsV9+K1+wPQUlKaA95b7yC4mP724i2NUY5W/JEgQUb+/RUKc/Ryr/OEInsDyQeML
         /SCVv9veXdrIOIiMIcy9uIPgJPQhnGVObv0gCUifMNge7+FlaIbRooi1xBkOxj1hWchN
         Uvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rkVPfPXhshaukUCMauMgnylUImITZ+1YVILqFo4Qmt8=;
        b=TE5CxlIBdEt1uqu27EZIUGWs7fYNxnq3UohpyUdLASIOcz6FcqB7XclxvVLkPyAaEx
         Ck1tiYmCXn5t/m+lwtor/kjxuTVGVi5l4jpCscm6OEPMyOm+ThIQPpVfaSJCVexfUbaf
         2Y03YzbJ0+GJvT1/BBOV+liSxKAZcITkzswTlOO/WN0zjP+IwkIyIjWfpPTYyAvXtFQH
         9NRUCJD2q53TRiML2NTqPQk8Kk0r3lmIZn+/REp44eSOYAqX6QszJ3IseZkVFGu1sPl8
         ppOcHo+wwTTwmV9ZCKXRVN01WBoT4o6d77Yr44r9VFuABdndeCllTgoh1obC/nJKjUBf
         OKGg==
X-Gm-Message-State: AOAM533M7nkxLrof2Z2h9hzh5iqQFj6XovYD0j7Resf92PHWvOndUgVR
        P5h4DYKGGixlyxzo6HRxDsCx6g==
X-Google-Smtp-Source: ABdhPJymPbjeOprNtaxPp1W80QiilQg2qTlH5qqrfCx3DneU9oOQDfVxhbXUe3DfaOvFHsnRkoVR5Q==
X-Received: by 2002:a4a:1d03:: with SMTP id 3mr534295oog.19.1604551835201;
        Wed, 04 Nov 2020 20:50:35 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm100553ooi.41.2020.11.04.20.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:50:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] remoteproc: sysmon: Improve error messages
Date:   Wed,  4 Nov 2020 20:50:51 -0800
Message-Id: <20201105045051.1365780-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Improve the style of a few of the error messages printed by the sysmon
implementation and fix the copy-pasted shutdown error in the send-event
function.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/remoteproc/qcom_sysmon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 1c42f00010d3..47683932512a 100644
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

