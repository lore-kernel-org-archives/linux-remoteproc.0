Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088665;
	b=L3gRxCNDzOP+HnLxTXv0Hmlax3kyeNDk+5mRcI4en+wp8OdL/3YAdTSiqD2ECD9YsP0S
	 ACeLjxKUaaRwYebUqZ6cnRS0BUCSCofrGherEk9DsHiFmGxRBloXAlNUlWyUZXCatsqLW
	 Iig4+z3e5hRhwnLO5Us9SXHnH0O1qeBWeJ6MnmKdQ1K38Wd3NE0wBk0aMPZDEBXkfY4vp
	 WDj0Tv9w7v4mWtvg2izq4v353A3Eb9mWqWsDgKbYL7HHi5Z3XEsOnMWWy1zjFNfCOCaUZ
	 /yREdY7W/CjK+9wRt6/OsgPatzkcCmJ2Fj946MyAUJXTG3ogN5AbkZ+hu8vK6LYYy1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
	b=XLWxnrlThBovuEJ9dBkOJcQPgpFN5/lT6TekoVGdvEwfXDaXsVP+urxhzIlfpt+lwH0E
	 87aTXkdKjlIW8gIH+lIZavuglgw7rmP9fqtmrOHowb3C7zr56c2DG2629O2arypCsHTXT
	 zAJUecQXyvOol0okMYZnc/NyAj2uvfgo1zyo5Oczig4JfAb1SSpEK+7hWf2/k2rtJ+gV9
	 F2IRemi+jwSNIe94dB0caYa8I7imZ0tLMgPwMvuJl3IppjC50xac5SatX2WzCH71HtPyb
	 GNmQOYAiFrshMHviEqfbweZ4bvK7aDugWAw+XzFp64BR/ebUdBoBiwuJ/ojVo3wKyFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aMoDgYO/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ceiKnBT2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D384606A337
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D384606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMoDgYO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ceiKnBT2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuV4F2736512
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=; b=aMoDgYO/l1598XdP
	6f7MJRcspIucjKkINstmWxBQ8QTTV9Wnro73aAOYvvEYR2f+H0YE7qkcrO4azlSU
	eed7+0CAwsC/zVVyVi6As5Cx4CMikNua0Afc6/xvwTmf56byzKQqsI/+tjWG+3cV
	RAJLBzm3BWspwSW5fvpVxkkcZIO+0y6ytihjeLfc5T+Mixg0OuGdVWp8fdHsYU1t
	CrOeYVmBvUOsdVv/ILoRr8oaXO9A9OlN8LFujaqgoDM4H2lbzsaLxzvDYR15EpgY
	nLy3HASoHzJkoxTX289AYsBqT+Xc9qZoBonBobV5/P+i+BcIHH124kmedZnT21m0
	toxcwA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rjhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1225976a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088663; x=1795693463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
        b=ceiKnBT2M/zkyJQNOPB2npoyfM8FjCnSZoj3hg4adBMzr+v5zByg1aUThCq7vCmaP3
         vJe+89TJml0bu4yjjTqwr8QUeu+g52mPrj7zbp+965pAI7nRyVZGd7qOJcmCX9/MTmmV
         jICJKDF9st7fZC4+YIIRP32IBx4GHjDlHbKD09T2G8PbS+LXEjZUd1boipGLvPwt9dhb
         1f0tU+JLB5wofsX2jHJRN9WK2nG2bj1giOmyFleuVw+Wm1eIhii/KPMLCeSiqLi1hQZn
         DVLn8aiaRj9EV3CVGULr44a5PiQYOh9BSvOAUrvg4Qe8SP0Ci/VG9qPdora2pzPSr9o3
         8ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088663; x=1795693463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfFdAMhjQtLnFWprbbUSqJpRJtwKttnG9dXYD0iFDfA=;
        b=N7H2I978kKmv/ve/ekPGO0R8XmoDIvPkCBAJv6tCNn7No7Lm3ArsLNHzRPpY4CxiTn
         8X9PxXhHFmvhBX+SoluKPFPHg7SfGTBbjkHQoxb1F8ZSujytr7mQwxm2paad8i3P4ljk
         JE2pHP4i64KLKqr1iv47U+KWo3soNX6VS5dOmi2t526ek9Y4qZ0O2FonXyyDSHBFeFb6
         QL+I0BqlOjChXqUuRYAsYo4Hqj01ccigz5UCjm5qhUij2Kaw6magf22jIKdeuPzmagKf
         Yc8bV+Y5ggBPn7oq3tP7JRh8v/UQclBj271I8zksrWfGaA4uQM74VJJZR/Hqa0slW5g1
         bc1A==
