Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D93D3488
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175475; cv=none; b=lCa3rP90Q87jAfHHRD9V47bLA8OuUnpejb2oRrKwRb1DI4oV2OVhEZvQkGb6CoFv1pilG+13yXh7TDn4ygUx22dxpfzrqqNmZTzglmhMmullcXmNrBCQmrSF2YHg3REGgpw9Szyur5HRl7dggd6y6/0xiVjsA3k0rbZanQnj8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175475; c=relaxed/simple;
	bh=QN6kQHSZ7wMJTaDZlVY9p4d8+XLr8TFnK5FsU73schM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2rwjHCqWQFeJ/v1BkYEf91Chh3PgcR1A6HsjUWC1CNIVGVAZFUylDK95srtUbrTCy5QfBrY9xdz2G8GOUgHo3by/g0rw6qn9INzvaFY1ERPj+FeA9wZK7twz2s+WkiK1dFCl6zJ0xbTvWf/KdcU1GllvHFaJQKWgx/5LDm5iPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS7djqFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuT4uFsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS7djqFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuT4uFsH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5USEu2438091
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=; b=XS7djqFQCZ4May5D
	XJ5EU5SHHCyeoe8/QcplgSrKPENwT28a1tVte8qHp7h8YHkjq/xSk2OEUcP012dT
	3y/z75qIqiEBdN+CxcoQ1WFe+5D6b126iIwaDlNKB/sb/E507IYLNSfaBwv9Xges
	5XY8V4JzwVTdzbNCs2a7zXK0RdWXYmOZYerOopVsP3AHaxXJ40crKukdSh9CSBWa
	STOEgVR/yZgrMoALNxohBCJ8VVMJImZHPXHwKCCFH3S7IVFewBoxqUCxcwqesifF
	my+2pzpNrnD94Av5JkICB76aQYA1nsU8xn5O28iocmYYKXwUHWYMFNX56wAGvjAd
	fxB6KQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3qeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6223294eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175472; x=1779780272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=;
        b=GuT4uFsHtTdD04WW4QYJqUHRizT9xlpkxwUuwKSeFtuKs2XZgu5Hqhs9tIj+wLXpLm
         S7Syq09bIv9vACJ3MLHPfu2kjhgvDGZ5RsAcGzJlyIAgGeBdHTCVY29M1ZCKrcwLA6Nb
         Q8z6MMF/IpC+0P5CD0+p+vhE9tNRgOCK/+c+7ZV5fNgMRcgtjleryT8bHi30eJnWMpjj
         1ZoKFbs5ssJ52Ulqv9SdZp81+syfR9K9CCgseGg3DV/7HOagpS5Nyg0NVFzGQ8rU6rOV
         3P2hwQ1Fa+GA3X9TX2hRViwVZINNRcgwA991UHCaxSATb73zGQ6M5MxFI8mQSKXxjJc6
         qsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175472; x=1779780272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=;
        b=ax0EEewZtPXjzCnP9ng5KkKJXa18GB9P0ejB/kAcsn3UUJHwQnSF0s/BYyqFiptBgz
         hZqsG0pLSS5PApzFLisHdFIDe9B3Sy4N3l5ZDwe2OD7C4ZMFMZW+Uz2SA6Iam0azLHGp
         vIut7VZbQRQXxn6Eu0nw5moPY08SuUbIXyXtjzKRCWDGXOkI0qKnRJNKiooC1giS4gBu
         APwnDdHya5eO2hnR0kEi+yoM1jbVqfpfdXLJMjX7PlM8F6556gQQ2jkpG33qSeACT4Cb
         ohOCUCu/LTmwhnY8OKQyxSerycv67Y8Md+5rSt/tS8oQEuODaR2qGjsn6ZF/qOH0oAei
         vkVA==
X-Forwarded-Encrypted: i=1; AFNElJ/rhwPBFq7Ob/tiFHGDKthJ8fGpf/0WePIYB1u6LJkmpZD3NWZvWxzBE9+E+23CUnyVQC+wA6WrLkk0eer/qvGi@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2zrEYj7lz1FuVzOrRG5SvDi85kYcfcXwWGQ+zOFsxht0LRLG
	Q2ewRbTu5Y1SSFct0aoEu3QFPN4rxuefplFFVVtL8IN8PKgzlcTG53lcR6QUoBZZilZDqkJfotD
	2MJy60pkSj8sL0X6IfesbBwzB4f3IYENe11agdi4M5nCJSdb9Hu+LewI7FVwXM0jl4/7NnQcb
