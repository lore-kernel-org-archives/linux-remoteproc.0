Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41845C4167D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 14:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26A3561284
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 14:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbhIPODT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:03:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26698 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238117AbhIPODC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Sep 2021 10:03:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631800902; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ja0ch2BKFqV8Z+kWiGBFMXL83Jhiecq8a/U0GuvQfuI=; b=fzSvBuvl5Ulp9uHKCVuk4kp5MS2sNyb/xu9IKS8/5X/HYICfuuE/ewVOKbTNnnSWAkgx71UE
 mt1Qoa8s5SZvqfMPos4a7Zg3mp7xpu1DMMskVOIYsMQb01ZgbtZsmrfemQk8C9oiSuhH+XwN
 3TaQNF813kkEGRb8nhJ2clb/YxU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61434e1cd914b05182965dab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 14:01:00
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11D9DC43617; Thu, 16 Sep 2021 14:00:58 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35FA2C43617;
        Thu, 16 Sep 2021 14:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 35FA2C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
Date:   Thu, 16 Sep 2021 19:29:30 +0530
Message-Id: <1631800770-371-14-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Delete unused power-domain definitions exposed by AOSS QMP.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 include/dt-bindings/power/qcom-aoss-qmp.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

diff --git a/include/dt-bindings/power/qcom-aoss-qmp.h b/include/dt-bindings/power/qcom-aoss-qmp.h
deleted file mode 100644
index ec336d31dee4..000000000000
--- a/include/dt-bindings/power/qcom-aoss-qmp.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, Linaro Ltd. */
-
-#ifndef __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-#define __DT_BINDINGS_POWER_QCOM_AOSS_QMP_H
-
-#define AOSS_QMP_LS_CDSP		0
-#define AOSS_QMP_LS_LPASS	1
-#define AOSS_QMP_LS_MODEM	2
-#define AOSS_QMP_LS_SLPI		3
-#define AOSS_QMP_LS_SPSS		4
-#define AOSS_QMP_LS_VENUS	5
-
-#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

