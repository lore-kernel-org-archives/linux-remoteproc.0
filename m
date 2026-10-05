Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC737E5E7
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198928; cv=none; b=Dl9WAuF61uKlD1g+tMtzqFvlQMFhX5HABZ752nJ/rn/gi/1ULfVlOMceGFv89FSQ4SHFQPXfgbUE1r2ZAWHo/zSM1i2s8OCUWpFfaityxy1/Qz+m4RLF0XxRsxo1Slp05e8HaBq4f4dVr3IZ+5gcW350kbjcH8xWMWY2/eembpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198928; c=relaxed/simple;
	bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaIgfWgWvayrwb1l9osnPcxkaf5lJh46Kp0dWdp4TR5Q2INsVV9bxoqY9hu4QMMpCwmuNAVFmzsEtQoVXk3Px8lvuU9vE58Xes4S9VWXW1aRQ/MjeLPXG4tOLPphnvF5VxgSPMPqh3gjH2hNMVlBwTiG+3BjNPgwIusxYNYxtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfWWb6kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXaf4MLs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfWWb6kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXaf4MLs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoEPt1344669
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 11:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=; b=LfWWb6kSDgH44Jbh
	d0xVrKflfiSPFoHkHXnL82awvAmjwEcZTYBTD7Qsy0G+RiFD6j5lcTv750NKMw0b
	ZV0YeDZqICmUFeqjd/LT1hxU0gmN/p+6SjtnVEM+LAgJqoc0KJJn2doqSHoEWOkn
	4v5qmWu8YBlq+Q41aiPC2pU5BOrVl0ph18JqLLzV9ZjqwFqz06e+xPPkUGIpD653
	Ob3opncIFrJOAXdwvI1vh2odYmJl7WuWn7mRxWpZLvgKazDu0OXiKUtfTEWBAPh7
	RTQD2y2jRHHVM1lvBIwP9isjILUbEdWwTHZqUili/u6fHxWGeRBdfGb2iED8FJlg
	MG0uAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dr4b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 11:15:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b59692e0dso1489770b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198924; x=1791803724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=QXaf4MLs2orzi64HTgb7yUdBZXvEyhcjVBCk4Fuyb5bSO/4y4qsJGWwIcAMxMx6Tjo
         29jm3SNQnI62q7ZZ1Cbj1Xv+2Fr3sEQS2CVVVA6ocKr9mXcdMeygEHiSOtz2L+jZCYiB
         +vgVchnf3fRsl93AiuP+r5zNaQvDwxXtZabZT99SYfcWDRhJh7LMhUalYgty35pzZ5s2
         1ynY/2bvQSui14Kz5od3oRbRNUyrWi4cFeXk4D0blyokappbDayUKFV8py7+Bff1/fhe
         00Ip07KP82puS+xnp27CGJhGoa26PhVIyt/BLp/HkRsE/74Y+nQBe6cQGUOyuV7cV13O
         DM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198924; x=1791803724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=tJv0n5u1L5ctWe/zAJ/EDeECXr9r1x/UCq2o88nRMXx7R34sxh6KPLhe8A9lr0ebYT
         LuDv2ju76Qcc+jmhr9ebjvreIHziyrEff/imNVIX5jhtuBoPPgFgWAt0+U+d3D9H+/0A
         /qoX4qe9JEK9jMXSIUR4y4NHPrNYPu3pFkUumKCujN4GL0nPZAo792Wz8Xi98MwLhLfZ
         nvV8ydHgp2wmWyOL90Pn6l8l6QoMXxMQyqOXxkumaCfxaZGQGMB4lBLxI/5kd3wBOliu
         SHNaB435AZJCUlNt+gPxUq25NYfWTlv+JmT+eSAhDODl3MKWdpLj8ktDy0TDm1PpbBIF
         dQKg==
