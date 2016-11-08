Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 7 Nov 2016 21:28:25 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] remoteproc: Add q6v55 specific parameters and enable
 probing for q6v55
Message-ID: <20161108052825.GH25787@tuxbot>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
 <1477324559-24752-2-git-send-email-akdwived@codeaurora.org>
 <20161025184708.GM7509@tuxbot>
 <6169b510-c48b-d422-0e3d-8cdd3afca429@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6169b510-c48b-d422-0e3d-8cdd3afca429@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 04 Nov 06:27 PDT 2016, Avaneesh Kumar Dwivedi wrote:

> 
> 
> On 10/26/2016 12:17 AM, Bjorn Andersson wrote:
> >On Mon 24 Oct 08:55 PDT 2016, Avaneesh Kumar Dwivedi wrote:
> >
> >>Adding required definition of parameters along with new structure
> >>fields specific to q6v55 and enabling probe for q6v55 mss remote-
> >>proc driver.
> >>
> >>Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> >>---
> >>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  3 +-
> >>  drivers/remoteproc/qcom_q6v5_pil.c                 | 33 ++++++++++++++++++++--
> >>  2 files changed, 32 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> >>index 57cb49e..0986f8b 100644
> >>--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> >>+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> >>@@ -7,7 +7,8 @@ on the Qualcomm Hexagon core.
> >>  	Usage: required
> >>  	Value type: <string>
> >>  	Definition: must be one of:
> >>-		    "qcom,q6v5-pil"
> >>+		    "qcom,q6v5-pil",
> >>+			"qcom,q6v55-pil"
> >>  - reg:
> >>  	Usage: required
> >>diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> >>index 2e0caaa..8df95a0 100644
> >>--- a/drivers/remoteproc/qcom_q6v5_pil.c
> >>+++ b/drivers/remoteproc/qcom_q6v5_pil.c
> >>@@ -30,13 +30,14 @@
> >>  #include <linux/reset.h>
> >>  #include <linux/soc/qcom/smem.h>
> >>  #include <linux/soc/qcom/smem_state.h>
> >>+#include <linux/mutex.h>
> >>  #include "remoteproc_internal.h"
> >>  #include "qcom_mdt_loader.h"
> >>  #include <linux/qcom_scm.h>
> >>-#define MBA_FIRMWARE_NAME		"mba.b00"
> >>+#define MBA_FIRMWARE_NAME		"mba.mbn"
> >On 8974 we must load the mba.b00, on 8916 and 8996 we must load mba.mbn.
> >But looking at downstream we seem to have:
> >
> >8974: q6v5 -> mba.b00
> >8916: q6v56 -> mba.mbn
> >8996: q6v55 -> mba.mbn
> >
> >So we should be able to pick this based on compatible then.
> OK, have take care of in patch set v2
> >
> >>  #define MPSS_FIRMWARE_NAME		"modem.mdt"
> >>  #define MPSS_CRASH_REASON_SMEM		421
> >>@@ -65,6 +66,8 @@
> >>  #define QDSP6SS_RESET_REG		0x014
> >>  #define QDSP6SS_GFMUX_CTL_REG		0x020
> >>  #define QDSP6SS_PWR_CTL_REG		0x030
> >>+#define QDSP6SS_MEM_PWR_CTL		0x0B0
> >>+#define QDSP6SS_STRAP_ACC		0x110
> >>  /* AXI Halt Register Offsets */
> >>  #define AXI_HALTREQ_REG			0x0
> >>@@ -93,13 +96,24 @@
> >>  #define QDSS_BHS_ON			BIT(21)
> >>  #define QDSS_LDO_BYP			BIT(22)
> >>+/* QDSP6v55 parameters */
> >>+#define QDSP6v55_LDO_BYP                BIT(25)
> >>+#define QDSP6v55_BHS_ON                 BIT(24)
> >>+#define QDSP6v55_CLAMP_WL               BIT(21)
> >>+#define QDSP6v55_CLAMP_QMC_MEM          BIT(22)
> >>+
> >>+#define HALT_CHECK_MAX_LOOPS            (200)
> >>+#define QDSP6SS_XO_CBCR                 (0x0038)
> >>+
> >>+#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
> >>+
> >>  struct q6v5 {
> >>  	struct device *dev;
> >>  	struct rproc *rproc;
> >>  	void __iomem *reg_base;
> >>  	void __iomem *rmb_base;
> >>-
> >>+	void __iomem *restart_reg;
> >The restart_reg is a register in the gcc, on 8974 this is exposed as a
> >reset by gcc. Please add the GCC_MSS_RESTART to the list of resets in
> >gcc-msm8996 rather than remapping and poking the register directly from
> >this driver.
> Infact i had done it the way suggested above before i sent out initial
> patchset, but then when i discussed with internal clock team, they
> said they will not support MSS RESET to be done via GCC because
> "MSS_RESET is not a block reset, GCC reset controller is used only
> when we need a BCR to be reset, and which has a special purpose. MSS
> RESET doesn't fall under block resets, it is not a clock and cannot be
> associated with clock."

The mss reset is a "reset" and we've shown that modelling it through a
reset-controller in DT and Linux makes the remoteproc driver cleaner.

We could implement an additional reset-controller, for the
non-block-reset resets of GCC, but I can't see any technical reason for
doing so

Can you please help me understand the possible technical reasons for not
having mss reset handled through the same reset-controller as the other
resets in gcc?

For prior platforms the upstream driver does expose these resets through
the same reset-controller as the block resets.

> 
> Downstream also MSS RESET is programmed through dev_ioremap.

A lot of the downstream code was designed and written before the reset
controller framework was invented, so that's not a good argument to
stick with ioremap.

Regards,
Bjorn
