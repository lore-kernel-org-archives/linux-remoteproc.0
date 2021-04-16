Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EE1C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 12:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8574611AB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 12:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238696AbhDPMEn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 08:04:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42727 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237596AbhDPMEk (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 08:04:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618574655; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2ykfzo43bdfME6vikSYhWqnN90ERJ9J2e6T9baSKjWE=; b=EOIuLZdn5am7faWeixIcDLkrRvryTNlEeG7k6ENyecdY0amOuCQgGwFQ/h/RVQJw8JBLbVKo
 mxQOOX0LRlB76blbg0nYYaaiWJkh7Rnjif63ju2Cx2po16WFiWGd6T/urh45HqN4D7cyz9pF
 f6oqK4xkZ/WOkvnfHyxSggTsB+o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60797d3ce0e9c9a6b658fcb0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 12:04:12
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED746C43462; Fri, 16 Apr 2021 12:04:11 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB914C433C6;
        Fri, 16 Apr 2021 12:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB914C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, swboyd@chromium.org
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 00/12] Use qmp_send to update co-processor load state
Date:   Fri, 16 Apr 2021 17:33:46 +0530
Message-Id: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The power domains exposed by the AOSS QMP driver control the load state
resources linked to modem, adsp, cdsp remoteprocs. These are used to
notify the Always on Subsystem (AOSS) that a particular co-processor is
up/down. AOSS uses this information to wait for the co-processors to
suspend before starting its sleep sequence. These co-processors enter
low-power modes independent to that of the application processor and
the load state resources linked to them are expected to remain unaltered
across system suspend/resume cycles. To achieve this behavior lets stop
modeling them as power-domains and replace them with generic qmp_send
interface instead.

https://lore.kernel.org/lkml/20200913034603.GV3715@yoga/
Previous dicussion on dropping power-domain support from AOSS QMP driver

https://lore.kernel.org/lkml/1617943188-23278-2-git-send-email-deesin@qti.qualcomm.com/
Depends on ^^

Sibi Sankar (12):
  dt-bindings: soc: qcom: aoss: Drop power-domain bindings
  soc: qcom: aoss: Drop power domain support
  dt-bindings: remoteproc: qcom: pas: Add QMP bindings
  dt-bindings: remoteproc: qcom: Add QMP bindings
  remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state
  arm64: dts: qcom: sc7180: Use QMP binding to control load state
  arm64: dts: qcom: sc7280: Use QMP binding to control load state
  arm64: dts: qcom: sdm845: Use QMP binding to control load state
  arm64: dts: qcom: sm8150: Use QMP binding to control load state
  arm64: dts: qcom: sm8250: Use QMP binding to control load state
  arm64: dts: qcom: sm8350: Use QMP binding to control load state
  dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  11 ++-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  16 +--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  28 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  22 ++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  30 +++---
 drivers/remoteproc/qcom_q6v5.c                     |  57 ++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |   7 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   7 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  44 ++-------
 drivers/remoteproc/qcom_q6v5_pas.c                 |  80 ++++-----------
 drivers/remoteproc/qcom_q6v5_wcss.c                |   4 +-
 drivers/soc/qcom/qcom_aoss.c                       | 109 +--------------------
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 ---
 17 files changed, 163 insertions(+), 292 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

