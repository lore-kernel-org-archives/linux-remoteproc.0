Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39A7C43381
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 00:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8639E64F95
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 00:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhCLAXw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 19:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCLAXi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 19:23:38 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6120AC061761
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 16:23:38 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 75so2745567otn.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 16:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7aT/J1LFmtvLKFcXjPBW6z31sGa88GVVAsq4gij9cI=;
        b=Dn5GJHIGdDBFWjBqycALa2+mx50GxHOB8uWp3ohF+lpu1lrM04eZO8HaUQORjTFXzF
         iPinfDZIf4QhZEdJRlcwYJHOmytJ25wC5hxCK8f1Tsm9YyRm8idvLETOkQBjAOmp7ffO
         0ViTC1hX8AlxyqTumScYmdexvO+2IEUL1YG6rzg3fM59ln5rZKNtqPGZHxby5PPpsWhB
         vYRqnSl1cNC+R+XTjwNJlFeMBrTdZ1mlFIdmyTEq+00kMQ2lYM8XCn8sCKbGaj/+VTMh
         FGn/T4+b2f3rkFYwiI9Q+220DwE9Ek1MMnvmcfWfKrgSa8M9cAIBkSoTe4/hBSgodidh
         fYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7aT/J1LFmtvLKFcXjPBW6z31sGa88GVVAsq4gij9cI=;
        b=Tc9XMoQNMMvuYFfDeSW2sybHImY6HeqbSI24yji9Olmny2KNlF7D8hY5eYjXyUDtXY
         /yRyUMB38XkZPGqCxF2M4KSWoUHHA4txAIsPIQqu1/UzOJvTTSRpdfikS6CMzc9vC/h3
         /R2rvOE265hiHmcHA2QM+NBXuzhzkhnJLHYcn3ZO+BSqi6QYIfAFMKoBdGFatb3Bg2tS
         pI02ntepi9UYjDUd4r8EwQb7SLWbLTWB1e2MBQOANTqjRgWSnMRdzIvJcL+uK2knKBqy
         r6MIxHmyKIZTxjXau+DvUItM7pLNAseh5QJ/j/em7Zc0M8kFIvHS44kqBFmpDb4Z6XBV
         2xRA==
X-Gm-Message-State: AOAM532FD8d12QnxWA+gagQG+tfLsPF+KlcGVZh5ZbtZ1ETrXdKcPHHg
        umnchPW+7yuRQLqMLk9PCB5tOA==
X-Google-Smtp-Source: ABdhPJyKq/vY0N41x7OuC1EarDrRQ9SAJlH1Wyv2qeZEniJ4lH/ZVcEnUtNwvCEzNRKEsQVdfEDssQ==
X-Received: by 2002:a9d:53c5:: with SMTP id i5mr1189218oth.159.1615508617666;
        Thu, 11 Mar 2021 16:23:37 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h2sm994460otn.43.2021.03.11.16.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:23:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Thu, 11 Mar 2021 16:24:41 -0800
Message-Id: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased patch
- Added default filename to the definition

 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index da09c0d79ac0..a83080b8905c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core. Defaults to "wcnss.mdt".
+
 - vddmx-supply: (deprecated for qcom,pronto-v1/2-pil)
 - vddcx-supply: (deprecated for qcom,pronto-v1/2-pil)
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 2a6a23cb14ca..e8007cc01bfa 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -530,6 +530,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -547,8 +548,13 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
-			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
+			    fw_name, sizeof(*wcnss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
-- 
2.29.2

