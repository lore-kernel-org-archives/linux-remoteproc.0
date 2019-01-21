Return-Path: <pihsun@chromium.org>
Return-Path: <pihsun@chromium.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [PATCH 2/2] remoteproc: elf_loader: Use memset_io instead of memset.
Date: Mon, 21 Jan 2019 15:34:08 +0800
Message-Id: <20190121073408.56557-2-pihsun@chromium.org>
In-Reply-To: <20190121073408.56557-1-pihsun@chromium.org>
References: <20190121073408.56557-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Use memset_io and memcpy_toio instead of memset and memcpy in
rproc_elf_load_segments, since the target ptr may be device memory.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
This fix issue while trying to load ELF firmware based on
https://lore.kernel.org/patchwork/patch/1033804/, that the memset(...,
0) would use "dc zva" instruction on aarch64, which cause kernel crash
since the target is device memory.
---
 drivers/remoteproc/remoteproc_elf_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index b17d72ec8603bc..17f1815757dc54 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -159,7 +159,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u32 memsz = phdr->p_memsz;
 		u32 filesz = phdr->p_filesz;
 		u32 offset = phdr->p_offset;
-		void *ptr;
+		void __iomem *ptr;
 
 		if (phdr->p_type != PT_LOAD)
 			continue;
@@ -191,7 +191,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 
 		/* put the segment where the remote processor expects it */
 		if (phdr->p_filesz)
-			memcpy(ptr, elf_data + phdr->p_offset, filesz);
+			memcpy_toio(ptr, elf_data + phdr->p_offset, filesz);
 
 		/*
 		 * Zero out remaining memory for this segment.
@@ -201,7 +201,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		 * this.
 		 */
 		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
+			memset_io(ptr + filesz, 0, memsz - filesz);
 	}
 
 	return ret;
-- 
2.20.1.321.g9e740568ce-goog
