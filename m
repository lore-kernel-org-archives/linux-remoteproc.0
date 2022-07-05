Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589C1CCA47B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jul 2022 12:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbiGEMJV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jul 2022 08:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbiGEMIs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jul 2022 08:08:48 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E14310;
        Tue,  5 Jul 2022 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657022919; x=1688558919;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=JX4CqpG131f0B16O13AOq1/dT80ue2EUWs1TLwPquUY=;
  b=ZMPqufs8mnni+HSUvbhQ93KsIeFtwKgXdEqpmUE59hrLpQw3sMu41mrG
   AXiJrWi+7GOVyjutg6ZxGco2VSBRUUGyN2RCORDJCvOsbXmi/psBqkDF9
   YkERp/hqivfzG1Nd7J2KcPHvp5Rp5JE2Q1NsuJXtpIdSxsWcuQ9ZZ2N+T
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Jul 2022 05:08:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 05:08:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 05:08:38 -0700
Received: from blr-ubuntu-87.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 05:08:35 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <mathieu.poirier@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konrad.dybcio@somainline.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [V3 0/7] Miscellaneous PAS fixes
Date:   Tue, 5 Jul 2022 17:38:13 +0530
Message-ID: <1657022900-2049-1-git-send-email-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

A collection of misc. fixes for the remoteproc PAS and sysmon driver.

V3:
 * Fixup misc. suggestions and rename to adsp_shutdown_poll_decrypt() [Bjorn]
 * Pick up another lone sysmon fix from the list with R-b.

V2:
 * Add misc. sysmon fix.
 * Dropping patch 1 and 6 from V1.

Sibi Sankar (2):
  remoteproc: qcom: pas: Add decrypt shutdown support for modem
  remoteproc: sysmon: Wait for SSCTL service to come up

Siddharth Gupta (5):
  remoteproc: qcom: pas: Mark va as io memory
  remoteproc: qcom: pas: Mark devices as wakeup capable
  remoteproc: qcom: pas: Check if coredump is enabled
  remoteproc: q6v5: Set q6 state to offline on receiving wdog irq
  remoteproc: sysmon: Send sysmon state only for running rprocs

 drivers/remoteproc/qcom_q6v5.c     |  4 +++
 drivers/remoteproc/qcom_q6v5_pas.c | 53 ++++++++++++++++++++++++++++++++++++--
 drivers/remoteproc/qcom_sysmon.c   | 16 ++++++++++--
 3 files changed, 69 insertions(+), 4 deletions(-)

-- 
2.7.4