X-Forwarded-Encrypted: i=1; AKwUvByCzzsOeDG0yZTpnK9t0VWMHW4XD5S+9gujSR2GIyPPtIjXOoIZYTWT5YfgPPLe7A/S2LqipHKE2bD0iFvWtCOk@vger.kernel.org
X-Gm-Message-State: AFuF++nYf92pNL3uK/pKXe7Bw1+9ayyl7uyNlnukHoGPBcvTfQR70EBZ
	8rnmHuoTJ3l85pYDt3zULeI3g/Mzrn/+5V5F89FZ9Xs+sDdrOdD418Ewn3o24m8qzPWeqkg5pzM
	j0rXgziCGM2Xq8ZFT461NzFQ1pxBOReMT0IbJor6gJPDgfncLsWvDSW6I8CsP0e0detDkXAtB
X-Gm-Gg: AYBFou1l8irsc4CbAOWHL+9FsL4Iyq5DkCguaExNDeTFW1kBdVVF2ofdmoA/1o9FibP
	kO51mm7kWxmdMCXL3AA/ApqUtjU/0yBqHYRsyQLat85IBGgXCXRxlwGF7NW3OECdXfMxlQl/e+7
	aRKHZaSBAiPnOSTKy/JNtVn6I6Su9nTBsldsehPm2uoOc31iiFhVPN5AxeHi7YTe6AKV9w21VcU
	bJuuxuGnCWBH+D+Jht3QkT9uVwfjmDqzuGKH48PbMbbGaEJQIxOQMz4PlVAt3Wtz7T7GJ/+BPq1
	oAT86FlCsGbr4Q17yhHd0IQg+0nyXDAvzHpgTs59LcGoWUSf9YTQdbAfhIplKtPIg87XgpMbd1+
	pHU8mhYghC/119w==
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121571b3a.8.1791198923263;
        Mon, 05 Oct 2026 04:15:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121537b3a.8.1791198922775;
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=2800;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
 b=YPUoiHynD+erhLO/09Ji5++tV2ctGKv9cC8wtdDWrfaFo9zK7Gqpleup7dSXecBB18xuhDAmn
 LgzK/jM9eIMCthYYb4vekTFsUfG7pEqqQLYF3dQ10EYhRMoKfKshBpg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX8MnUOjDbf+d4
 2J2c9gui0vx66DnzxrBWbgHGImW67T4cX681M0937uB3TXOt+9c20atRL9HnEDOfRxX1KUR4Vl3
 otu/qrU6xGkH5q1pGIce8n3jLgbpBuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX0yu6Qtb00EGp
 kto/ttquxW+VicUKbv867zlQMBXyDPNaIRxOVLzJMM410/OC+XvEO2h+30U2WYr1kvLfEP5FGWE
 Q73PuPFpkR5sJkOc1K8ze+M9yw995iS0VH/doFocUImwRkTqZELpTZAxLxt1CBMhHGnV8jYuJdP
 iHl7dGUatF3QQoypC3HS8JxNgPZHTH8/KP2hoRPZIXEieVcx7B5SbobRyiXQ/4L8EkTDIKpBGVc
 bq+Vos61NKXGUuY94N4AgFWVzOEJofG1mjcWbPj44chTTbUnEFQCBsddhN0dzuRMddu4s3l9xNT
 +EKzs1oetDLeM1pHBg9l/uSWUR801W83PgEyO/mSwmSVA/251Jq/p4lLhoQKx3HleQTkgtOJ4Rq
 nL6ztkKV7Ock3nX70wVrg/HwhuemLVKkeFIoq1Kj2X9Tr1dMK5CfcTuOQG3zyKoqaHsArhPub7c
 4Gq+7IcSy6slmUd1Z9g==
X-Proofpoint-GUID: TGWViowmFMUd_WrONI-7B9i89CwUTWWt
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac386cc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: TGWViowmFMUd_WrONI-7B9i89CwUTWWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..296c53b82687 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -373,9 +373,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};

-- 
2.34.1

