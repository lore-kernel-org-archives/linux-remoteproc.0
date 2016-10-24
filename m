Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 0/5] Self authenticating hexagon driver for q6v55
Date: Mon, 24 Oct 2016 21:25:54 +0530
Message-Id: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, akdwived@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patchset series modifies existing hexagon v5 driver to work with
hexagon v55 module. hexagon v5 driver need modification because of 
difference in resources as well as their handling wrt to v55. Resources
required such as clock and regulator are different for v55 than v5,
hence separate set of routines are implemented to initialize and enable 
hexagon v55 resource list, these routines are invoked based on 
differentiation through compatible string matches.

These patches are compiled and tested with kernel tip for hexagon v5 boot
functionality.

Avaneesh Kumar Dwivedi (5):
  remoteproc: Add q6v55 specific parameters and enable probing for q6v55
	This patch modifies device private data structure to incorporate
	aditional v55 device specific information, add certain parameters to 
	be used with hexagon v55, add v55 specific compatible string to 
	enable probe for hexagon v55 and add compatible string in dtbinding
	of devicetree.
  remoteproc: Adding q6v55 specific regulator, clk, reset interface.
	This patch implement routines to initialize and enable regulator
	and clock resources for hexagon v55, it also change reset register 
	programming method from secure to non secure.
  remoteproc: Adding reset sequence and halt seq changes for q6v55
	This patch add hexagon v55 specific reset sequence.
	This also remove IDLE check before asserting halt to qdsp axi ports.
  remoteproc: Add start and shutdown interface for q6v55
	This patch add start and shutdown interface of hexagon v55 and plug them
	into new common routine which invoke v5 or v55 specific start or shutdown.
  remoteproc: Modifying probe for initializing q6v55 specific resources
	This patch identify qdsp version and based on that invoke individual
	initialization routines.

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   3 +-
 drivers/remoteproc/qcom_q6v5_pil.c                 | 616 ++++++++++++++++++++-
 2 files changed, 595 insertions(+), 24 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
