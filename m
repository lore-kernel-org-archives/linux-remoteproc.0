Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6038D3EE
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754020; cv=none; b=Mec0z09cOeOES7cZTFmKK1Y/UZMdFGN2nks5M/ktoSJo/MToqcBET0A8A3mbVHfVLjOs+JemcXsiCtpKwfvLyiE1BHBp6IcgV1pNaJ3fPOQ+RTxDne7aG0hrg7Qe1VxmFaeLb7wz+iCcV6gfKzwrh1zOObZEftRmYxkfKeqGwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754020; c=relaxed/simple;
	bh=QkdS0hOTNE4bZd77xnhhRNX4gq5J4rHM7sIpszuwF28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7hmYlTe/pihD5noQWoNHKPCLEnWi7ZXRrvVABBqnLQw4cQAnvCE5teAIXvaSZ3gGoCwTCw5iQxpPBV5B1VhzSFUM4BBYNfSkl+kH3gqyaiT6SAe43iTbyVZuDpga/6xT+L2KdOALLhWW/LS2mn9IUzDs4KooqhXMPp/VUH4tv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeGRoick; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxFRvyJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeGRoick";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxFRvyJI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AehVX3760315
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGphj/43Rd8wa0hTF4TECxhtmb2NUIdfxvghNIwmcd8=; b=SeGRoickFs0DGYqF
	1RdMIHJpSGx5TVTrqnZJLXwS1fvwN6imJfGX5s4dWuKzHJOy17OmeqQMCpFXSzrZ
	xSiisr5WBq5uHznI/SL3/xsVZS28PMu+10+fgQ91S30dwxavBUVQHqHjqpHU01jz
	NCLw2xcRDkBsB51TVoDpJctGBHurEAoHKemIGjRMAUiSX+kXrJ5KOzhCY3eT0z4O
	qS/X1QB1bIq/v3VRCVEvGVbWSyrr+COmm0NPDys75M/qMh5LDGA32DVBgujb76AK
	RT1tL4vBx7nB/ZemlMK+y8RtCS1FNrYLTbKgaaaacjRTNrQ9KFcsuDWZiD9del2n
	QDlldg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns3bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:46:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa55c9430so28329215ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754018; x=1786358818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGphj/43Rd8wa0hTF4TECxhtmb2NUIdfxvghNIwmcd8=;
        b=UxFRvyJI7yf8fIiD499mLOXLGqEk0UaM6P0unFSNfV5jnTlGE83B/JgK3+Lxx2DhS+
         cEo2mZ0n2MEL35BsQp8FAIUMgykB3vg1G8vifIelS3xExGNs/m8oGlYM1xAvHTDKyVG5
         xIl/1aJ8KjZCbH5vnR6uqMYw+IQ3EwVHQCNEHWYdjmFFhRpkA573h+7r070TBDAUkS2r
         UdLEckohQHLwZCpOnJz8413QMamEw38nYWMgte25r5pWMOwmnBcN05D/m5BJx3n8QMbq
         8srSZBUo2ZCG1tE59du3mhucthbGtAM+oANkQYr8GAMrpJSRSXwz8Swc9w5aiaynm0TQ
         /3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754018; x=1786358818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGphj/43Rd8wa0hTF4TECxhtmb2NUIdfxvghNIwmcd8=;
        b=GXr+5HKU1GVFEpEqfaa8VX2rDcCNzhmMPXA43gqA8HNDNiHt7aooPBYsLDZy/KFOxG
         Qo0z6pm4qtlRgRPo7ghcT79sJqLC6L7QFNMR9Ql6OEqe0tI161IlHwWyIJX7pL+Dvimn
         FOOp3K/T8r3RPiB6PmdGwKNd5qzA7nlBAY0P3dPprLBJNQfV/34Iuk7KPZxiXIujIt10
         oukvXhjply8NS2mFHzdhI0fcOE+HuDiR0g3fXH65HyqvkaQQxVfERY96ZgfX9XuLlkMj
         9w9f5XeyKhFXBk1zNqRGHsZEqYjC1oNmd7ZVRW3M13DEVSQVNMcoENq8wuubi7GXCG29
         aYYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4oVO7FNByXlwJv0Fe6Rc6+dChHnBgqcHQKrgBjEz25sgG0HgXg3ge3Ax53wI+vQ3yS2MOxbBZk9jBv/qt8zxX@vger.kernel.org
