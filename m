Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BF423A80
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889584; cv=none; b=r1o1JCCGWS+vXNN+q8BaA/iQAIFuCVVRiy/M7xTANebX2QmdKdMYo16qYRBfLW2zunKiua9vTpqjQtRhedeuLlevVdE1WcvEV7JcUiDhFfoF3ZIiuckVojl1y02FnWw+3iAAB8o+UeeWkf30W9koDXiAKS9+giYGwfecmscYqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889584; c=relaxed/simple;
	bh=0YzZDwNOI/onVZdiLZlMM47FfMeGDrDDZthxQwRvTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APmJ61/j/ve2ZCS7Aqc1HdN594vW3PwTj4/5b5p+go55nVOFenqzcZxgdjLFBovI/EWshPgePU7wwnUhRJ76Elf1+c0Tu4n7fJMcv+4rPi+xmaBj1/Sx4XLywWkLgQsJPtMYyBp5Zool6I/6HOrh9kFPCslc0sOGGmmZ74NREzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAQdFop8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLuw9vcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAQdFop8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLuw9vcg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0xB2917066
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4TIXsfQ0zT
	s/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=; b=dAQdFop86ntSkWlsPIDiLmlm/SA
	wE9nm9pxDjBFAeFnyYb2tPDNAkvZaFOpLYafoXnK2BlOeTBtrylI+zgH6rcLdzE1
	fBG6/NYL4OEbAHUw2WmPUCT/eV+SI3Uif4uIA3nrByTOse2sC+9Rwdi2U/anGYcX
	XSGA2bSQaahuVH2yK7MeqquSEtQM14sKnR1CInavKssKpdAYYwgurBM7m4ls568K
	8ke/QSYNkdNvFHTuGYt2clw/TQHyztfOj4jIyzDve7UluoOU5PFIlnIjyXwjukns
	DiHOKju3L5g7iJb2+ZuanyeKP5YLOUU7GXqEtN2extMVQYv8YOPasO8CxAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vksej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so297928a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889576; x=1785494376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=BLuw9vcgWWcV1DZTKBEhqKwB+oBzzXUkUTTJtWXs0r8SnUW1ZsXUknu5AIUK6hUDJM
         mhwZ+PGLnD3Mpe8gLCSQ2gUkT+lCORuqDDbJBMjbaubcrK3biSSwSLtjm1dP5EXIxdr9
         79SRFU9URlICJZV0XJgCfNNomrcdIhmS8GvJQO8DjnFpIFi6H3YrMLwQgeBxUfcrH6lN
         Tmexhu2qUL2sd6OVEuGvdz27OUBZmFFVf7LosR7dYIhlAhKNJKB+j2xyHBKP7wigqef1
         WIfccHHgCIkVO39oa03HNn40O0ozr3zo/kAazhO1ZNtK+FgZVsFlFc9z/NaA35JzA2U1
         cIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889576; x=1785494376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=k4RJ6IUjrAz4CY3+kCMViTorxDfJ7xk/n0Vq+6BpIsMKIrqMDANh9TIFr+Z4KG1YBM
         MaciDV8oDi3qycrbAnsw1PTNppgs98fbR088QuoD/ltJrxCAYkiJTxU0UQKPFkzAXBcT
         zAzpzq3WUtK4cSbxHj4fmveswP/hOFpZALDZHb10bnxaXIg4xFdzIZQ8kcKOsm/T7GIc
         c/GLzu1qYwfwdCiHsZoqPRZAIKhvWJyDYi1R8trxExUDRMKgSllN5RCTlysAwEt0jMH1
         vNfKSNdx8N6itoIM8SIlSbHJNOfp6y7L3VSiHQ/akst6farMp6iFbxM5IFI1ro101b7t
         Oo0A==
X-Forwarded-Encrypted: i=1; AHgh+RoVPdBXSne8ExRXO6iU1ryrBkM9Mdykpz11VsWLZFDfID8rnsVREfiiy/EInhJTt0eslD0JDljD9Btda4BNFtPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyv/kddt0p+r9fBJhYl4WXAnygGurp/2Xam/y+yuRyDvlVvCei
	pLTGN0+tUydfj9R3M2wHtbtFptrp31zj7nNK6xGi9kLxbLtVnf/2Jqpvaa9g2eUrP19gh+GTGFc
	y6jSr9W9bUTMwY9O8DksqT9F3GTzyez3q7obXem1vocDYwJ5XE8Gkc6cjwewQt4hQ4hloKtRO
X-Gm-Gg: AR+sD11362aywwfexZ3QIm9D5sCDTM05x1sm+SG6mMCER8SJzlNefqA7O19XauzDw/s
	TR4g2fcnwOpI7fS9y5TzBGdrwlsb5DUgEVjBeKT/Fj8PzuCk4Dd1ds+Fu0mwoPj5CHVfkBKlHTo
	i+GYWN/+NE8UTPFHyNfXuLrrE2MEVwOLI3wwH9ApZpTynkk6vH1jHVwPsRVUCLGwdAgCW9M2ARV
	KFjV3ETNODhPw8Bv6uukHxvXmdVtyoWJyGUjEWw8cl3FlVx6RQ+uT31ed1OoQ2ns9y/z4FFwxFO
	51a87eZZBwhRq8HRfLv+LjHXrbw6ZEo4ApJiOwicT0R6CghRI1iTbjrxF3iMgwseukhquZBUs0A
	ti54t9/SFALNS67mlD3ZtjBrgK6nCWC3gbn4SRB6ZQ0jGIu8hWctladdxZ0zA
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158885a91.7.1784889575803;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158841a91.7.1784889575244;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Fri, 24 Jul 2026 18:38:48 +0800
Message-ID: <20260724103848.233804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXxoqu08tx4kGN
 NCovCBvWL4zChexOsLNoAoM7u+KHANKcz1bo43v0YON29/QsQBQ/W9eLOkM5jJTzuULRJrv7dl5
 k5n7717KoUsoOSsf2+xdz7Y8gjy1DTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX94zTY2hIvwHG
 7DKIFB7LRERQogZOVeTS9PrIyISwbDWoBC7UBMi4YLiQQWnXhZZb+XsNjialLHuXP2F+OPiAURt
 m+330/VsRZGR9KvO+WnPfarE+Xbm+8+3DUVfVhxEkuZ8iAfHFiyjKGt/XTQJeJLpktmaWrbhZk6
 48VETU9ribTWVFhUwnlHGcUHiBODgNpodddPWNpnWHXcjZQWcT+L2elZzSA1hJxa9DfGwv9J6y/
 chDYCL5ckhQMXjUR9vDaGck69tiabMl/bu5AzZgB28N34KEis7bAEsM1AUcWFQxLfsugDr7W7q8
 g1HK30cy1MmE39r7yuGTGRi2VK8F8u5fMtvKZnzqkr2XmfMq/3gTHT9sj9ykQ2s6PL1CdSsoyRo
 5DEXqIo8mGLKnyOZQn+R0Uqt539M4xyqxO1RqqcOD3IhAIg6k7sX2JPYemyhvcQciHiJOX7X7EA
 d5ZfEArcwPvm/fexOsQ==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340e8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: x64usLjz4ZgX7X3J7WWQ416ahEiCxl3H
X-Proofpoint-ORIG-GUID: x64usLjz4ZgX7X3J7WWQ416ahEiCxl3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..6f3850a3fa9e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mdt",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mdt",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

