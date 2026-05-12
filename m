Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9113A9618
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2026 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577233; cv=none; b=GjltZ55Wl7glE6ehA2kiEuaDzvMGMn7kVi0hI4lbgVXPQoF/mA7Gq4Eo9KEV7KdEieTWVi7uQNV05mTUSdrU3KqIPnopoh6TOpBmURtBfcHzb30o37EgvIXL/8NMdWV40ocnu4Ac4gwlhr2EsCfUUR2GjEK/UbS+CcBjRgOrR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577233; c=relaxed/simple;
	bh=fjLC5gItVm05KhlOrgoaYKaTxsmo/7BIYh4aasKqc28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvS4iIH9OQ9OZM2DidbbrUAPA3FBNZ8p4oOq4MlEhHqfCbHfrRF96ErgqBUWTC8jd4m4wgwLr3+5NXhcz8O+JkISziXbA2w0qRt1vR8VySxrbh1YfXw4lN6XnZBqjpZsCja3Ia6rbg1oT+rz0wmBI89ux937a3lSmVBB97J8B8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VJlXA4mY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VJlXA4mY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0z4GF8bU8//4bN
	E9z84g9L65Dv9lqLzucdrtZp4ZRbs=; b=VJlXA4mYoFNdGtvkMPQxokJEgbnAp1
	QQr61tiKb9O2iEdNLlFtQgYuAcm9j/D8O41FEGb8UfKoVz+6L4BwDfju2li/YV1e
	35UJJtWETta/J/Kit4VgAOZ6IFbQGsk3kYFirh+Whdm0U29p1MH7QgFeFZTOYUdd
	RfWfI5+6IHMR3mtiWVo3Z6gsK1k1DAMHLX1+O9Y31xyTYrQzUjbSj7HnAiH6nCR5
	OS8e7naJq30PBMKe5X/uXi/VB3ISQP2IzJg+QTJyEBl3OIBVu6iQ+e5o4tm1gr1P
	xYlEZwCrczmMrK10UDIZoysp0xOJ3sh5ctt6Msk+4ZQPnQut2KZgE3Jw==
Received: (qmail 2922384 invoked from network); 12 May 2026 11:13:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 11:13:50 +0200
X-UD-Smtp-Session: l3s3148p1@Trb8R5tRRLgujns3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-remoteproc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Andy Gross <agross@codeaurora.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RFT v2] hwspinlock: qcom: avoid uninitialized struct members
Date: Tue, 12 May 2026 11:13:03 +0200
Message-ID: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reg_field is allocated on stack, so using the REG_FIELD macro will
ensure that unused members do not have uninitialized values.

Fixes: 19a0f61224d2 ("hwspinlock: qcom: Add support for Qualcomm HW Mutex block")
Link: https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only.

 drivers/hwspinlock/qcom_hwspinlock.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..712003a4640c 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -202,7 +202,6 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank;
-	struct reg_field field;
 	struct regmap *regmap;
 	size_t array_size;
 	u32 stride;
@@ -224,9 +223,7 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bank);
 
 	for (i = 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
-		field.reg = base + i * stride;
-		field.lsb = 0;
-		field.msb = 31;
+		struct reg_field field = REG_FIELD(base + i * stride, 0, 31);
 
 		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
 							     regmap, field);
-- 
2.47.3

