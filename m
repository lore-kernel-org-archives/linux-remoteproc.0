Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB77C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 31 May 2022 09:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241511AbiEaJjn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 31 May 2022 05:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiEaJjm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 May 2022 05:39:42 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9086B91589;
        Tue, 31 May 2022 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653989981; x=1685525981;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=G9ySjORkNYB0PWVlf2LDGcVhJF/OQDgJg868ZMKx8YI=;
  b=QuIx3EDU0J+XxSsLagGm8RYgO9sx3S9pKUBIInQrrSGA6/v7T7hP9/gN
   c4YlBhxJkcNKQLyERVQHb9zIh4GFeKAgf5rUIMk5CgJok75Rgyvnsp1/a
   DG0FEjmlhFKsOEQ98szpK+Kaw89z1y/85xAsyFNWYRgxs43qxW7HEsf8L
   A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2022 02:39:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:39:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 02:39:40 -0700
Received: from hu-ylal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 02:39:38 -0700
From:   Yogesh Lal <quic_ylal@quicinc.com>
To:     <bjorn.andersson@linaro.org>, <quic_sibis@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yogesh Lal <quic_ylal@quicinc.com>
Subject: [V3 0/2] Fallback to full coredump
Date:   Tue, 31 May 2022 15:09:27 +0530
Message-ID: <1653989969-26500-1-git-send-email-quic_ylal@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add support for full coredump as a fallback mechanism in
absence of minidump support.

V3:
 * Add clear out dump segment before re-populating it. 

Siddharth Gupta (2):
  remoteproc: core: Export the rproc coredump APIs
  remoteproc: qcom: Add full coredump fallback mechanism

 drivers/remoteproc/qcom_common.c         | 14 ++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c       |  1 +
 drivers/remoteproc/remoteproc_coredump.c |  2 ++
 drivers/remoteproc/remoteproc_internal.h |  4 ----
 include/linux/remoteproc.h               |  4 ++++
 5 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.7.4

