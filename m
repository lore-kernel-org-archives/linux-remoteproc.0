Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 0/2] Enable mss rproc support on msm8996
Date: Wed,  8 Mar 2017 23:33:20 +0530
Message-Id: <1488996202-1546-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This Patch series fix the comment received on v2 patchset.
Major changes w.r.t. patchset v2 is as below.
	1- move majority of hypervisor call related changes into scm driver
	   which were earlier in q6v5 rproc driver, which was not compatible 
	   to existing design.
	2- remove voting for proxy supplies till the time corner voting is supported.
	   Though testing of mss rproc driver is possible as cx and mx supplies are 
	   in always power on domain.
	3- Fix some other Minor comments.

This patchseries is based on Bjorns remoteproc git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.11

or to say this patchset is based on top of commit id 01625cc5e65f420dbea57f7de6b9552a0f807a84
in Bjorn's git repo.

Avaneesh Kumar Dwivedi (2):
  soc: qcom: Add support of scm call for mss rproc to share access of
    ddr
  remoteproc: qcom: Enable mss rproc support on msm8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/firmware/qcom_scm-64.c                     |  25 ++
 drivers/firmware/qcom_scm.c                        |  93 +++++++
 drivers/firmware/qcom_scm.h                        |   3 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 290 +++++++++++++++++++--
 include/linux/qcom_scm.h                           |  14 +
 6 files changed, 400 insertions(+), 26 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
