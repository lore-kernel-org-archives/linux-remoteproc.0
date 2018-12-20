Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH 0/2]  arm64: dts: qcom: sdm845: add support for ADSP PIL
Date: Thu, 20 Dec 2018 19:09:32 +0530
Message-Id: <1545313174-13481-1-git-send-email-rohitkr@codeaurora.org>
To: dianders@chromium.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

add remoteproc and child device nodes for adsp pil for sdm845.

This depends on below upstream patches:
1) lpasscc dt node : https://lore.kernel.org/patchwork/patch/1021267/
2) pdc sync reset dt node : https://lore.kernel.org/patchwork/patch/1003795/
3) dt-binding: Remove lpass_aon clock from adsp clk list:  https://lore.kernel.org/patchwork/patch/1019609/

Rohit kumar (2):
  arm64: dts: qcom: sdm845: Add ADSP reserve-memory nodes
  arm64: dts: qcom: sdm845: Add Q6V5 ADSP node

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 101 ++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
