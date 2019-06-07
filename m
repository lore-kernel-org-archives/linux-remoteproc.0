Return-Path: <gustavo@embeddedor.com>
Date: Fri, 7 Jun 2019 13:53:14 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] remoteproc: Use struct_size() helper
Message-ID: <20190607185314.GA15771@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-ID: <linux-remoteproc@vger.kernel.org>

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct resource_table {
	...
        u32 offset[0];
} __packed;

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

table->num * sizeof(table->offset[0]) + sizeof(struct resource_table)

with:

struct_size(table, offset, table->num)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 215a4400f21e..606aae166eba 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -247,8 +247,7 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
 		}
 
 		/* make sure the offsets array isn't truncated */
-		if (table->num * sizeof(table->offset[0]) +
-				sizeof(struct resource_table) > size) {
+		if (struct_size(table, offset, table->num) > size) {
 			dev_err(dev, "resource table incomplete\n");
 			return NULL;
 		}
-- 
2.21.0
