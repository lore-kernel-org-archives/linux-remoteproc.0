Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878A37AA9E
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754005; cv=none; b=qT+QmYc/pVx1rPwdQhD0gofO03BUQfBLFQ5GDxWK7I3xOcLDsQ8z1cDTaJ5nFasrFLETOwlK2uOg66vAyr6peHRRkqCacZYOODjAuD3lamdIKZ19YcFMXDFuhOCwJz1fogVC4RpqaC/Z1Bf/CBcdPLXZ+Oji5aY/8K/9RMnkGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754005; c=relaxed/simple;
	bh=wUfUuxfITCGghcf5aCJOg+8n3nJtwvYEILl7m8swd54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpbprnBe5JQ0qT4wMNkmQ7D+BxfAEuQBNQKQqwHqciZOsh3KoxqyAib4NTmHwvBlKzY4t40dUejWTrwHcX0PZ2rZFQzVqwqUGDWTM6CU/hpqqIXkzPpVBawS417yUvF85AfcweiQBoznLeKyPv8gHoXDZDZVyNP2JMSSCJXrDjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbcpA/Of; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avGfr9cM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbcpA/Of";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avGfr9cM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S0ic051611
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQXGwlm1CsT+OIOZzwDO5HZCho1MP5SUBCbAK2IFXPs=; b=SbcpA/OffUJTxVpu
	ndtdZ4g2EEYbhvHqMekXj2mweNFoBoQ3jB//cZCNo+4OXILx/jj8KZvOYsxD3ZLV
	BaEcpuAEXN7FX4pI0Uyea6Yo6HxOHcvhbfyxFy83tX5CK40ycpk/33ov6YUD5HE2
	yHIVRqUvXoYDw1U/UuGWmIwt2UmSTtAcNuX0KeMcUIU/3WpeZX/1GWKTva+6PBHF
	LcUiLtJceH8IJBJFAjwnUubnlSs4kDrDAwFXlNqwQcRUgJfFL3O9rgcjUQ47WcoO
	jcn+iQZR334gwmSECooSn0+Xk2GM9c9TdBYFBroDURBuUldeXNZC3/gsvjmE2bS6
	WOxwAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb93hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2117722a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754001; x=1786358801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQXGwlm1CsT+OIOZzwDO5HZCho1MP5SUBCbAK2IFXPs=;
        b=avGfr9cM6mxiuLVboNy7TTiGWlahtwkaBOAVXdRVPc/UUjo+ZJyhGjdV00VTLIdOJI
         Ymtzx9IBNl6CvqeryM57TWM11tcNa1WOTmYAxzyL0UUsuhXNCpQg8B8J9ZUbXBUiRYiO
         XO6JnhravxLNZBD8e1kvaSyj6jk+/gHTCdVT3zmjwhEjCZ2hMxVCifkxyqZEKa/x4yIK
         4fozh3A5yKzKWK15T2rhvAb4KC0c+SbQK9oDR4+icWfVzKyxdq79NKiVPBQB1lDdjKHi
         iPJ8nkbndTbGlMEXI8e9VBcm9hx6mawmd4MogmUi6K/hhfPiETP/oRm89sKF2Vs8Ftw5
         yJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754001; x=1786358801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQXGwlm1CsT+OIOZzwDO5HZCho1MP5SUBCbAK2IFXPs=;
        b=FF156zcMuMI+hkH+G7In8FG/Xwm8/TGKG13XrtojNB9cZFF7P4HYSuqiC7uFLtZowo
         HL3vE+q5Gq1agwEtiLzKW3bdAlGEaqQVYZ1+YDCJvngDN0MT1r4sGCxT/SLLPT0HKZGu
         wfspP4ShAshuuFzSM0WDVgxMNweuHMvd+qT2RpFBfZOHBndWHrvB3O5hQ5aWfFgvTJfi
         VsKZnCxAL1p/RQP4OIM/bJbN/Q8p1906Bp9mHWDKSXaSGZ6p9lfSOixiyKW2v0QwVm3N
         BDYfAd5iBqAdaKH81RgrP5QZ8sGzJuoXD6B400N9+/CW18rBaUaDPaNlam8seTpSDRB2
         fH4A==
