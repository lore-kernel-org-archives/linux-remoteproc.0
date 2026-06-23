Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A2244694;
	Tue, 23 Jun 2026 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221971; cv=none; b=lXRJOGUWUpsTwmnR7Ghw2T4VE0/KmcJrulvEfoQgCtoknaA6vxV9SkZvmscsBMSzQGmFXXyKhTZ3LFM6jqLwYCUTAaUNuwFUKnNfjjaHXDBJCvjPNuDahO57/6pLy/RVl3PHQjkLJZ7nbhCLsQb5CdGsIXq8Gl7z24H59YWr5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221971; c=relaxed/simple;
	bh=/SvO2yKYHj73/T4PoOAjy2atAfh1CuEV64gs3LwX3rE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aabj7Hlz4dIoje0lKeARhgjsJNNjPpgUaNXFXd/aesuzV3KbMkeiHMBOsf7Wz0XdQhWFbuQtABUQtVzZvfc87e0D8Tny0Qg2NEEmwcBXF1QLYUCS+vcLvyzzPv4lT3Ez7dOSklwQx0I5Mabv1jhBwsVTovMPQJcgdOgNoZJZxW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cA2ZtEN3; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cA2ZtEN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lh
	YDY/oGh1x20M8STDeHhSgFj7e0F2TfJzpcUG3q/j8=; b=cA2ZtEN36qzmUHUBYS
	rgGGDT+6icfpsvztBXkCTVfmpSQPsTFZkLcHNWgFfqPM56nn6I4cUhxRq7kPgjVE
	f34ZiBu9nd7LVRi/izIGo/qh+Po0iqdl3VJfXJHCg2D1gZkTutVnYVmvqFCzlkz/
	bZUuNyduUDJBgXIaQIU/JnMmM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3H5FkjDpqLOjlFQ--.48199S2;
	Tue, 23 Jun 2026 21:38:46 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olivia.wen@mediatek.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] remoteproc: mediatek: Unregister init IPI on share buffer failure
Date: Tue, 23 Jun 2026 21:38:44 +0800
Message-Id: <20260623133844.2255072-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H5FkjDpqLOjlFQ--.48199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4rCryUCryUXF1xtFW5ZFb_yoW8XF13pa
	43Kay3Kr48KFsrXrsrC3W8Z3W3ua18G3y29w4fJwnFvw1UJr92qas5tFyjvFWDCFWxXFW3
	ZFWaqrWruFWUCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piMGQDUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gZl02o6jGbYUgAA3u

scp_rproc_init() registers the SCP init IPI before allocating the IPI
share buffer. If the share buffer allocation fails, the error path jumps
directly to release_dev_mem and leaves the init IPI registered.

Route that error path through the IPI unregister label so the registered
handler is cleared before unwinding the remaining resources.

Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/remoteproc/mtk_scp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..648b69f96624 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1227,7 +1227,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	if (!scp->share_buf) {
 		dev_err(dev, "Failed to allocate IPI share buffer\n");
 		ret = -ENOMEM;
-		goto release_dev_mem;
+		goto unregister_ipi;
 	}
 
 	init_waitqueue_head(&scp->run.wq);
@@ -1248,9 +1248,10 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 
 remove_subdev:
 	scp_remove_rpmsg_subdev(scp);
-	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	kfree(scp->share_buf);
 	scp->share_buf = NULL;
+unregister_ipi:
+	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
 	scp_unmap_memory_region(scp);
 	for (i = 0; i < SCP_IPI_MAX; i++)
-- 
2.25.1