X-Gm-Gg: Acq92OHp2+ydpXJWDCsJCirvB6XhDemRRcs7XGamx4bPwMZ7kkcBRee3N6URfIe/yYh
	ixQfPbN+NMy2aBlmJdaudqLN4efN09avB6AYG7D58HqxYZy2MztQuxRQpaL/jmULsHPZ3RIyRM5
	qxZjnESS+/+H42pVEb30eqIB47l4cIbDVoh2SIQF1JmejR5PgxJ80sr0d0fwrDIyHE2CgHrwZcA
	nQgiz3GoYHDsgOldr2w92sKKbcu5sZIhqcr3PHnirjNJWE4LyUKV/Pz/BADPoAK5G1NxFTUCBbN
	VfJc+NdgPmbXX8dN4mARv6oiXbo30vMPbvNWmIfqnVIQGnsE2jIwB2HPcqmg56vmNy/bsWefguX
	n/RU8KYnkT/+OQFT1DAG86MTPizsz5jg/KcFx8mDeyEIR/U3C1+hM2rAg3lK/IUWyL72wDB0M
X-Received: by 2002:a05:7022:388a:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-13504414f41mr7181984c88.15.1779175471652;
        Tue, 19 May 2026 00:24:31 -0700 (PDT)
X-Received: by 2002:a05:7022:388a:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-13504414f41mr7181967c88.15.1779175471087;
        Tue, 19 May 2026 00:24:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:23 -0700
Subject: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=3683;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QN6kQHSZ7wMJTaDZlVY9p4d8+XLr8TFnK5FsU73schM=;
 b=U9glJukBAUOjsfvyNq+Nhh0TZrFm7DSDSVRT37fu3rqk+uheQ2fkKGE7qnfPlqsqQxPipbAGm
 cvawG3nPFEHBEUhzhYx3DOPyNbKcbZ14h9gM6aKUHK85zqqLlI1CiK5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c1030 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jQEpcGcuKFcweVAcgyMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 8uco6nFkid9c4Zey-cWz52XOuqdUiVhh
X-Proofpoint-GUID: 8uco6nFkid9c4Zey-cWz52XOuqdUiVhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX+cGH2bEe0fa5
 DX2KH5rlw5JkA0sLcTMNMM/bkKOTevhITuW43NH3DWZ+mGAilap2j3BqyK47HndLGI3W4RVh81s
 cUXHurKhRcWHY8ecYiFZMGw1xHBxJiZnQ12L5Kub7wLbh0jJyZlP5fMRKK3w5vKHbdulja7dNkc
 tyyEljpzV9f9Fm2S4yCEMDGEOrU0gq9APte6tHUQ2jFt9Kzn10JX4KSdX1sfx/3zhbnXcX/vUPs
 gLZ1IQZStN1DQaJSBS2+juxkxO4YDsxPxktBYtDBDyBdolMvy91qaCoxJPox7dMMFi8QW4mOr3m
 NNzjeghChY003KD3EYm31zlc1y3a3mro+gDFCTwI013cumqcwcEZUHsW7D/4zZ/Ahd7yWMTrZdV
 BEGWrbHWHaKgolCfcdCJS4ISrVIPQUpWDcQTrg1JO6lOWMI9/+dDMm3ezDZZAXq78wupbrro22W
 PG915akFsF8FWYQvKPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190071

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the ready
state is detected, it will be marked as "attached", otherwise it could
be the early boot feature is not supported by other entities. In this
case, the state will be marked as RPROC_OFFLINE so that the PAS driver
can load the firmware and start the remoteproc.

Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..ac2a00aacd2e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -60,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.handover_issued = true;
+	enable_irq(pas->q6v5.handover_irq);
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (unlikely(!ready_state)) {
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
+		pas->rproc->state = RPROC_OFFLINE;
+		disable_irq(pas->q6v5.handover_irq);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	return 0;
+
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -518,6 +570,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -529,6 +582,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,
+	.attach = qcom_pas_attach,
 };
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
@@ -855,6 +909,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (desc->early_boot)
+		pas->rproc->state = RPROC_DETACHED;
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.34.1

