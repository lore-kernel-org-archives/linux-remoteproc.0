Return-Path: <Henri.Roosen@ginzinger.com>
From: Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH 1/1] remoteproc: fix elf_loader da_to_va translation and writing beyond segment
Date: Wed, 3 May 2017 14:12:09 +0200
Message-ID: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-remoteproc@vger.kernel.org
Cc: Henri Roosen <henri.roosen@ginzinger.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Consider a system with 2 memory regions:
0x1fff8000 - 0x1fffffff: iram
0x21000000 - 0x21007fff: dram

The .elf file for this system contains the following Program Headers:
Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD           0x000094 0x1fff8000 0x1fff8000 0x00240 0x00240 R   0x4
  LOAD           0x0002e0 0x1fff8240 0x1fff8240 0x03d1c 0x03d1c RWE 0x10
  LOAD           0x003ffc 0x21000000 0x1fffbf5c 0x001cc 0x048a0 RW  0x4

 Section to Segment mapping:
  Segment Sections...
   00     .interrupts
   01     .text .ARM .init_array .fini_array
   02     .data .bss .heap .stack

The problem is with the 3rd segment: it has 0x1cc bytes of ROM .data
which need to be placed at PhysAddr 0x1fffbf5c. Using MemSiz as len
parameter for rproc_da_to_va is incorrect (goes beyond 0x1fffffff). The
correct len parameter to be used here is FileSiz.

The actual memcpy of the segment was already correctly using the FileSiz
for length, however the unnecessary "Zero out remaining memory" would
write beyond the 0x1fffffff end of the memory region! This patch removes
the harmful code.

Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index c523983..3fa159a 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -183,9 +183,10 @@ rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz);
+		ptr = rproc_da_to_va(rproc, da, filesz);
 		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
+			dev_err(dev, "bad phdr da 0x%x filesz 0x%x\n",
+				da, filesz);
 			ret = -EINVAL;
 			break;
 		}
@@ -193,16 +194,6 @@ rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		/* put the segment where the remote processor expects it */
 		if (phdr->p_filesz)
 			memcpy(ptr, elf_data + phdr->p_offset, filesz);
-
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
 	return ret;
-- 
2.1.4
