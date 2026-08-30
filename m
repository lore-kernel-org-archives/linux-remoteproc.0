Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1B3F1045;
	Sun, 30 Aug 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788096805; cv=none; b=USRoqnGflv4N4hpOyoYTklYbfODHIRjkmpon6BFPib0yYHLGfmI7q19h+XkQpxJrSDBd5bHHkMhgYsJm6CKMtTmFFAr6+HsLVBNQXpBYFE2+zw4s5jpZzwM47wpM6HWy6Fz/d7Ttn6rphrqrQAgkSTZ/X8RyUxLKgaVOBPBDFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788096805; c=relaxed/simple;
	bh=E0EaDOtsZ4SOqOd7STzJZoFhayn7fzP0Y1Pk1yPDCM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmq071XZiiNQZzjneE2Z+aJ4Lt4C7nphCwWq/mFI1lE8VuOrzesTC6D/IDhTvUaZ8JrA3323+HVkRoDrtlWcKz5fmFagF9wicytjfXF5R0zn3lzVz0xgQdD1mIw5tqAOBRdnrhEK33IjQrlRn0d8P/CnxRXcfU7u1ritKeOEQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowADHzz0YMZRqgiebBg--.26027S2;
	Sun, 30 Aug 2026 21:33:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding carveouts
Date: Sun, 30 Aug 2026 21:33:10 +0800
Message-ID: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHzz0YMZRqgiebBg--.26027S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr17Cr18tryrCw4ktryDAwb_yoW8GryfpF
	4Sva4rKr4UG3yjqwsrAa1093WS9ayUJFy7Wa4I93Z7Zr18Xw1jyF4rGFy2qFWrtrZYgr45
	XrZ0y34rZF1ayFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The prepare callback publishes DSP carveouts before acquiring the
runtime-PM reference that establishes required clocks and mailbox state.
A PM failure therefore leaves the prepare transaction partially
published.

Acquire runtime PM first and drop that reference if carveout
construction fails, so a failed prepare does not add resources before
its hardware prerequisite.

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index fd60c67ba8a9f..96d619daf3f5b 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
 	ret = imx_dsp_rproc_add_carveout(priv);
 	if (ret) {
 		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
+		pm_runtime_put_sync(dev);
 		return ret;
 	}
 
-	pm_runtime_get_sync(dev);
-
 	return 0;
 }

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