X-Forwarded-Encrypted: i=1; AL+hErFRkAzUxTJR4yy7AnjEHxvep3ohGFvyM+WqfT8XaXXj5/5LkLwXU8OZ3ZVknm8B1F7UwEo6eMh/zrRJk/0Qhcew@vger.kernel.org
X-Gm-Message-State: APuU4Z9H7l5LEt4ELPEtlfOIVJcCKLFWB+yj7gdp7reARWvgkyFsi2Ng
	Wov5I62NY2AgXuk9+kcxcOythbtKw9tUk3yIGwhGpDFUc6cCk+ZisHz/UKxvV5wdxJm9FuZBkAP
	LuWZHaDgzsmjp9qL7eiKJHc0wjOWBrLvU/TwP2PMc+zPJ4KYgIEoA4KYj6pl7dMF0m5CYK/R9LC
	Xjppjl
X-Gm-Gg: AYBFou0laQXpde3YzOnj/P7liVD6ZU1xVsP5bG76jkpWxjV4J5yz0OUSor3sGTw4d5D
	7nHFRXuSVl1tLRcYElw15gPCd6KoHpTOoZ+IkTTYEUlhGWSRMFlxs8PD8tZCjzAn/zuHSnvBRdO
	dSDR3pPx5PP6292Eqz55CQJS7ztiv3ia6f0jWYIVMiArE+JHG8IJ7/axU35PBTIOP0b8O9m0vzh
	m17NkHbYkdesSq2WOFU9KfGuJWxGkbl42oGJxwgv+SoyZMshPOfq5FgEVZz7ToRz8wgQOtg2qS5
	bYbfl3i0M3fBXxLZ7zoe4w3W/vCbZ6YpDTuw1B5/OC94zzqFFiVn6ecvuNjHE1zENTBxXCeBjAU
	Q/wCvFOFEyu5zXOPKYpwOOZGv9iS8LQ8LIJnIoCS/YVFW+EP4Eh/u9+YFQXK7Yxqu
X-Received: by 2002:a05:6a20:1730:b0:400:9acd:e3eb with SMTP id adf61e73a8af0-4009acdf7bamr908458637.37.1795088662628;
        Thu, 19 Nov 2026 03:44:22 -0800 (PST)
X-Received: by 2002:a05:6a20:1730:b0:400:9acd:e3eb with SMTP id adf61e73a8af0-4009acdf7bamr908440637.37.1795088662158;
        Thu, 19 Nov 2026 03:44:22 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:21 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:48 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for
 remoteproc SMMU mappings
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
Message-Id: <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=2086;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JrdnVqD6CnT0x/3ft5oP3Dv2O1gST+oALTVm7nsli3w=;
 b=emGhpBfESpxzmoZn1AAoBVv3/LJ6QEpQwOWAFgh9QkoJHeL+ELLlwq+M+t/cJfZgBjuSYwOgP
 aVOnn99gj5/AT/ussmF9dTs3V7WqhocW0fog3/Y4DB4KTVWozbaZmVz
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afee117 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r1478T_rJjGiy3RGUEAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX4l8sG+cFqct0
 ceBLCU6WXoKTSxISaC2OMmociBDI6Eh8tccGVHqemWvmFdUm5l75LzFTAZGC3dFTVwMsMCGiptE
 iiwEgu3Clpv/OQL3pEFgcTwC3ei0SRG0RNR6OA17/NhKNYBy38HbqwJey1DZzkrUY9ujayq6adT
 NF+bK2bbwL89vDc79OmN61S4B3U9j2ig+1ACzwLkgXFHTGdVaGHJvW/h8AQCgKzcKagZQPi9D8p
 odUOwqX8gZPVf77qq+dcvx2SgOonOWqkYZ5AA0dvjerqL1ZsnxF3TtEVAgZbMiwtOF+NFronP06
 KtFJYy9j8jxbX8F9ktQGhz72ffgnRI2M+LH8nwWJ+/JUJSCKovfnJ3XpNO8G8DU6pkXK0m7NnvX
 OlsJiLTlHfkbbC/+41VR0lX2/iY/12spDKCrbJR+pEIundxZoFiRSa5Knn72dE2rVos6KO5ibH1
 P38W+LC1LzznFudjI2Q==
X-Proofpoint-ORIG-GUID: pyd2VYJAI7UUup8eGJmrLtVaGIVsJvlL
X-Proofpoint-GUID: pyd2VYJAI7UUup8eGJmrLtVaGIVsJvlL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2pWI4gaAqRl7
 z9YCiFhXc4NxN/I3tUF6JkkgIAKgD8jH0BNAkfA8ZaUy5Moiond3wUuEq6uI9K3X2X/bMfIXruP
 0UNfQWdGpOGng0eJSB/YQc3+FZ97LEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

SM8750 board boot Linux under the Gunyah hypervisor, with Linux running
at EL1. Linux can also be booted directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote processor
firmware in the DeviceTree consumed by Linux.

Add an EL2-specific DT overlay and apply it to the Shikra IoT variants
to produce -el2.dtb artifacts alongside the standard DTBs.

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

