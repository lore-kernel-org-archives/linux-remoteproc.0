Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9532D8767;
	Mon,  9 Feb 2026 05:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770614334; cv=none; b=JA94xWDkmIgLRlDtPG8anESYuJkqvyR8vW9aprCWM7iWhg4wOdY1Z/3uRav8KeFDKJBVeqdTjpouZgal0Qb5jHTfHlUmaw6B3VFrkUgtUbW/EoMiwpKwMq44cKYD9ddYPi74rH2vFiHEtXvR7VG226leV/BR/erUXddCJl0ty9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770614334; c=relaxed/simple;
	bh=ryvxP56BpEYWQ/bV/GwhxtChmLT6+SueJYNn+SC2l4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lt67iCfTLixJXgXhpeMlMg189H0RFikNBtDkccrKtq/pvLqScFNngfY08seKZgB+0evVbEXXsFo1UFRtJL5Y/xd9dkMHuiu2ZyPUPqYGY//smWjsEkqeUC2tDwuDrSUyDDtJ22iJ5aWjS8gYm6dU2+pNhlkREhTbgEg1qNqSZHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADnjGgtbolp6gaCBw--.8544S2;
	Mon, 09 Feb 2026 13:18:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: peng.fan@nxp.com
Cc: andersson@kernel.org,
	festevam@gmail.com,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Date: Mon,  9 Feb 2026 13:14:07 +0800
Message-Id: <20260209051407.1467660-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnjGgtbolp6gaCBw--.8544S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4fKFWkCFykWF4DJry3XFb_yoWkJFg_Ca
	4akrW8X3W0vrW5C3WDZr4rAFWUtFy8ZF9Y9F4UtFZxJwn7XrnrAFWDZrnrZa1fXryqyr90
	k34Svr47AFnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBuWLUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add error checking for regmap_attach_dev() call in
imx_rproc_mmio_detect_mode() function to ensure proper error
propagation.

Return the value of regmap_attach_dev() if it fails to prevent
proceeding with an incomplete regmap setup.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changes in v2:
- Use dev_err() + return ret instead of dev_err_probe()
---
 drivers/remoteproc/imx_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f5f916d67905..75baf905988b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1007,7 +1007,11 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 	}
 
 	priv->regmap = regmap;
-	regmap_attach_dev(dev, regmap, &config);
+	ret = regmap_attach_dev(dev, regmap, &config);
+	if (ret) {
+		dev_err(dev, "regmap attach failed\n");
+		return ret;
+	}
 
 	if (priv->gpr) {
 		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
-- 
2.25.1

