Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86953A1A26
	for <linux-remoteproc@vger.kernel.org>; Sat,  1 Aug 2026 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785547070; cv=none; b=mpx9XE/nqRDs/Ds+/hsSOeipxDxxUBh3CjDVT8+mbbfKkz+CwsRGH7/MoP6ZKb0AAeWKA4TKnavT9qCzn1Hn/GeQzgIgkEiGyJCvL4KUKFCGXSYA6DHdws8tng5h8unwxAXuT8u8QS/Acnyk6YzQw8q28W0Tzbuel27uX5KwlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785547070; c=relaxed/simple;
	bh=zplCsF0neb/nbCpzVWusupFmLPlDt9pZ/5W18e4lo0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NE9IPBIonuC//YlZKeLvdJUCUOY0gCc9VoBkjn+eGyRJYmPoqxBuqEoH2InhGmcL2IZSWqNvBCIoKQ6Kgo+y4afNYa8SlMJiLuhSQ7dSCUigWkid+Dhyuix0bBX7VuSg07GNFCHmF5GyfpF/Pau68yS1MmXIsjv5daKeJPVie0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GV9LEDDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZasHamk7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GV9LEDDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZasHamk7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0HP41294253
	for <linux-remoteproc@vger.kernel.org>; Sat, 1 Aug 2026 01:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BMqXxpw6OmIVHUih4+KItZCp2UcHWE2OBie
	OA5eZ9+A=; b=GV9LEDDST6w0Ssq9cHgL/8Cm0BIlVt1nCQyKKCFANsPZq4y7yON
	Qc8g4IQBkD5xM7J9RcvXgbPbHEoMM6BBH49c6S5PYu4/CqrbD7AkMNYbCcZZJpr8
	RhId5SpdNpahUu8+NhjkmNYXDN3WTTAgFG28y8gG9+jB2dKSUnqmIbge/RZxG+5L
	17ihFv7EqR+UHk+QDAdxGfgOlhPEuZ4KP3Vh3u02K9Iy7Zg18pkrzT2Sk2ESYF20
	6kRGAa/dcYv4vSuDos9v2O236U2Z5U9V1Z4+MkfMq1z/bOiiDIrVwbI9PPSl/CqL
	LmWlHk1rtxVLB+73v4f5ymG3KyXkakhMw8w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkk1p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 01 Aug 2026 01:17:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1834328a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 18:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785547062; x=1786151862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMqXxpw6OmIVHUih4+KItZCp2UcHWE2OBieOA5eZ9+A=;
        b=ZasHamk7+j1n4jAaZkyK2d8OtSGpqTSmSpJJdhieSK6FUVR3LZx7EuRaK/un+PHfzm
         Y9dE7J/VN/Am8Yej7g53fTNyiTU0L3nIGRcFPsJEIu7Ste/vUYcMhWqyxwVCPo/kpPz0
         d9M0WuFdP3XVwQBejqnc9hbczA106IPWgeyXPrWwach2iuB6OCEBdICA2w9sLQZBMyG2
         /oxqaoijT0ksQzi3JvCXNLyv35Hm9pPoAsGT5GiqvZ2an4gsia4p/q1Caxrze0NXvDlL
         lKmeCTAkOKO256+Y/3PkxyDcODg+YLHgByoe/qT9ARdW6ljKSVYfe09s7auzkc+3oygi
         benQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785547062; x=1786151862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMqXxpw6OmIVHUih4+KItZCp2UcHWE2OBieOA5eZ9+A=;
        b=Z0Sdr7Q3jEkayv296EMn6nKjEY+0MYOLowNeEBzaqq4512XiB03u55OyPyORaUWQjp
         2DUzJK+Y3i17/LADSZwL/4frnL/KS8PROEK/VovQt8Eqtf7dYwel7H/k0wdK18fma9cD
         bVIiHolwZuZWKIiisVVxfGM+ZITQeHmexlmN8dXpYPdQoukNUAuPWcZHkMYQ3UxYZbir
         G/+HvTItZfiuNmgaa2zJkDohCtMcsMcSiFdI4D29nKvFgDmQSgBJhHg5oNMNL4evH9tg
         FCol09VDR2GT6akWGAeCO5LTNDFKCzs/0U6MQF4J035FZcfZ/ye9r5NN8tkoWsF9+YBn
         ONnQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1IZR0/ZAVeHq/2WpV9Z8dGxdUymWaB+bHTH9TztyEEyx2LQiuW7a4ObvFj2KMK27dzfNFqqDU01lHMOB13pfR@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxmjQ7ZkY67kjDTcOs56eqOHBpMT/jBwYyAjcYmVQcWWZBBYe
	w+NG0R3oahI/GQ/gAAxDNrexqau0POsVCF9aFni79ZRCfF/tZkQxbPbEDvR3qACSTLxINHQUtKQ
	rAuhqP8mudK+e/mA6TonKsL6dVfYli7U+/NuWIFbPeGffJ/alyiq4Ag1UyXAqryHy9G+owehp