X-Forwarded-Encrypted: i=1; AHgh+RpGv9Gx3PYrI/LWB6BqBPNY1gMz0134OPYcJIajmpZ+IsYKh3veE/4FkZkyvFf8Q3rer1ngAj2Mde5yVpOxu/9w@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/VhX1Uu+ve5HO3oz/E6bl29Jh2oGsH1SMsWRBbsND16aW/b4
	jNxnY+pdpK+GalJGfjWmq8fgUEyvsGX7nj2jT7gd/xQaW3ATmNLi2P9U9qb9UTM7OhtLs4IVbJp
	L4nWtt6479TF+NnD2pfhu5LS8HIbaeP2noLadifyHzuGPHuYMlwrDDLEtsbfs4BsWSEnvzjUD
X-Gm-Gg: AR+sD10d8b3kPDHfbOK+t0A6ITeGg832DsmUqO289uYWiXk6aiDKPHJJbft+2XSmDrf
	NvgMgMY2QE4ocgVcyUfbV66wJ5yF09SW3X3qSM9q7OLlCMoNUTr8UMXhLjwfs45GlsLc5M0EWWp
	Mi+owz26UERwLOBItOMCityK5gescmISKyIy3g1opgu8r/3gFLgExIr0ylZKPUheKRAOL1Nojs+
	PxX3PWu+VQGy+M3DTDDCBVensvnVmv5f7ZuCnnfxnMA6I6mEMsShdf1ESytHdHpJGuQxqmZFyIf
	WwHEnpKhf4O/O+uzh53IZegzjMjDvuEnO8q0lq7Mq/WEDIJ64f75IB/i768DjWAp07n4bZa3eU6
	qM78mBh66XsvtWLeLXvRrk2DHx182Q+kNLL+yokFxUdEeDJ0bWE+8aLcDwVbHxlwlNBbbwsQQoj
	CKyTSlO5cldwfynmiYfNK8vvE/fqgwaA==
X-Received: by 2002:a17:90b:5888:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-38fbc40e308mr8957932a91.9.1785754001077;
        Mon, 03 Aug 2026 03:46:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5888:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-38fbc40e308mr8957896a91.9.1785754000559;
        Mon, 03 Aug 2026 03:46:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:40 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:09 +0530
Subject: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX7n+3fO4/BUrN
 /sac7pvshl+m2M98MJMMBDaaISqEKInkA4q/q91MikWHvPwWQOyyHbs05PbbfQbLR8iLor8r/fo
 Mlg+DLlp0eIygM4alDARPDvVNHxVOik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX1fKLzm75uqO5
 cj7wzlOBWdBM6a2TI74cIeR2QQMms1Hnr/nAzHt+B7NHrPMYIkNnf0nYeVe8HgWhf0me2YIhJR4
 vZSIbcOT41Nficdt+IIykIIp94g0xeZ6l9aS+cyonk2c1DrA8d+nuxESWa3DvLLBZ2T3wupl7Lv
 6KFCZVBE18NDKulJ4GXWWyZSAjn/WXD5ObdDWahzJy+A7B2KdZkxv5ljjk05zK1GM5HUGgLKU0/
 rP8g7+M4gNad3Uo1X91UBDx+ZbhZFJXZc+9IdP3t9nJHgcoK47WKwR5u55FrXn1w1EyGyWqqHST
 UplPfnNLZT2Np2HJBxPQWyes7KUmQj5Tl4hSHDmAYx7/a1x+ySgymYCctSTFBw8yJBWvNv+RUvy
 wa4QmLJiwLSRENsNHf1DjMs/yK/T4W3l0TasQtoa2a2IrDcFnG+9sYFo1K+Nw2m/4j4CGLuJ2h4
 j9spUOUICTThB1io07g==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a707192 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=2haS3Ga0fGOBmvNocw8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 21mSojPeE3wvoE81nBqABvS4niigqn4a
