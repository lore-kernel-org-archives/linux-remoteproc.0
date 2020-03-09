Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Date: Mon,  9 Mar 2020 23:52:52 +0530
Message-Id: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The Q6 modem sub-system has direct access to DDR through memnoc and
an indirect access routed through a SMMU which MSS CE (crypto engine
sub-component of MSS) uses during out of reset sequence. Request direct
mapping for the modem-firmware subdevice since smmu is not expected
to provide access control/translation for these SIDs (sandboxing of the
modem is achieved through XPUs engaged using SMC calls).

Sibi Sankar (3):
  iommu: Export "iommu_request_dm_for_dev"
  dt-bindings: remoteproc: qcom: Add modem-firmware bindings
  remoteproc: qcom_q6v5_mss: Request direct mapping for firmware
    subdevice

 .../bindings/remoteproc/qcom,q6v5.txt         |  4 ++
 drivers/iommu/iommu.c                         |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c            | 68 +++++++++++++++++++
 3 files changed, 73 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
