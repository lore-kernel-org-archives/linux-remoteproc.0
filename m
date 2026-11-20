Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180917;
	b=krcbSYPL8VxPK33l/VEiUWNehai+T657KbUMIj8eh90YPgKmkRc6SuG10DEe8aGKnafD
	 yHyB18LC0L+jfNqR7K2B4Wvg/dAJHZ7QlULSecxXvTKlP5J5XHRbyS8JS/VEzblTA8GSi
	 hOJN0pcPCVUo+Hx+a0afHbzQdEcf/DX+6BfU5KgYu/0QhDzMBuV0hJrBGPMMsNDCS2eEs
	 hoh08eGoTYX6sVQ/20gVImnT4N7r7r3xQRn6483rRd2b+7r3z49CHIMNnbh7JR/ukjFS/
	 hh+BZL8GASQVBYGJwiFKEAQzZG3ivVSuducn4q7QQDAKWweEz1ECXN+q/nTjfwjE2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
	b=dOuqyU8O/9zQ1qKz6KIiZWnjo6FHHoJ0r0/plLAXNBq3VPH09NX5l4Dro2RyTu6svN/y
	 xwGZ6gkWinBpkD/ogdjqiNEvsyZa67wc9n0/vvAohZYdu+qpnKYBa07hj9bXwXioo+s77
	 7EdVzuOuFCZ2ZjE1djDrxh7JSoDcUwaqAQSWKtdu70XRrO3T5ueTKZZ6axZp8rNU4Xxor
	 j8ymJJlEaitCvk+gXuGeZSE772w47zdr9XyMLhRwJnged8uwiu4PSs1KUUHItgwCH/kvJ
	 e8I8GrIb7Acyee4zTgQ1t745q/fNNmqwYwh5J0FjqbP14KLCu22W/4aC6A0rjI6kTSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70579606A320
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70579606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK3l3bOr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e5nNF9W6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1QO2433162
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=; b=OK3l3bOrsZu4/llM
	d7vJJWbFoDBJQK0wfpkEKMLb5MUEJYmDEnXXa5Gk+Tu9tOT4PKIBrOxtz717P1fP
	lKCem2UvhQKu+9GBGSPeXLCXHuya8WEjMgAP/W1DD0kHVmTJelNLIrtsDURPeyED
	UzePuZ3InEO/Tuf8KPyUv6Y0VjesZ9IgCanRAA7QM3B+nzMLJqFg3o9qZABvhqvE
	kAfr7767VyLXx6X10bDTZEpHD7Nx0hcjry981XojDl5dU0IbE8MfCqUfzMJ3RBKe
	6nnpeRAectqv9Ggmjcfu1c5KSRHOsFpfEY0ZozH2BPjgyZkNl/XoYmkArjzbNgp2
	OvFLrA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9yg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso2061791eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180915; x=1795785715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=e5nNF9W6Cqvx6kpuZhhnFslIQlwunQZ3lMSm6IoxGzd6C73Yc2/df9EkAiHLifbZrs
         cALXr8kEvMMn5Ce6fWSH4gNcVkOlL+97ih9KWQcq2lAZH9bz+8YgopVOJazcPDUlC4rW
         SgGpFpYHL6DAYI+DfVX/jWwunxTlfHBho/e2l6w3kytzTtnwkJ5K0RrSQzctTLeJhGt+
         9HaEgTo3GbVnYtd2SHP/5b3xEIF6xFcclLuzsZxqH3XxuFFpGy9QfAakTRG3DqUG2g9+
         5B6d8cmUwyLnq6qcOFB7XAGxMXdinhx4F8Al1io//BB90+BWd2DG/OKr9oaNtLBtpP69
         dnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180915; x=1795785715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8X68sWi+l1AQF8yHdHAM5F5Fm/jhGWVAFzDBXU7uYs=;
        b=JBvnaDaqGfBxvhB5WJlwlKYKBipwjOxFYdsFF+6Y1QzrnSHjMLeAGLfGrRyw6veEbh
         r/4yEtKeC2LkeF40oREF24L3u7T0F+vhKqmzb80/CwqtsrU02rIyfXC8wuj7gfhd5T3N
         3FS2mwgceVJobZxjdLic5WZqlNOTuDRxlZxsi1Wf3QmHlO6v3Ajx87DR1Gp28HzURGJo
         fmyynKIqElhCH3HgNX8nph4v1gveDDaes54NkOgp6bin0syc/S29mCiDXi/n77t2KWpq
         NCeDvBsdzTVwnHMmGjjMGAH47Ol6e/ZcnZ9LGKPOFfe9AeXdluA8LY/0b+coNjDJ12Zg
         BiJQ==
