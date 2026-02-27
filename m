Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F39347FC0
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183807; cv=none; b=opwcnBrOcE1398JFJmu06yzhxRmfWvQa4jMElTxNSSvvhI5V0D6H/C842hmp3xPM5+KZekA7++wz7iYdOIhoN9EGvGp29O9qqQOfgaWQ5Ro/FW8f5VagpPCUzP+Fz0shf/ncDT5Q9evZ8oe8yZOA3FDZUCThh7Dir68Su5FoQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183807; c=relaxed/simple;
	bh=y4Gg8StWVxc70nPTjHzbFNozRlWAE+RWWrT3WYVr3BI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ujdbl/tjh65ABocifZJwA+EDr9+Tvaloc6xdjYlswzd7QvZQzCe3eRmxHrVwe/iWeU6cCVrs2Gl4XYEQr0iJYcF+z4lvcZi+myFjGLj+Vt+mnwnUVlw2I9Hj8A2p8TOYSEd6hSdrJZk9TXg0uZIJQk2tGBeHjfhFG0vV7fbMx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACXQm7vYKFplIPTCA--.13808S2;
	Fri, 27 Feb 2026 17:16:31 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] remoteproc: imx_rproc: Fix NULL vs IS_ERR() bug in imx_rproc_addr_init()
Date: Fri, 27 Feb 2026 17:15:46 +0800
Message-Id: <20260227091546.4044246-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXQm7vYKFplIPTCA--.13808S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4DKw4kWFW5tr15uw15urg_yoWfKFg_CF
	yIvrWxXw10vFyjka4Uuw4Syay2yr109Fna9F15ta9xJrW3Wr12krW8Xr1DZas5X39xWry5
	Wr92qFW7ZrnrCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUqhFxUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d33d1e2c41a4..0dd80e688b0e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -812,7 +812,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		/* Not use resource version, because we might share region */
 		priv->mem[b].cpu_addr = devm_ioremap_resource_wc(&pdev->dev, &res);
-		if (!priv->mem[b].cpu_addr) {
+		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			return -ENOMEM;
 		}
-- 
2.25.1