X-Gm-Message-State: AOJu0YxMz3G963ew+9JysiUatj68tXACiOd8mk2Usk2kRfj/Ri3MV11S
	6qdmsBxUQaewU8gH5Xb994/fcdOgg7Nkkp/BrU/DjuEzNmiqj64SmbQIgxi6c1gSTAnAulrLunF
	eKS4bkycrhmYE9mUkItdtGv54X8vuPfm9q+CeTHjK0NLnkyW+UVcHKNW6ayxcr037Pxri+3Aq
X-Gm-Gg: AR+sD125tZ6H09tB/o6k2ol2FyKE1aJZUoktP4/kCMJtnL4GYH4M/0R3wbwYQ0mRsIt
	ewOEJ6tAcP4XxC1b2W8qhn3SIIXCBunPY6lx0/Q1WikQ3ZMz1a7YNwtC1iXxExu45sGvjgocmLF
	RhoUhvagUjIf1v5Yj34k5aCBeC0A+u2BooFWuHAaNSWOjSYhCZCG19mqO/3/vQ7fohdm9m8pOpV
	J5TUjJEWLibJMA+sVYFMJBk+980ElGpmlht/FWHlvkkHMsTrCKTUZp0K+uUTwYkyPzudVGpx9Gf
	9HTncxE0zzqoBwqSLXMS8fn2z+25kQe/BpazeRYmKXH/32Qz822C6fkT5TQi85sW6sfr/aR+lQu
	jyxhGGE/rzRCkOjrlBN7UD6iEBx6WCZS8VluKgGRjQgEmt+z0ejFgH52vKVhMhdKYwsRtKx2PVH
	0PsMzdXp5TLY4i4L+18qrX2UVaYPn+UA==
X-Received: by 2002:a17:90b:5627:b0:387:e0db:bc33 with SMTP id 98e67ed59e1d1-38fbc5956aamr8530381a91.41.1785754017601;
        Mon, 03 Aug 2026 03:46:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:387:e0db:bc33 with SMTP id 98e67ed59e1d1-38fbc5956aamr8530351a91.41.1785754017025;
        Mon, 03 Aug 2026 03:46:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:12 +0530
Subject: [PATCH v14 6/9] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-6-a1f87b0b0ad2@oss.qualcomm.com>
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
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX1FdSaADR0khr
 Qv/U6OLMw4Ckk1cutME5MlOngZLrbSUaS0lRExZHI0ionCcHYezyZ28SpKmlBU6NrsvOpSIRVpi
 +We+ROBhiEK7d1RFndxAE5/OK9xUGYs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX7CBVrTmOLyJW
 0TDR33WeGVG4rWAoY9TO9nJTkNWx6NbAOUHkv3A97qDqDUo9lTveksNZwlvA41Bhxnu6LSnGJQn
 uTF1iAXBrZI/tIa8L9I1UI7FiMA5Eun4D/77GPV9onnXbyAMr73sGnizjrI8gO88Y2m8MYGFCyt
 wr9+jCyrxiiD848GhO+4h0LP9JzR+lupvqsPyg5WV99W/2kebm2hC+2Tk/txgZoKPALPu3XLZE+
 TcosGQEv2L/ZCFunkaNIH8V5Kjnz/2SXlW2BmLDtMBBKbMnyZvDfNU6DzCEiTEKsiRPeo/DDnUc
 04CkxfSLiB3eumPJOm8u7mSK39IXPKYRhnXF9YFLeLxhASRw9eiGTfNXiJdBn+fMOpTCrkL+KcL
 hnN5r427WC2uAjpxdTJamw1aQcseR6OrC42JsdTqQb6VMTH9XKOp0xaYXI8L61oJXizrmSt3uob
 BqsNyH5Ye4woStkbs6g==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a7071a2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Oui-sqICD-gMFOMwsNouyNLijCgeU9Fy
X-Proofpoint-ORIG-GUID: Oui-sqICD-gMFOMwsNouyNLijCgeU9Fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 62 ++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 5a5bda5f21a1..194bba02f2ea 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -924,6 +953,37 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,

-- 
2.34.1

