Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail26.static.mailgun.info ([104.130.122.26]:44449 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371005AbgDOOvd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 10:51:33 -0400
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/2] Drop all accesses to MPSS PERPH register space
Date: Wed, 15 Apr 2020 20:21:08 +0530
Message-Id: <20200415145110.20624-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

7C retail devices using MSA based boot will result in a fuse combination
which will prevent accesses to MSS PERPH register space where the mpss
clocks and halt-nav reside. Hence requesting a halt-nav as part of the
SSR sequence will result in a NoC error. Issuing HALT NAV request and
turning on the mss clocks as part of SSR will no longer be required
since the modem firmware will have the necessary fixes to ensure that
there are no pending NAV DMA transactions thereby ensuring a smooth
SSR.

Sibi Sankar (2):
  dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
  remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space

 .../bindings/remoteproc/qcom,q6v5.txt         |  14 +--
 drivers/remoteproc/qcom_q6v5_mss.c            | 102 ++++--------------
 2 files changed, 23 insertions(+), 93 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
