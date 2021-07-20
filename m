Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30A0C636C8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 04:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E03816120A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 04:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348701AbhGTEBM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Jul 2021 00:01:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38446 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347596AbhGTD7B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Jul 2021 23:59:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626755980; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ja0ch2BKFqV8Z+kWiGBFMXL83Jhiecq8a/U0GuvQfuI=; b=ig1ikx1XfAT972EPWEENJ4CNgzF+E4G4rAqsRMKwzkQGe5gzuTvXE+kZf0h/rXSKiw8/xuZa
 q9aAK4gRbxrqpunTYN8h7E0/mzbYp8NKn86Zh+B/0ess4s5fKun9Odahj21cl4/HfFoW3V4a
 Y8ywgpVVmqahhNLUWxD5RmfaxhA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f6536856871ded7738df63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 04:39:04
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CFEBC433D3; Tue, 20 Jul 2021 04:39:03 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84E89C4323A;
        Tue, 20 Jul 2021 04:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84E89C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
Date:   Tue, 20 Jul 2021 10:06:47 +0530
Message-Id: <1626755807-11865-14-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
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

