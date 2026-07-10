Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DACD3B27ED
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665594; cv=none; b=DTrQWNnw4iVlmSJO5od/MhuPGxsicZh3rhV37p/6EJkWWxZflfNyEIUlKYlrj54vXdV5pRlrL6bVK8GfwX84h1Xxz0leWCHXLuMGkNPQmzBCA2eYhbHQbdBBRlpl28EexHEV/5eWUq0PBLTEEPTSf3fZBKMwI7jc4qp5QFUHN7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665594; c=relaxed/simple;
	bh=uIKuN2DhESGYYTSnWLEE+bvH28nd60e+rRXXW3rLDZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdoZQNJVBcYhKn6ObIFNLSif95DYT1NzPfI0oP/J0npiagyWxFMiiq4JG/TwshSKk4l5/fOO5PxFTrAXYx5BxjI6bSPZucNGZQvLzWE1FSQLfABpFrJ/AJo89H1migDi4RcM59ohLvuqnrxx/Kygp7bcAaFNsnXDEej9BKAY01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy163lwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtJ//J/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fy163lwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtJ//J/D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3miWc3847282
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=; b=fy163lwy+GS4k5xh
	bYymREjX7aaH5R37PxuPYMS+/Ki/jtCWFJ6AIo7y5vP71DOZ8i/eJRe9ot/bqHcW
	a8xdeu7YpFkaYAK7lSjvIvvYmct/a06PaeRsf5bOOuzCc1CvRE1esHq+21IOUMN1
	z3EZvzAZsu5kcgJbjU5eXYVhPDDin1DKG12BisJH1UNw1Y8irRA0DRntVc2wGII9
	devdoLZFCCHCtS58uK/7V7lzhBijIvN6ZNn2xFyzXEhu1dAUbgngoIV1uR6GWPPN
	V6+57SAZkIIUdt9XD+buvfqWadEzNo3tNeMaqNTYScZUizpF3tnO7/jcQliImxAp
	TuKBFA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte1s8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9667280edeso951193a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665592; x=1784270392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=HtJ//J/DCPvMyog7Lwg/4NDAH6TMuUpfwMQrOP1Bo8mKdarxUnxzCM01TzWQdCHhcQ
         sngLA4L772sRlXRn1WKx1cYt948WpzaGoUrmdfqTqlT6l5+0Jj2GRArMO2oR9VAOlT90
         yrO8Rlo6wyXDvtbsPXZJvDqfjvvNk4OlAN19D84y1D2/hQ+O1oTznQjO5fUjl57SKxC6
         ho9fkDLIyFmKEwWTWP81dOFQXjmUHoNHiZOPQCJXcfY8KkfkgTgnSXGDO82dm9N4o3XO
         9tKXgaHpRXucQgpFNc2pWDB6JpxdpRfFJIj2yXbhNLMxPpwEPYrYMuFnKTGQb2MJW5y2
         dyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665592; x=1784270392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=q4KAJ4LSirenkm9SnwDnnTXu/3tlkM3jkVIkB1A2JgzFtuw2qBl4wVk0JIB8Qz5w5i
         VKKfgi9S6EeYKHwFtrqC9iiqkTNs91aUXtHJKPW8nrFw3HW9uTBoqJLYOKBBmy2yh2ad
         U8t016XiGgxjfY6DYe8MOpt/0WO0mDogapihBA8bXc6hdDS+4vymrjVgrlvq8+HJv8Zv
         1tbWCvly4eWRNq0/ZSEMnqod9sEduMzIuzEnTNqY4Lx64ULp6hJWPGqtuoEz9+h3viT5
         o+h9TH6GN70hHYm/nC0+IcDIJugubavr69hCngdnrWXjWz/coakWuRLPAtluNAy8kUje
         FD6A==
