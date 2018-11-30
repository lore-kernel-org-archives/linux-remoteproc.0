Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH 0/2] qcom_adsp_pil: Remove voting for lpass_aon clock
Date: Fri, 30 Nov 2018 12:59:08 +0530
Message-Id: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

LPASS Audio Wrapper AON clock is on by default. Remove
voting for it.

Rohit kumar (2):
  dt-binding: remoteproc: Remove lpass_aon clock from adsp pil clock
    list
  remoteproc: q6v5_adsp: Remove voting for lpass_aon clock

 Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt | 5 ++---
 drivers/remoteproc/qcom_q6v5_adsp.c                            | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
