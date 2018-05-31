Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/5] rpmsg: virtio_rpmsg_bus: Switch to SPDX license identifier
Date: Thu, 31 May 2018 12:11:00 -0500
Message-ID: <20180531171103.8703-3-s-anna@ti.com>
In-Reply-To: <20180531171103.8703-1-s-anna@ti.com>
References: <20180531171103.8703-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Use the appropriate SPDX license identifier in the virtio rpmsg
bus driver source file and drop the previous boilerplate license
text.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 82b83002fcba..664f957012cd 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Virtio-based remote processor messaging bus
  *
@@ -6,15 +7,6 @@
  *
  * Ohad Ben-Cohen <ohad@wizery.com>
  * Brian Swetland <swetland@google.com>
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
-- 
2.17.0
