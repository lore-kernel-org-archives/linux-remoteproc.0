Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D05081723;
	Mon, 29 Jul 2024 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271536; cv=none; b=ZZjf6l+dbE6SvPNZwQ4+HDJP/rMr6mhZrp074VyXHjdOoQbvhwZEu3QRk9FD4itrRKrvlT/AGiO0mPjVgL4xggqAun2hJLQAUl+kcjHSP8d2L86v1EoLEg0okC0X3dDLDgEy/a/8EPjz+qcrUWIPhkO/8GkthyyuYoVo8LFTCiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271536; c=relaxed/simple;
	bh=tGLa38PNKAxvfircyOkK8XsugYDrM6bz+xnBtWTyFh0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NKnzYug5dqDt7mfA2/rLWY82Z2vrvDG/552P5yRa44tqNgXPZr7byJMtar7v/JKOPg8WFNY22WFiGLq+QHgNRcPS48zoU2UgVWSWTE/oIwRVz+mKTigDVN/75ymS3CVsHEcvDR34qNTw0S48WDnP+Xxp1jeczZ2bw8dMSYlJb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tjaWJcSq; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tjaWJcSq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46TGjT77120687;
	Mon, 29 Jul 2024 11:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722271529;
	bh=bd1J4obuG7DCrOJ+QWkvwQ4ZmzEAZ5DG/75Qh1geFKo=;
	h=From:To:CC:Subject:Date;
	b=tjaWJcSqf6tGIkuNfkI1j2iAutJdNp+H9uhR2/ePAd7A7s8F4cF22QXoSRgotcfse
	 Eczu8eD24sZA1uXdxrjB43q4PU8mZwnEfvJtDEvNvpsR8lPBrdko5Lb2iSXPaJ3tUI
	 uPCXu4/2v2Nc8V/AGgBFpcrVoj5Ol6djeJ559Zq4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46TGjT6q015769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jul 2024 11:45:29 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jul 2024 11:45:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jul 2024 11:45:29 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46TGjSKb037739;
	Mon, 29 Jul 2024 11:45:28 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from table
Date: Mon, 29 Jul 2024 11:45:27 -0500
Message-ID: <20240729164527.340590-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

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
---
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