X-Forwarded-Encrypted: i=1; AL+hErH4FV88jSNJ+9hMnor32l0rHjui/td9i3zz6JFOO2Kn6qLAWCmqCehYfcb9Rti7z9ziLa1rEO09arBuebfcS8KS@vger.kernel.org
X-Gm-Message-State: APuU4Z8DWE36vk1GC9CYW2mnsuFmLwVEVDGnpmNy8RAGInrXpaPqqtHU
	gdERWOh5kcVf/TfeAN4KhVXi5Aa6RjI+1AgoJNZjf0043FiV17UuD1B7QAlOgQ9cXZXg+Ll5wlC
	CdDk9wOvqkDdqF3m5GfEKR0OewtPfaS42F+jMq46cYY7Ita0o3YkrL/4T4lwXRFy5lPjpP1Hm
X-Gm-Gg: AYBFou3NSuHXB13z+sC3ERN+W0rCYuw9gk+x3qIteelsr062BNP2W5J//WlzG0DIBjV
	KVsJdAXkpoalgATVdwc87v7GzWRQsPkU94CtIwQP07HNpA0kGSNEK4cXYo5IP+tugq56N6W1kNL
	nQii95N1p79ZQ8PvudEtA30NtE8OXKHd25l9ak/D8QAmIM24H/4HGW/CZgera1xwmkzx/G1hJon
	dqBYMlXqJCzx8Gcj/EeKRTSnD5N4x/aLB9cqY/Sijcpv/R2+geECQcWpsF8sWjfQRjJpX2RLBFB
	9ZoOuI2peut7F6Nhq6IDBXil5RjCBvmF2KmFWdCSr4xAkZ1IiSr/Oz7PPHNVZbWbz3VaK+DdSl5
	Ik5h2EowZxHyBK5tgOYW0gjRbR5YNm9zfcb9scw04jSb8tPp3IWwklq0nzpejBTxe
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859389c88.14.1795180914839;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
X-Received: by 2002:a05:701b:4503:10b0:1b5:1a15:5d18 with SMTP id a92af1059eb24-1b5524d74aamr3859374c88.14.1795180914394;
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:54 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:53 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=2129;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=q2ude2+7TI0KnKHb6cUpVCoHT8Tjv9x10iiUca9DXas=;
 b=nFGz7/BM08LGEuOAefFpYEpJ2dwJn6Jc1mICAYfqjuG+aLJnoStZeC6Atiw4YHJwS3z8hGIfv
 lC/lmIkg/uICXLyW3zIuWgTrI8s3EkqnDhfR3DmeRsMFbL/4WY8BCQe
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004973 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r1478T_rJjGiy3RGUEAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX7/eknNHaE/O/
 fMCEquSDrgbFGQD8teC3a8WKVKF6a3eP1wWrk0rulmII+UOvxanGWSI7nZpZW83Vrjm9YOVPn6M
 gHgaHsX/JdWquVALBFgMwRcpfhIfI4E=
X-Proofpoint-ORIG-GUID: DowuQhbKCEU2mGu5Xk_bGqCEUJM2Ags3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX24N9LA09QNT5
 70wClKHXbtEwYrREMpuWN/GIaCp/iqQ8IfEMajNYecmgJrtIjLSgKYLrS+W3GsZdRK3yO3Rm0Dh
 jfBRwORZ5sd/EnGzAxscorIek4gTQJcycRTPxjde3yoTtlPhBuCicKMdaSlg/wCrJHs3gk8eQgz
 g76AVUVZQIa10mLeZwya8JwsFLEG3NlZPbAoz2GkmUV4rbVITS5fqiGjQAFznr2uZK8xbheVI1X
 Kif7Hu2jAx+Iy96JjUGsD+uf3Faf2rdcnKgHRL+aH18j++C207lVrAN6cse1rBlAGtMkvA+mJAT
 eGVFz1X0ug+Q0hY/eFlYIaSV93QHuaaSBlyExt1vTfkYaxO0dXVoD6rMiImsyULJ6WD0nI++01O
 uf74b3t9/KS75uPKsz9wRrQpnsspMAA7NfpcJ4fnFVp1qAhJOleYDGDw5EWt69npUGIc9Tgo7E/
 Ur+OtCpopix0SzwDhAg==
X-Proofpoint-GUID: DowuQhbKCEU2mGu5Xk_bGqCEUJM2Ags3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
running at EL1. Linux can also be booted directly at EL2 on these
devices.

For EL2 boot, describe the IOMMU streams used by the remote processor
firmware in the DeviceTree consumed by Linux. Also disable GPU zap
shader and Iris video codec.

Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
produce sm8750-mtp-el2.dtb alongside the standard DTB.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  4 ++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5c8d179f2792..60f627a469e9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -511,6 +511,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
+
+sm8750-mtp-el2-dtbs	:= sm8750-mtp.dtb sm8750-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750-el2.dtso b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
new file mode 100644
index 000000000000..3e50c50e82dc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-el2.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+ * Pakala specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1000 0x0>,
+		 <&apps_smmu 0x10a0 0x0>,
+		 <&apps_smmu 0x00a5 0x0>,
+		 <&apps_smmu 0x0425 0x0>,
+		 <&apps_smmu 0x0525 0x0>,
+		 <&apps_smmu 0x0125 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0c00 0x0>;
+};

-- 
2.34.1

