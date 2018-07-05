Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] remoteproc: correct rproc_free_vring() to avoid invalid kernel paging
Date: Thu, 5 Jul 2018 17:59:13 +0200
Message-ID: <1530806353-13664-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

If rproc_start() failed, rproc_resource_cleanup() is called to clean
debufs entries, then associated iommu mappings, carveouts and vdev.
Issue occurs when rproc_free_vring() is trying to reset vring resource
table entry.
At this time, table_ptr is pointing on loaded resource table and carveouts
amready released, so access to loaded resource table is generating a kernel
paging error:

[   12.696535] Unable to handle kernel paging request at virtual address f0f357cc
[   12.696540] pgd = (ptrval)
[   12.696542] [f0f357cc] *pgd=6d2d0811, *pte=00000000, *ppte=00000000
[   12.696558] Internal error: Oops: 807 [#1] SMP ARM
[   12.696563] Modules linked in: rpmsg_core v4l2_mem2mem videobuf2_dma_contig sti_drm v4l2_common vida
[   12.696598] CPU: 1 PID: 48 Comm: kworker/1:1 Tainted: G        W         4.18.0-rc2-00018-g3170fdd-8
[   12.696602] Hardware name: STi SoC with Flattened Device Tree
[   12.696625] Workqueue: events request_firmware_work_func
[   12.696659] PC is at rproc_free_vring+0x84/0xbc [remoteproc]
[   12.696667] LR is at rproc_free_vring+0x70/0xbc [remoteproc]

This patch proposes to simply remove reset of resource table vring entries,
as firmware and resource table are reloaded at each rproc boot.
rproc_trigger_recovery() not impacted as resources not touched during recovery
procedure.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9609d9..9a8b47c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -289,16 +289,10 @@ void rproc_free_vring(struct rproc_vring *rvring)
 {
 	int size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
 	struct rproc *rproc = rvring->rvdev->rproc;
-	int idx = rvring->rvdev->vring - rvring;
-	struct fw_rsc_vdev *rsc;
 
 	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
 	idr_remove(&rproc->notifyids, rvring->notifyid);
 
-	/* reset resource entry info */
-	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-	rsc->vring[idx].da = 0;
-	rsc->vring[idx].notifyid = -1;
 }
 
 static int rproc_vdev_do_probe(struct rproc_subdev *subdev)
-- 
1.9.1
