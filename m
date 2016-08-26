Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 0/2] Remoteproc: Add predefined coprocessor memory mapping support
Date: Fri, 26 Aug 2016 22:19:53 +0200
Message-ID: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Loic Pallardy (2):
  remoteproc: Modify FW_RSC_ADDR_ANY definition
  remoteproc: core: Add fixed memory region support

 drivers/remoteproc/remoteproc_core.c | 61 ++++++++++++++++++++++++++----------
 include/linux/remoteproc.h           |  6 +++-
 2 files changed, 50 insertions(+), 17 deletions(-)

-- 
1.9.1
