Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222233EC;
	Tue, 14 Jul 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999513; cv=none; b=OQ/d3TX4O82oRmwv0cYwhW+5nzaEGIlLfRzIsX5jWAV4zIWOnQd+e2njHjfa7eTBDCfOWvXY46CEeMoYO+V+onRey9FnuH3MHRuxMME26DK4GMPDbeK/8CrzzgA951Lw2qiDf22ig5Ljlir++OOu7oTiSnUNq4g5M4MMtcL83g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999513; c=relaxed/simple;
	bh=57INZ5EIZXPkNkQ5ksZwJnwQ5tsWiS7zNlFQbIGZ1Zw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nTsf0WZecSPrjIL8/NhtsYa+ZZkckj+NQbN7Ad2AF3k918Z2CccRXSqO5Rls9zsNW3a0Hmg0J0FHu78oLU4x2dci72SD0TQtSOgRRsPvv56z8EkFCS0SjaPyPk8ZcAPhoLC82nJ1rPWe69zetdtILQBphvkANL1TjuIaf7fpvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADXyK8SrFVqM8qkFw--.52595S2;
	Tue, 14 Jul 2026 11:25:06 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] remoteproc: qcom_q6v5_wcss: remove unneeded semicolon
Date: Tue, 14 Jul 2026 11:22:53 +0800
Message-Id: <20260714032253.2768008-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXyK8SrFVqM8qkFw--.52595S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy8Ww4DtF1kZw1DJr4xWFg_yoW8GrW8pF
	sxWa10kry7tw4FgFsxZr4kAF15uay7tFyxGrsrG34xXw1YyryUJF4rGFy8tFZ5XFZYg3y3
	XFsF9r1UuF17AFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS
	14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5k
	u4UUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index a6737b2d96da..318bb1a490b3 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -263,7 +263,7 @@ static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
 	if (ret) {
 		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
 		return ret;
-	};
+	}
 
 	/* Write bootaddr to Q6WCSS */
 	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
@@ -324,7 +324,7 @@ static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
 	if (ret) {
 		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", ret);
 		goto assert_aon_reset;
-	};
+	}
 
 	return 0;
 
@@ -424,7 +424,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 	if (ret) {
 		dev_err(wcss->dev, "failed to enable q6 clocks, err=%d\n", ret);
 		goto disable_gcc_abhs_cbcr_clk;
-	};
+	}
 
 	/* Enable the Q6AHBS CBC, Q6SSTOP_Q6SS_AHBS_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbs_cbcr);
-- 
2.25.1

