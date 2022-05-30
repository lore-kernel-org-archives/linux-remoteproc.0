Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23553C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 May 2022 06:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbiE3GXJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 May 2022 02:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbiE3GXI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 May 2022 02:23:08 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2163FB487;
        Sun, 29 May 2022 23:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653891786; x=1685427786;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=9oIW6eud+erP103BcFZJmB+I2g5gEj8lVojeYjWx5F8=;
  b=cXYPMqFGpBBJXy+dySDtpuJuvf7U3/kjcGUBPwXdLCScxVuJThyUdl6q
   CFXNWTOKqcY03yEIW5zm79FGK1p1mPxupqgs6Mblyq+cV6C5X+3N9QQ8s
   /3ilhq6YLy8s5nN4c64P6lytUYinSXJZLgb28CUNi0kFfdt/Mu5rnJwvA
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 May 2022 23:23:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 23:23:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 29 May 2022 23:23:05 -0700
Received: from blr-ubuntu-87.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 29 May 2022 23:23:01 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <mathieu.poirier@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konrad.dybcio@somainline.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [V2 0/6] Miscellaneous PAS fixes
Date:   Mon, 30 May 2022 11:52:45 +0530
Message-ID: <1653891771-17103-1-git-send-email-quic_sibis@quicinc.com>
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

V2:
 * Add misc. sysmon fix.
 * Dropping patch 1 and 6 from V1.

Sibi Sankar (1):
  remoteproc: qcom: pas: Add decrypt shutdown support for modem

Siddharth Gupta (5):
  remoteproc: qcom: pas: Mark va as io memory
  remoteproc: qcom: pas: Mark devices as wakeup capable
  remoteproc: qcom: pas: Check if coredump is enabled
  remoteproc: q6v5: Set q6 state to offline on receiving wdog irq
  remoteproc: sysmon: Send sysmon state only for running rprocs

 drivers/remoteproc/qcom_q6v5.c     |  4 ++
 drivers/remoteproc/qcom_q6v5_pas.c | 77 +++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_sysmon.c   |  6 ++-
 3 files changed, 83 insertions(+), 4 deletions(-)

-- 
2.7.4

