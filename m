Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535A384CE8
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754009; cv=none; b=o5YI42vZEHo50TukFjd13aOU9j7FuQELiUwaUFADBj37c0iF+D8PBW4sDjvIBovM1Im6OxrMfSB2s5dEKYCoCSYJ/gjGK2oBepNtAjcJcUTpgQha32I/b7xeGY+GqePK3Pq8cGkcXxAojhmHsVasKuHv434sFu3Ly8efLTmNgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754009; c=relaxed/simple;
	bh=RzZzUoksTyLUaZ3HmTPqKhP1G5gdxixi1IK+pyJmlYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u55a/SdUWYCkQLJPIIHrH195L2qi/Ty7bJlYitlu9mEVW8HMTjc7reXkh+Z35zGMWP7boOxlQMweD0lyK6d9wUDt+r6F9hGtbDvB+8LX/h4o8slM4b2bSMelp8B34b6ih8SPEfl4T5htmcC7tb//hq9fRdlKD3u0aSAdJcE4l6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X42fcuKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX+qN51p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X42fcuKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX+qN51p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SiQo3759015
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=; b=X42fcuKoMVHItCkJ
	xEZ4XWjq3qW6uAC7zC5hzcx9/K58gvGEVbFFwayE3H9EQ35eloso+8J5xFhqvCH1
	OgEsguML8Zldmv79mec9HGGU1Fow1DCUQzEIdzvu1Zie2GZK4NVnXzyjimoq5IV+
	utX+Im/oXQhYuZmTG0sFD1W/soZ0p13C7WJQxMYEJJfZJvenr4hP0zOeb4oXymRr
	dsvNAh3bOqkt7+yzhU3Ng8ozieoeySMCGrRkEXSDgcuXPjJjtn0PrVGPs2u6JUYb
	q4/nPso/ZOoRbWMX5T20AoCJmMhksCLUHNwiLVlpC2NXbMPJfVLkahLebkrjqD20
	GFz8iQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns3ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so4268242a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754006; x=1786358806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=gX+qN51pCHF4GmIR/RgAP6TkRe4oL+cTyrGaMdWSeQz+Zpk6X76Pu/PunUgGBsEGTy
         LDYCfH1bmgh2Mkm+vdx3RtWQcSCX6BM+8zhFXh4rYh0vGF4BSu+BtCOPH8H36RYJrNAW
         rkB6xEOHZrLklqJTUKIitNPoFwZw59osfJRYk36Esimt9RmUIhqLanWU+RMVPdor41kW
         CbdGdFqefKjwKGHJiTKt+w62WU8pVVH7o4jGWyiyiDFC121rGueZeXXq9ucxBe4CmPZ/
         V1h7tMsFZLxVvoePEQBghndbRNz4PTu+cW+N8ZCwPDLJJWnCNIVk/7R/QlHtmIkjUMqX
         ZROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754006; x=1786358806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=BtYfE7xteF0bLM2UOivherKOQXKWMlHT+BgqGj7LTah8BZ1SXbKx/G7HjyxYd97QcE
         BogktcsDTEZQPphJ/ZO5N7tZD7tLb4LJn8AJZR0/SlHITwbPxmE3HatM7YiaICpKC0jE
         j0xLUZ9IAkyfdOLA3/h8IkzjjYKcNymALUbXwZje+5O6p7I/Xugbz5BrNsWcNxgXyFJg
         LQBZcWAWo9NmtblPdaGTbpK6fOmN500qu7s04dLlLhUnfqMSqSimDShuxaa0t4svRqIt
         i9PnFS95quUPoqBA0PZZbMR9wTk7LWdeJXo3OdxNtDvkmU7DXBgRhhbdDAsunfx7fl6i
         E6Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpDTc8RZ4J0k3GI0YjL9FM/LiApZ3cAZKSjl8Ij5cNGVj8p50WCP26zfslojzskPf/NT+rhPZv6oXDBdx1gfJgd@vger.kernel.org
X-Gm-Message-State: AOJu0YzkO1dFGuYMX04FC8wqQDNaSX9o9CVtrf65C1XSufAhfAdyJ40s
	UVsbK0BEiRUAE2RGveny/BGyOIcqIXUD7/+AhOWoBxncRPBkExmGsO+Jkky68/HA+ZDQWl7Y9t6
	soC+mPmUSRv/hVx4MDZFnqqhXk6z7ZZC6tWuz3Cp8BNX3t59jWDaDXYFMsUv7PqfYgDaAq3RU
X-Gm-Gg: AR+sD12bAq17q8NOovtp7afLFPJh2V7k63snDGiHKOmNz1heqz6Q9/Umql03O/UO97s
	DNX/78VPBxDJM3kohna5hP/itY4n63zTZKGkBoZy7Aynk4ectJXGIEhsnpHP7CUchEL6IgZEjv9
	cZGBfvVncf/rm4W/HBGJksCGSc0NbUl14aHsYygRxiRZlob/znnedgOlJ/lvV24RR0kwBBLpFTN
	uA9BXxj+PmGgKPH+lAryX0uUYGxPxptOGZQZYDt/WKiV2ajibo4AgniJkB1cPJ2QzzAdMqWAXcO
	PV+d+Nulfe8kZwGPz7zOpFWMiPdmq/5zxSfqZYEgOz6DsuayiWJxoLsclvN4+Ns68foouj0ClL0
	TjHeDmruxyi1jyq7N+qNykPJXzUtJDUgP3Jz+cRO93qX/GIFfiwGQlt0rEXNTDLn6wF6+XfjQ8k
	Rl9Vpg9nBqxQfBH6sTTWIydxlJ1Mslvg==
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306675637.50.1785754006394;
        Mon, 03 Aug 2026 03:46:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306648637.50.1785754005965;
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:10 +0530
Subject: [PATCH v14 4/9] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-4-a1f87b0b0ad2@oss.qualcomm.com>
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
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX2lGDLlyN4ddu
 uintxeT2lkbcR6cwPZhOxHBdj4en8TNII45R0JPcPrpvl8WSWDhoZLsbnf3FfiUaU6VO3mtiJTG
 d/LgjkJT9Q9+tg3ig+lTJP+en6mFAR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXweFXOu/FvdsE
 9vzjP+jfdDxXdTrrr+zkOJdh4omi4ipjqCZwWuHxAAAs1SqdaqpCwRxU0+e2tWeGxIL2ezBl4Y4
 3n5EYHAr5kqn+IUCE7Rmp05ElogeKSgoXpbJsUNfuMCfHh0oBg5sDrtdkD66rSAj/5ufq7BIKcR
 xSuWpKugGrGsHmo5VJch+/bCCrZjL5NEKsXd/+PBqEFgzBaqTGoVRURq2n75NaE0C1TxliWEWo+
 hmlu+4h+f3t+mj3tIAl15YUqSu1ycTHfYzBdi9t9GdFehWVewNnCvwFO4jqKm0I65axnXAZVTom
 j4MFhO67yZ1xjEha/RryipanirkHBXPCY+fv1i+e/2VsAfnYv3tzQ5vNnYY1qGyqLg504Oblv97
 k+WgSLUCO1f6yfyFuMvueD2bBS2z7qiPIQy0bmJRvBLPOQb+OmAueNfWXNK4Z3ytyo/+pc7HTeM
 ce9e8mYtrZB0sHVwE+g==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a707197 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: RwHYjrwij7pKt9eOIxymZT9rzBHHYAKd
X-Proofpoint-ORIG-GUID: RwHYjrwij7pKt9eOIxymZT9rzBHHYAKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..82af532bff38 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -734,6 +763,43 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,

-- 
2.34.1

