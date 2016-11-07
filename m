Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 0/3] reproc: qcom: Add support to  hexagon q6v56 in qcom hexagon rproc driver
Date: Mon,  7 Nov 2016 18:07:17 +0530
Message-Id: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This is patchset v3 having modifications to address kbuild root error from patchset v2 and to
address patchset v1 comments. Major changes w.r.t. patchset v1 are as below.
	1- Separate functions for resource handling and start stop
	have been done away with.
	
	2- A private structure is defined which is being initialized
	with hexagon version specific data and being passed to probe
	via device structure. This in turn is passed as argument to various
	resource handling routines so that same code can do resource 
	manipulation without code change when new hexagon version need to be 
	supported.
	
	3- Some existing function name have been changed to reflect version
	independent driver.
	
	4- Comments regarding use of appropriate hexagon version have been
	addressed
	
	5- Comments regarding dividing all changes in logically complete
	patchset have been addressed to best possible way
	
	6- Comments regarding clock initialization in an array and not setting
	volatage for vdd pll before enabling the reg. have been addressed
	
	7- XO clk node have been added even for q6v5
	
	8- Wrapper functions to maintain boot count have been removed 
	as per comment received in last patchset.
	
	9- Unvoting of clocks and regulators have been moved in q6_start function
	as per comment on last patchset.

There were certain comments which could not be addressed 
	1- To program MSS_RESET via GCC reset controller
	Infact i had done it the way suggested before i sent out initial
	patchset, but then when i discussed with internal clock team, they said they will
	not support MSS RESET to be done via GCC because
	
	"MSS_RESET is not a block reset, GCC reset controller is used only when we need a BCR to be reset, 
	and which has a special purpose. MSS RESET doesn't fall under block resets, it is not a clock and 
	cannot be associated with clock."
	
This patchset is verified on top of kernel 4.9.rc4.
below is console o/p
[    3.304426]  remoteproc1: powering up 2080000.qcom,mss
[    3.304435]  remoteproc1: Booting fw image mba.mbn, size 213888
[    4.518946]  remoteproc1: remote processor 2080000.qcom,mss is now up

Avaneesh Kumar Dwivedi (3):
  remoteproc: qcom: Embed private data structure for hexagon dsp.
  remoteproc: qcom: Hexagon resource handling
  remoteproc: qcom: Adding q6v56 reset sequence.

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 747 ++++++++++++++++-----
 2 files changed, 566 insertions(+), 182 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
