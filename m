Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 4/4] remoteproc: core: don't allocate carveout if pa or da are defined
Date: Tue, 31 Jan 2017 13:35:56 +0100
Message-ID: <1485866156-6364-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc doesn't check if firmware requests fixed
addresses for carveout regions.
Current assumption is that platform specific driver is in
charge of coprocessor specific memory region allocation and
remoteproc core doesn't have to handle them.
If a da or a pa is specified in firmware resource table, remoteproc
core doesn't have to perform any allocation.
Access to carveout will be done thanks to rproc_da_to_pa function,
which will provide virtual address on carveout region allocated
by platform specific driver.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
No change since V1

 drivers/remoteproc/remoteproc_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 90b05c7..dd63ceed 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -622,6 +622,11 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
 		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
 
+	if (rsc->pa != FW_RSC_ADDR_ANY || rsc->da != FW_RSC_ADDR_ANY) {
+		dev_dbg(dev, "carveout already allocated by low level driver\n");
+		return 0;
+	}
+
 	carveout = kzalloc(sizeof(*carveout), GFP_KERNEL);
 	if (!carveout)
 		return -ENOMEM;
-- 
1.9.1
