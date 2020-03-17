Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/3] Request direct mapping for modem device
Date: Tue, 17 Mar 2020 20:39:07 +0530
Message-Id: <20200317150910.26053-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org, robin.murphy@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The Q6 modem sub-system has direct access to DDR through memnoc and
an indirect access routed through a SMMU which MSS CE (crypto engine
sub-component of MSS) uses during out of reset sequence. Request direct
mapping for the modem device since smmu is not expected to provide access
control/translation for these SIDs (sandboxing of the modem is achieved
through XPUs engaged using SMC calls). This is done on platforms which
don't have TrustZone (which programs the modem SIDs) to prevent the
following global faults seen on Cheza/Trogdor:

Cheza:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000781, GFSYNR2 0x00000000

Trogdor:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000461, GFSYNR2 0x00000000

V2:
 * Request direct mapping from SoC-specific corner of the SMMU
   driver [Robin]
 * Add iommu property to remoteproc modem node on Cheza

Depends on:
https://lore.kernel.org/patchwork/cover/1183528/

Sibi Sankar (3):
  dt-bindings: remoteproc: qcom: Add iommus property
  remoteproc: qcom_q6v5_mss: Request direct mapping for modem device
  arm64: dts: qcom: sdm845-cheza: Add iommus property

 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 4 ++++
 drivers/iommu/arm-smmu-qcom.c                              | 6 ++++++
 3 files changed, 13 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