X-Gm-Gg: AR+sD139i2aJYtQQr40W4M5CX34jleWwPnTqpHsiPWeHo8K09z7VRufY1g2nosxsy28
	FCfSkVT9hsvoBC/KPpe62xzLigrCulzGucBKDq90pLStbWFTdiM2LL5tskCW/7axJ1r03ilFJLb
	g+y/hGElNjjqZ6y+V++3sBnkR84mhjIFqxAtJQUyVq99uEvOs9wzCCa0pjd7+MWj+D1/fWfhQbL
	Hqhxfb9PJ7hdVeArwDZDFkz79uPD9wtm+g0SwSmbB83xnGyMRPjDSoastIlDJseXa/IMyn2aWku
	8ZuC7FTPBpjFDjaPp13JbFkkUzyO62+lR1jste1jSwrT4bJkf0BrtAbcePOP5Lo+bLrVifWY36r
	+2PJBd33YupF4s8D8dz5FHfAAxuk4a09/nP0IpMaNtQk3uQjnRn08TWLgXtt0
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3c92a4d486cmr1695218637.11.1785547062009;
        Fri, 31 Jul 2026 18:17:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3c92a4d486cmr1695192637.11.1785547061491;
        Fri, 31 Jul 2026 18:17:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm14226635eec.16.2026.07.31.18.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 18:17:41 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] remoteproc: qcom: q6v5_pas: Don't enable handover IRQ on attach
Date: Sat,  1 Aug 2026 09:17:31 +0800
Message-ID: <20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAwNiBTYWx0ZWRfX+Z9s5mvuc1p7
 2PjvKdh1XdEVrVM8KZHCMjgMqEJ4L0Cbu/IF4PvsiFyiPJCHzqKEOCim55lkKpKK2UgsrjEoCKe
 ZLI4dKujWuaXsQAzpY4nv/6IHbuiSwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAwNiBTYWx0ZWRfX7x8Z0riLoZBC
 D0HvYP+FBhcq1c95IacpT36weIYwzCCkg02Au4VSw9seFcaoP6IoRuiS03DvLXIIABII8iKKzm4
 kVDIBVyJty8BIdRaws+dOXsSRVtZdzpx6xXsT+s8N8p1dQ+hDb/MetGMtR13AIx7elltm0uX2T8
 Iv0wQMeJpduTRL/P/idtrhUC7+AEiIMx1nP1L+dU+5ctisIa0sK7wAaZpzuA3O2mKo0/LIiQQl0
 U3LT/PS5bibhbLNx6sg1LpTcpJ+Zio9ymzdrEYNBjCC+xS4vGrBffyxerBmfeplkNkEofwVtdqB
 SIcJEGjQk7HmbfQC8IzqMtMyTy9CVl2CDFi1S9KhFHJTvG1tuXspsbR3IiPGPuZCDOLPzKLhaa2
 yM/MoDDuK9crNdI7NrPkml9Z+8i5ErvfylNwtjB9AwexlDy2Pm3EkaSKxyGENxlfxprCuN5Zo9Y
 MmfEQi6gs0LvRruhkYA==
X-Proofpoint-GUID: ahIOrsobkdENoltyVhSqr1DjcEM9gugZ
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6d493b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oiTAUctw1WWswK-G1AIA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ahIOrsobkdENoltyVhSqr1DjcEM9gugZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010006

qcom_pas_attach() unmasks the handover IRQ and marks handover_issued
even though this driver instance never runs qcom_q6v5_prepare() for
the boot it is attaching to. This was believed necessary to flush a
stale interrupt latched at the interrupt controller while masked, but
the handover IRQ is a Qualcomm SMP2P soft IRQ, not a real edge-latched
hardware interrupt. The Linux SMP2P driver updates its cached value
unconditionally on every notification and only delivers the nested IRQ
for bits currently enabled in its own software bitmap, so a transition
that happens while masked is simply dropped, never replayed on a later
unmask.

Since there is nothing to flush, and this driver instance never takes
the proxy power-domain/clock/regulator votes that the handover
callback would tear down, there is no need to unmask the IRQ in
attach() at all. Drop the enable_irq()/disable_irq() pair; setting
handover_issued = true is sufficient to keep the flag consistent for
the eventual qcom_q6v5_unprepare()/qcom_q6v5_prepare() cycle.

It fixes the following unbalanced runtime PM usage and IRQ enable
warnings seen on Nord ADSP (probed as attached), after commit bb7c5d6f5b41
("remoteproc: qcom: q6v5: Make handover IRQ one-shot") comes in place.

root@iq10-rrd:~# cat /sys/class/remoteproc/remoteproc0/state
attached
root@iq10-rrd:~# echo stop > /sys/class/remoteproc/remoteproc0/state
[   40.004874] genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
[   40.012409] genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
[   40.050074] remoteproc remoteproc0: stopped remote processor adsp
root@iq10-rrd:~# echo start > /sys/class/remoteproc/remoteproc0/state
[   44.350298] remoteproc remoteproc0: powering up adsp
[   44.375769] remoteproc remoteproc0: Booting fw image qcom/nord/adsp.mbn, size 8241816
[   44.389850] PDM: no support for the platform, userspace daemon might be required.
[   44.397864] ------------[ cut here ]------------
[   44.402633] Unbalanced enable for IRQ 363
[   44.406779] WARNING: kernel/irq/manage.c:775 at __enable_irq+0x4c/0x7c, CPU#9: sh/791
...

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Fix the warnings by dropping handover IRQ enable in qcom_pas_attach()
  (Thanks Stephan!)
- Link to v1: https://lore.kernel.org/all/20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com/

 drivers/remoteproc/qcom_q6v5_pas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a4b233d92efb..bc565979a5a7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -521,7 +521,6 @@ static int qcom_pas_attach(struct rproc *rproc)
 	int ret;
 
 	pas->q6v5.handover_issued = true;
-	enable_irq(pas->q6v5.handover_irq);
 
 	pas->q6v5.running = true;
 	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
@@ -567,7 +566,6 @@ static int qcom_pas_attach(struct rproc *rproc)
 	pas->rproc->state = RPROC_OFFLINE;
 	ret = -EINVAL;
 disable_running:
-	disable_irq(pas->q6v5.handover_irq);
 	pas->q6v5.running = false;
 
 	return ret;
-- 
2.43.0