X-Proofpoint-ORIG-GUID: 21mSojPeE3wvoE81nBqABvS4niigqn4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

Secure PIL image is signed firmware image which only trusted software such
as TrustZone (TZ) can authenticate and load. Linux kernel will send a
Peripheral Authentication Service (PAS) request to TZ to authenticate and
load the PIL images.

In order to avoid overloading the existing WCSS driver or PAS driver, we
came up with this new PAS based IPQ WCSS driver.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig              |  20 ++
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 337 ++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h              |   2 +
 4 files changed, 360 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5b56b2dcc725..3feea5bda129 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -267,6 +267,26 @@ config QCOM_Q6V5_WCSS
 	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
 	  a non-TrustZone wireless subsystem.
 
+config QCOM_Q6V5_WCSS_SEC
+	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
+	depends on OF && ARCH_QCOM
+	depends on QCOM_SMEM
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
+	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
+	select QCOM_Q6V5_COMMON
+	select QCOM_RPROC_COMMON
+	select QCOM_SCM
+	help
+	  Say y here to support the Qualcomm Secure Peripheral Image Loader
+	  for the Hexagon based remote processors on e.g. IPQ5332.
+
+	  This is TrustZone wireless subsystem. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
+
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 689686de0d41..f74519ea6502 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
 obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
+obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
new file mode 100644
index 000000000000..4837825d1717
--- /dev/null
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_pas.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "qcom_common.h"
+#include "qcom_q6v5.h"
+#include "qcom_pil_info.h"
+
+#define WCSS_CRASH_REASON		421
+
+#define WCSS_PAS_ID			0x6
+#define MPD_WCSS_PAS_ID			0xd
+
+#define Q6_WAIT_TIMEOUT			(5 * HZ)
+
+struct wcss_sec {
+	struct device *dev;
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_q6v5 q6;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
+	const struct wcss_data *desc;
+};
+
+struct wcss_data {
+	u32 pasid;
+	const char *ss_name;
+	bool auto_boot;
+};
+
+static int wcss_sec_start(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_q6v5_prepare(&wcss->q6);
+	if (ret)
+		return ret;
+
+	ret = qcom_pas_auth_and_reset(wcss->desc->pasid);
+	if (ret) {
+		dev_err(dev, "wcss_reset failed\n");
+		goto unprepare;
+	}
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6, msecs_to_jiffies(Q6_WAIT_TIMEOUT));
+
+	if (ret == -ETIMEDOUT) {
+		dev_err(dev, "start timed out\n");
+		qcom_pas_shutdown(wcss->desc->pasid);
+		goto unprepare;
+	}
+
+	return 0;
+
+unprepare:
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return ret;
+}
+
+static int wcss_sec_stop(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_q6v5_request_stop(&wcss->q6, NULL);
+	if (ret == -ETIMEDOUT)
+		dev_err(dev, "timed out on wait\n");
+
+	ret = qcom_pas_shutdown(wcss->desc->pasid);
+	if (ret)
+		dev_err(dev, "Failed to shutdown %d\n", ret);
+
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return ret;
+}
+
+static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			       bool *is_iomem)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	int offset;
+
+	offset = da - wcss->mem_reloc;
+	if (offset < 0 || offset + len > wcss->mem_size)
+		return NULL;
+
+	if (is_iomem)
+		*is_iomem = true;
+
+	return wcss->mem_region + offset;
+}
+
+static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
+			    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
+	if (ret)
+		return ret;
+
+	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
+
+	return 0;
+}
+
+static unsigned long wcss_sec_panic(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+
+	return qcom_q6v5_panic(&wcss->q6);
+}
+
+static void wcss_sec_copy_segment(struct rproc *rproc,
+				  struct rproc_dump_segment *segment,
+				  void *dest, size_t offset, size_t size)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+
+	if (!segment->io_ptr)
+		segment->io_ptr = ioremap_wc(segment->da, segment->size);
+
+	if (!segment->io_ptr) {
+		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
+			&segment->da, segment->size);
+		return;
+	}
+
+	if (offset + size <= segment->size) {
+		memcpy_fromio(dest, segment->io_ptr + offset, size);
+	} else {
+		iounmap(segment->io_ptr);
+		segment->io_ptr = NULL;
+	}
+}
+
+static int wcss_sec_dump_segments(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node;
+	int num_segs, index;
+	int ret;
+
+	/*
+	 * Parse through additional reserved memory regions for the rproc
+	 * and add them to the coredump segments
+	 */
+	num_segs = of_count_phandle_with_args(dev->of_node,
+					      "memory-region", NULL);
+	for (index = 0; index < num_segs; index++) {
+		node = of_parse_phandle(dev->of_node,
+					"memory-region", index);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		of_node_put(node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
+				index, num_segs);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
+			&rmem->base, &rmem->size);
+		ret = rproc_coredump_add_custom_segment(rproc,
+							rmem->base,
+							rmem->size,
+							wcss_sec_copy_segment,
+							NULL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct rproc_ops wcss_sec_ops = {
+	.start = wcss_sec_start,
+	.stop = wcss_sec_stop,
+	.da_to_va = wcss_sec_da_to_va,
+	.load = wcss_sec_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.panic = wcss_sec_panic,
+	.parse_fw = wcss_sec_dump_segments,
+};
+
+static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
+{
+	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "unable to acquire memory-region resource\n");
+		return ret;
+	}
+
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
+	if (IS_ERR(wcss->mem_region)) {
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
+		return PTR_ERR(wcss->mem_region);
+	}
+
+	return 0;
+}
+
+static int wcss_sec_probe(struct platform_device *pdev)
+{
+	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
+	const char *fw_name = NULL;
+	struct wcss_sec *wcss;
+	struct clk *sleep_clk;
+	struct clk *int_clk;
+	struct rproc *rproc;
+	int ret;
+
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0)
+		return ret;
+
+	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
+				 fw_name, sizeof(*wcss));
+	if (!rproc) {
+		dev_err(&pdev->dev, "failed to allocate rproc\n");
+		return -ENOMEM;
+	}
+
+	wcss = rproc->priv;
+	wcss->dev = &pdev->dev;
+	wcss->desc = desc;
+
+	ret = wcss_sec_alloc_memory_region(wcss);
+	if (ret)
+		return ret;
+
+	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
+	if (IS_ERR(sleep_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
+				     "Failed to get sleep clock\n");
+
+	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
+	if (IS_ERR(int_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
+				     "Failed to get interconnect clock\n");
+
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+			     WCSS_CRASH_REASON, NULL, NULL);
+	if (ret)
+		return ret;
+
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
+	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
+
+	rproc->auto_boot = desc->auto_boot;
+	rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	ret = devm_rproc_add(&pdev->dev, rproc);
+	if (ret) {
+		qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+		qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+		qcom_q6v5_deinit(&wcss->q6);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, rproc);
+
+	return 0;
+}
+
+static void wcss_sec_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct wcss_sec *wcss = rproc->priv;
+
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_q6v5_deinit(&wcss->q6);
+}
+
+static const struct wcss_data wcss_sec_ipq5332_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct wcss_data wcss_sec_ipq9574_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct of_device_id wcss_sec_of_match[] = {
+	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
+
+static struct platform_driver wcss_sec_driver = {
+	.probe = wcss_sec_probe,
+	.remove = wcss_sec_remove,
+	.driver = {
+		.name = "qcom-wcss-secure-pil",
+		.of_match_table = wcss_sec_of_match,
+	},
+};
+module_platform_driver(wcss_sec_driver);
+
+MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ef711a5b1a7f..cf06b9846309 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -204,6 +204,7 @@ enum rproc_dump_mechanism {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @io_ptr:	ptr to store the ioremapped dump segment
  * @priv:	private data associated with the dump_segment
  * @dump:	custom dump function to fill device memory segment associated
  *		with coredump
@@ -215,6 +216,7 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void __iomem *io_ptr;
 	void *priv;
 	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
 		     void *dest, size_t offset, size_t size);

-- 
2.34.1