X-Forwarded-Encrypted: i=1; AHgh+RrASlECPj2TQNsD3gbQHNvyp7svFhNP4w+OmyIB9YWhoEanwVO1aNPgFbhSpqKeq4aZuY10jfA2AVxUttrFOwnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0T2J9IYQrjVlzKFuh7R00z73O/nfQ8XHPx2KIog8zmZSIdZHN
	7mpkQXOwbU9ZqavDhuqbnaVELfnjvT5LRcAoMs9PCNd4eMhKVqNOOC4NIffljJWWsyiNBQFRdoX
	wrAlDNBsO/+YgoTTjrE7u2azvi2ChMaqGAVMFcybMYwPbRbrj/xv5JAad9nbkX3aWmNhESNt8
X-Gm-Gg: AfdE7cnKfoTGW7Yjgzm6IyAK0DrkZL+7V1oyHS8fo6twi8yfIXUzZim613EcaMfLgdL
	L+KGhDPfIfQTMrxrWzn9hdMaM5CBGjgIplCpYXoiuUWIC79v7gk9oKyYDaK8xgJ5fzk8V734CAc
	nv3hD8NNM4iQklXDyLIhCd2kw/0FATeBtcYTPhC8t8uorAHNXtyqkm/XuPWqegf4SeRYxPsoYy9
	4WDkUbPB6TES2Jo7IGyNIiQgUw5xgfWAlo7NBNonzro1eZs8zHIBSKy5u1y12ERe2Lvo6OEABaI
	pVMNYXcjvwsxW36fMtckdiAm/nRARroga4StM/U5BHtOgxHcSaKmp/esXvzo5JqIwvkIR4rURm9
	ijSc2xXJsjCXb6mWx3Nm+6eNxIV7fww74hW9UJf32JYH+eHrSE7FxBSW0iy6F
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612785637.25.1783665591633;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612757637.25.1783665591150;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:45 -0700
Subject: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=2804;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=GuTuG7Z8xppC3L/Jo0WpEG16+Uij7ANSxrp2vi6Xp50=;
 b=DgflpKW8sSQw++S91xTR8dJ8xziNWrOytCBtRhTUOMKYtoAZUUt89aJQZvQbAgYQXqYUgx+aE
 3lpEyPqYx76BGFs0ETy1spU+EcQ+ozcxosFViUau+tq+l7J1WnCm1a6
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: 6ho6jXcJ5s4sznDXAvOec1PQmhjPMAop
X-Proofpoint-ORIG-GUID: 6ho6jXcJ5s4sznDXAvOec1PQmhjPMAop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX5puIJi/KGuW4
 ZNy54Y6HFw3tf02Wo2QlsEK5SXXiLDsHS0UAso8XwHT2OLghKZ4sW4nxsosKx6nV+Kw/NhXiDOS
 Q0Td0ZU2zP/QCMiHayJnBXumyv8aMNIvwUvd/HPJx617t8bO+3LXBAlOyI9JHlSYtYkX0Dm2sHf
 TJ98pFoueUvGONgNgydxANqqpBOppmJ6zWQGHanTbkbwguRivI3UM98+bI3995is1QeS0sonoWm
 KSruaH3MDvFJCoJ7Yf0r9baZx5NkqNiq0byMZVEmr3Uiova8h1bfwEKFWYmq9ZhnxMSf2t6QEgu
 5zACahNgKDhyMYFuSyxPH2gy2sLgel/IKNs5KSgCjq6IkSr/IUk5NFel2kiGHXzvP8getcTs/gc
 nssCa5GtyNeIm+GTSqfAqtMeu7gBSzC7rlt+PYyeu+zroUd5PW/kztWFGHnvj1/PAZBGjj62LH2
 SiPb3QVuZWKZMUqEGFQ==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a5093b8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VnJQUHybGrZeNF6u4BcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXx+O/5nyM84Vk
 n5cVluorHHg3cslakKn3bO2BWqHbWNpSPx3iIGYlsC3woNz6SHGcKHUxBb1g1O9JPp+ZI+wWg+1
 ZPrbkZ7/tOHIysI8dyRTxUUMJgdgRBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging, and various other functions on Qualcomm SoCs.

Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..d728478f0a11 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 9ec7c256b80a..f4569d49dedc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0

