Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] remoteproc: drop memset when loading elf segments
Date: Thu,  9 Apr 2020 16:22:51 +0800
Message-Id: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

To arm64, "dc      zva, dst" is used in memset.
Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,

"If the memory region being zeroed is any type of Device memory,
this instruction can give an alignment fault which is prioritized
in the same way as other alignment faults that are determined
by the memory type."

On i.MX platforms, when elf is loaded to onchip TCM area, the region
is ioremapped, so "dc zva, dst" will trigger abort.

Since memset is not strictly required, let's drop it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 16e2c496fd45..cc50fe70d50c 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -238,14 +238,11 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			memcpy(ptr, elf_data + offset, filesz);
 
 		/*
-		 * Zero out remaining memory for this segment.
+		 * No need zero out remaining memory for this segment.
 		 *
 		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
+		 * did this for us.
 		 */
-		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
 	if (ret == 0)
-- 
2.16.4
