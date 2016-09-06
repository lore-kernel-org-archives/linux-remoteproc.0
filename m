Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 0/3] Remoteproc: Add predefined coprocessor memory mapping support
Date: Tue, 6 Sep 2016 09:39:41 +0200
Message-ID: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,

Due to diverse constraints like SoC design, coprocessor characteristics,
security context, etc, coprocessor memory mapping may be predefined/fixed at system
level.
In that case remoteproc should respect the different memory regions allocated
to coprocessor in order to ensure proper operations.
The following patches implement support of fixed memory region predefined in
firmware resource table.
During resource table handling, if resource physical address is defined, i.e
different from 0x0 or 0xFFFFFFFF (-1), remoteproc enables memory region access
using memremap function.
If resource physical address is not defined, current behavior is preserved.

Best regards,
Loic

V2 introduces new specific-platform ops for memory allocation. This new ops is
called before standard dma_alloc_coherent to let platform-specific driver
handle specific use cases like internal SRAM or fixed memory mapping.
Moreover to have the capability to fix vring location and have homogenous
resource management, reserved vring resource field is transformed in physical
address.
To preserve compatibility with existing firmware for which reserved field is
equal to 0, physical address set to 0 is interpreted as any like -1.

Loic Pallardy (3):
  remoteproc: Modify FW_RSC_ADDR_ANY definition
  remoteproc: core: transform struct fw_rsc_vdev_vring reserved field in
    pa
  remoteproc: core: add rproc ops for memory allocation

 drivers/remoteproc/remoteproc_core.c | 73 +++++++++++++++++++++++++++---------
 include/linux/remoteproc.h           | 10 +++--
 2 files changed, 63 insertions(+), 20 deletions(-)

-- 
1.9.1
