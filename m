Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/4] Improve general readability of MSS on SC7180
Date: Fri, 17 Jan 2020 19:21:26 +0530
Message-Id: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, evgreen@chromium.org, p.zabel@pengutronix.de
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This series aims to improve the general readability of the mss reset
sequence on SC7180 SoCs. No functional change intended.

Sibi Sankar (4):
  remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
  remoteproc: qcom: q6v5-mss: Improve readability across clk handling
  remoteproc: qcom: q6v5-mss: Rename boot status timeout
  remoteproc: qcom: q6v5-mss: Improve readability of reset_assert

 drivers/remoteproc/qcom_q6v5_mss.c | 69 +++++++++++++++++-------------
 1 file changed, 40 insertions(+), 29 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
