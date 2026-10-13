Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C84F68C4
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895416; cv=none; b=qBjtCl8D+kmRLHb7ybLy3JbcELPX522fi2tO78PHY5B758gF9pDnTOiy6g1NvtC3Py7v/xgdhxRtHZsG5zJk8Jz8ypnNWStlU8TaqAEKW28EFp8THY2KqgBkA4qtmdMALJHpN2/UrPO/kPs52iO2SStRTTtLWkDU36RBGL2Tjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895416; c=relaxed/simple;
	bh=0NQ5w5tbcto66/4GcTTAPB4tFFMCRjM8/r2YcYTPB5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UQ+gBOSvgHG5n9oncPxYLIg+WH034kr4I6BtLyRqj/UEgUJyhbsHCI6AtNNOLKOjcIdgz8/THbiNG9NFY3dSlohZJzXoIBCQg/D5ldqy4fO7Qdi3sMA/C6h/o+WA3f+3m4JSKBQlPgn+jMvRy5uq9/qL59jiVuDKQLT28mmPmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei+zGzZm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei+zGzZm"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0728so646635f8f.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 05:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895413; x=1792500213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=ei+zGzZmw/yYVihEsPN6QjKvXkRROYtRQ/zBsnpWEi/o3R6lhm5CvRHF5+bd+k/+OA
         v6vZNFGIWJ4tAvKDCer6jSNVJyQYRTAxsAmUnqCpRyNdsGogwfDTpO1fQMd3nwtqc+Ow
         kSFh2Dk3STZhN0iyUeAeuWRr8MDbKDruk8Mftw59dLQpIsaugWOw0tOmqKkhPjUn06Td
         drlOs5PWrwrfyKUiHrCepUbPEy8crgzehXdPR7hjcBaynjDgam7O4z9hx8pZIjOzf3ue
         nkxExy1SN8uikDxDEVYDNSH3z3vUHHR1eqq2wAobpSO+Btv9H29i8kTl2E0GVXjEcTvw
         VTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895413; x=1792500213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ld/rflLmJTpQA28xoZ6zpNKNM3ooqYaquEt3HBu6M58=;
        b=lRjIvuI9kqPecxgdjbjKCTevjwSHLbclEBWAQ94qxV5719ULOwRhya+r7pY47h2ywW
         /FitiZrfIzxE90W3xF8z8gEUKUqFlFLNu4doSSnuJcsmOK6yuJOrXll4kqG5Cm11kRxx
         7WOrp2ENGE4O/gRWFarDS4v/un7jdJ0XWhoEvZaBbq2O4a44kZZ8EJe6pv8B9VLTaznk
         sX7kxHm1eelJR257qOQrr7i+n9lQ5X1Ey44zmoahC2eBuZitZzMrn1yk5lKMipOz3m3Z
         RmggAHiv2eygdkl2FLgdmY8RfUILvn/FWL3MJeZ0S8wkBjlB7zMHuox0jbAQMOEpLovW
         7tLA==
X-Forwarded-Encrypted: i=1; AKwUvBy58ikVxeV0OwjB5CXeNrzzteG+KMOtNgs10JCghj6b6y4aVu4y4+dLJgFzPwWbLK+465KkvtwcXPJBkYy1LjsM@vger.kernel.org
X-Gm-Message-State: AFq9FYJ27Cgq2uVz5rcI+yx+/AooQ2mLJ7t3Uwz4cPBAf/XUMsXrOKWz
	3CMBpFlVKjDQ36L4TJMk9C5MlaCuiu/LIZpDB2SmFEy9StnlnHgKM8Pu
X-Gm-Gg: AYBFou0jPzkDgcrlbcDaySI2MquGi+NRUd4l3jRua+O9K/hWZqLkwSuVLYiL8sXs+wK
	aHuGCeIhTzec0bguf/q5xeMm/+dHEsJc9fJEK8QbkDHeC0vogbqIZUipZqV8ojyWeG3ojupPXoj
	cOkGRgh6WyeWP0qQICsN/HXvX16W+8x89GKDp+hbHt6EiavW2zdm2OOxyZyVEExpwO4HepmJOE3
	nh4j83thRJ7sv0fSvba3RIfAbPMpt/4qSge6p5PJpRxz+xp8pYgb+Jh768cf4FKR8OuTrIuzxzI
	54LC4qD6jUysNUiEI1w0oM6Yphn7GUdtDrRcTgyjiVtKu+90zBP1kRlEv8O0HNEQpPP278V9owW
	gu/PkLz8jX0lLDYY6joIagso2hXt0HL+/6N0V7Ct1eJ5TxTOCKAdcmG4i2A4ogwrKuA5giUpW1J
	XIjqAOU0VIqKYCop92N/TeyrIgDtim+v4PQ5SE8G4Zw5HJiiwArTVaJukxt0zpmBMwHEl9cXtxS
	5EU5MFXD2rockw=
X-Received: by 2002:adf:e007:0:20b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48dbace50e3mr17346014f8f.38.1791895412619;
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:f28a:73a4:9323:621f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm4493729f8f.21.2026.10.13.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:43:32 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
Date: Tue, 13 Oct 2026 15:43:28 +0300
Message-ID: <20261013124328.1273340-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_smem_register() passes the result of of_irq_get() directly
to devm_request_irq(). Negative errors are converted to unsigned IRQ
numbers, causing the IRQ request to return -EINVAL instead of the
original error.

Check the IRQ before requesting it. Preserve negative errors and
return -EINVAL if the IRQ mapping fails.

Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
A dev_err_probe() diagnostic can be added for IRQ acquisition failures
if preferred.

 drivers/rpmsg/qcom_glink_smem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 35bb03e67ae8..010a7da64906 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	}
 
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
+	if (smem->irq <= 0) {
+		ret = smem->irq ?: -EINVAL;
+		goto err_put_dev;
+	}
+
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
 			       "glink-smem", smem);

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

