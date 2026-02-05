Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36E2D5C7A;
	Thu,  5 Feb 2026 05:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770268190; cv=none; b=HHJY0V1rXVUVd9HM0QSXEzhW5H+GmASHlSaTOrXeusnl9k5UMabiPbKdgouHS+3LjzE9Kd9h2QTcwSNin83E0zZAiSixOSg901j3XS6nST0r9kr7kuPTB3Q7Y3IIKB6aj9YhEbbXuI9i8b9yX163Y9oHD4W1jF9RL6dYfe5Wg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770268190; c=relaxed/simple;
	bh=uXtEkzXwvLkgzjn6q++b+eQ43MJpzndn7+opZoeIKQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fQ+E5zSYAilYVxEoKSyMVOflWq5dr4KpV8jnnzvFQT3JV8adquMO38WqwBL8I8tG/+Eh0nm+RaDQGHZ4UrEqZCQvyLPQc32QTjDJbAyFd1P3t0nRAboBM0jsOxk9pVMVJt2mdmEAXR6PXYDeyymNzO9JbQhNaJo2lsUEidsXyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnMskNJoRppZW4Bw--.38207S2;
	Thu, 05 Feb 2026 13:09:33 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Date: Thu,  5 Feb 2026 13:09:05 +0800
Message-Id: <20260205050905.3031134-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnMskNJoRppZW4Bw--.38207S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4fKFWkCFykAr4xWry8Zrb_yoWDJFc_Ca
	4a9rW8J3WFvrWYkw1q9r4FyF4qyry8ZF9avFW5KFZxJwn7XrnrAFWkZr17X3Z3Xr98Ar90
	k34IvrW7AFnrujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
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

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/remoteproc/imx_rproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f5f916d67905..0e23f519c247 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1007,7 +1007,9 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 	}
 
 	priv->regmap = regmap;
-	regmap_attach_dev(dev, regmap, &config);
+	ret = regmap_attach_dev(dev, regmap, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap attach failed\n");
 
 	if (priv->gpr) {
 		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
-- 
2.25.1

