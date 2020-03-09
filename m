Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom: Add modem-firmware bindings
Date: Mon,  9 Mar 2020 23:52:54 +0530
Message-Id: <20200309182255.20142-3-sibis@codeaurora.org>
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce modem-firmware binding to allow Q6 modem to boot on platforms
which do not have trustZone.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 88dfa3fc15f78..b1715bc90fb05 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -198,6 +198,10 @@ The Hexagon node may also have an subnode named either "smd-edge" or
 related to the Hexagon.  See ../soc/qcom/qcom,smd.txt and
 ../soc/qcom/qcom,glink.txt for details on how to describe these.
 
+The Hexagon node must contain a subnode named "modem-firmware" on
+platforms which do not have TrustZone. The sub-node should have the
+iommu property as described in ../iommu/iommu.txt.
+
 = EXAMPLE
 The following example describes the resources needed to boot control the
 Hexagon, as it is found on MSM8974 boards.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
