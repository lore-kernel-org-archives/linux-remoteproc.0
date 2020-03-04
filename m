Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail26.static.mailgun.info ([104.130.122.26]:62764 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728946AbgCDTrw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Mar 2020 14:47:52 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/3] remoteproc: mss: Improve mem_assign and firmware load
Date: Thu,  5 Mar 2020 01:17:26 +0530
Message-Id: <20200304194729.27979-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, jeffrey.l.hugo@gmail.com, luca@z3ntu.xyz
Cc: agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Two things came up in the effort of figuring out why the modem crashed the
entire system when being restarted; the first one solves the actual problem, in
that it's not possible to reclaim the main modem firmware region unless the
modem subsystem is running - causing the crash.

The second patch aligns the firmware loading process to that of the downstream
driver, which seems to be a requirement in 8974 as well.

The third patch aligns the mpss coredump sequence to that of the downstream
driver, which is expected to fix mba load failure during coredump.

Bjorn Andersson (2):
  remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
  remoteproc: qcom_q6v5_mss: Validate each segment during loading

Sibi Sankar (1):
  remoteproc: qcom_q6v5_mss: Reload the mba region on coredump

 drivers/remoteproc/qcom_q6v5_mss.c | 131 +++++++++++++++++++++--------
 1 file changed, 97 insertions(+), 34 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
