Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [PATCH 3/7] firmware: xilinx-zynqmp: Add request access capability macro
Date: Thu, 16 Aug 2018 00:06:26 -0700
Message-ID: <1534403190-28523-4-git-send-email-jliang@xilinx.com>
In-Reply-To: <1534403190-28523-1-git-send-email-jliang@xilinx.com>
References: <1534403190-28523-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, rajan.vaja@xilinx.com, jollys@xilinx.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add request access capability macro which will be used to
request access to a device node from Xilinx firmware.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index e3b7292..83ebadf 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -32,6 +32,9 @@
 /* Number of 32bits values in payload */
 #define PAYLOAD_ARG_CNT	4U
 
+/* Request capability of a device node */
+#define	ZYNQMP_PM_CAPABILITY_ACCESS	0x1U
+
 enum zynqmp_pm_request_ack {
 	ZYNQMP_PM_REQUEST_ACK_NO = 1,
 	ZYNQMP_PM_REQUEST_ACK_BLOCKING,
-- 
2.7.4
