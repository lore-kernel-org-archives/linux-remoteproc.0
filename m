Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF28921A443;
	Thu, 19 Jun 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750366659; cv=none; b=oaVQNpAdzu0XrTLu31hC3bhPR54fmtERADvndKyry3Sl/6Gu+jDeYgbwHPaqvbBRUhLmZoRAG7FI7KRDXoMFDICfpGTBf/gCGiyV5ew3/QPxhZ+nOFZHDCtCffPy8LN5MhLEL4S4ud83G9mkLGLU5GNLUOJ151C3WJMDGfC+MrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750366659; c=relaxed/simple;
	bh=0BFimbMMDJvY2g6w9pYsfZD1jxHTqDMRAq4TRd5ejvU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bApVo8NyPZHcolv8poVBzBz0a5PVPea6o/LYa1roJOXFyev61ptWiwjnAQCX8znLSH83aT0HFDXpYApFvjMrwoCl4jM9Z82PL/5eb3XQ6xZjkjr2n62gmibETpQz8eQSmbGikGV2LbwTEWid35aZnIMpMIukAoYwHG0bwWcHmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=reQIprtD; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="reQIprtD"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JKvO7P099203;
	Thu, 19 Jun 2025 15:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750366644;
	bh=ADDL0MeLF8mi6hAhuAqCbt/HWwTj1AjiLbF24jELZm8=;
	h=From:To:CC:Subject:Date;
	b=reQIprtDXI/GemtlwzbAK+CeGCETNrXPAMv6GZiFwyxqlAiwIWRwt4LkykE+Ewg6D
	 C/GB/+uoNVwcFr6LYaLK1Bq3Fi8gnt9xpwgE4gNdGCPFacYoTKbLz55jK8HZBAL+I+
	 VqVjcEl3xfC5TR97fZDfCjIX5FsHSaS6R8KO5itY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JKvNkk029280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 15:57:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 15:57:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 15:57:23 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JKvNiJ2023935;
	Thu, 19 Jun 2025 15:57:23 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from table
Date: Thu, 19 Jun 2025 15:57:22 -0500
Message-ID: <20250619205722.133827-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Module aliases are used by userspace to identify the correct module to
load for a detected hardware. The currently supported RPMSG device IDs for
this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".

Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
supported IDs. And while here, to keep backwards compatibility we also add
the other ID "rpmsg_chrdev" so that it is also still exported as an alias.

This has the side benefit of adding support for some legacy firmware
which still uses the original "rpmsg_chrdev" ID. This was the ID used for
this driver before it was upstreamed (as reflected by the module alias).

Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Hari Nagalla <hnagalla@ti.com>
Tested-by: Hari Nagalla <hnagalla@ti.com>
---

Changes for v2:
 - Rebased on v6.16-rc1
 - Added Acked/Tested-by

[v1] https://www.spinics.net/lists/linux-remoteproc/msg18959.html

 drivers/rpmsg/rpmsg_char.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index eec7642d26863..96fcdd2d7093c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 
 static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
 	{ .name	= "rpmsg-raw" },
+	{ .name	= "rpmsg_chrdev" },
 	{ },
 };
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);
 
 static struct rpmsg_driver rpmsg_chrdev_driver = {
 	.probe = rpmsg_chrdev_probe,
@@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
 }
 module_exit(rpmsg_chrdev_exit);
 
-MODULE_ALIAS("rpmsg:rpmsg_chrdev");
 MODULE_DESCRIPTION("RPMSG device interface");
 MODULE_LICENSE("GPL v2");
-- 
2.39.2

