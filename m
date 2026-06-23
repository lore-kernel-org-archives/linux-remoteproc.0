Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47DA313543;
	Tue, 23 Jun 2026 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220842; cv=none; b=Pcs+mqhGcxEd3DZWUg62Ha9qpIgcanNVI8PuoX/QI90nMJfVK+RNp7qeYXeuYvPoK+RSqythX80UUCHF7DdnEw9sIS1uHNL/BmX/1xBPVECFE/hxe7Ul8rD1LCRSFjxoJb8/EmBsDC/EjI65bn6NeTx1ttfZyu8yPQUXpYTNOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220842; c=relaxed/simple;
	bh=lnFEBwBLYEyDhXYWSp4bmV8exXrVHzF9WjvitZhZXoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlHJPXlSf+AdOsckGZks9SXVy1KpDqUTCOhZo++zo7GcXwNVF933ImCzIOCemf+FJ01ICXsXLZ22MdVNJ6Cim8D2ps/DwT9Shi5cXwHlPxpRoaTulOG5UR+vfhjvosF+6LPrmWYyAWyg9Mhpfzy1IyaQc2Mw3Rgurkrge+xwsj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PuT1RqsY; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PuT1RqsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=d+
	EkAXSkXJaFfwL6xZ/6B+MeTA8cWIbxfbUkq1sHGh0=; b=PuT1RqsYQnOjdI13nG
	aGyCs0ildz67/w2lZMEGAB7enDA7ubw0lb9+FMkIlTlDDuTT60cvGOmm9hawZl68
	Zr0SsdYIWD42gVrXMUQQtq/6inXZy5Ht+YOJzTaZBdDpImF1fJgs3SjfwaME4azb
	zGsEStaww/8Ov2ny+TP54d/8g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHTssQiDpqXX4dFQ--.52045S2;
	Tue, 23 Jun 2026 21:20:18 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	djakov@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path failure
Date: Tue, 23 Jun 2026 21:20:15 +0800
Message-Id: <20260623132015.2243317-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHTssQiDpqXX4dFQ--.52045S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw18Xr1DZFyrWr47tFW7twb_yoWkXwbE9F
	Z29rs7Xr10kFykZw12yFWayFWfJw4xXwn7GF4Yq3WagrZ8Xr4fGryDXFsa93yfuw45WFW5
	GrnIqF43ZF1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_89NUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RJPvWo6iBJd6gAA3w

qcom_q6v5_init() acquires the QMP handle before getting the
interconnect path. If devm_of_icc_get() fails, the function
returns without releasing the QMP handle, leaking the device
reference acquired by qmp_get().

Release the QMP handle on the interconnect error path before returning.

Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/remoteproc/qcom_q6v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..b57041a37d28 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(q6v5->path))
+	if (IS_ERR(q6v5->path)) {
+		qmp_put(q6v5->qmp);
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	}
 
 	return 0;
 }
-- 
2.25.1

