Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B43BA223
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113814; cv=none; b=OTI1vocCuwGc5+F4EefjI+6oWlqbDD7Ea7LnZXmLBXdVKh7PwhWFe18c6wfEyeEIHusrvYelETS7CJ+uxStzVFGDqbsK/MZp5LfDYoTYJjes/fdU/p6eZxCCrLoxbgdhwHMu+NTXn4I+GH1ab+ES/N3MCpIoqSKvQpXFI0r8cgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113814; c=relaxed/simple;
	bh=jU/KfjOdi1utkpgDcepwBDP6F5CKjrLLuSRigvSFxHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfYGURnYDzEBu9XqvufPpNlGeyA5DZIuF5kq7hbu36Ylajs37UHKta3t/Nu4mUIvqcJTpbiFvIrDm+yTJAMRRii9PMmaMEkxkHioJ29TaHvs/FueQhQAZ4QS5gasfpEKz46ZANAQpGXKVoxLkaiiFr3pTtZGGPHE2DC+y6u/Hpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b72yoZ7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0YxPlOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b72yoZ7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0YxPlOD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EVPN2373292
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=egGAxOwk9R6
	89T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=; b=b72yoZ7WnM+4m4vpte4GonOYK1v
	OywYn81lgd732V4nN/Iru6sDf6MVcas6xn4z4PQfZ8ybnWJfvjxuK7do9Oecnxsz
	bT03OP26Pg4wiNQUuMsAjYOH7cjZ2SUjrJGsf7/C8Ec3FpOKalakwTW4CqX8dJnh
	0w2KLPvkF6TLL7RLaXqaiEaVX1NJU/gta6q3qHt99Sun6eSa2amiKFbxzWNCuyPA
	cXkxkm6mglEqvKXyorKfCcmhxqgq5NX24NfZJtvLYMCkRx/9r0V8FjYD9k/3+of8
	Ra62L+yF9vqdyBBPocbOIbA0rWGDd2zTzWhnkd4fYmmUyQlzC73tMAyUOrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkjqw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35979a03106so9476816a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113811; x=1773718611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egGAxOwk9R689T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=;
        b=G0YxPlODNA8CBQDf2Xe5tuIElw91HCCOmGJ0rHFcxhaIqdsuIyUf63uzXKbZsHxVmw
         lRfEWWfEr8TpfOYLzAi2FXAj20wF7hDpACRIUr0IRlpMYdNK/zzdCZik5HdKtNW4lYYy
         qdjUbnxilWqTTzTHR7PTduuQVb0pK07tdXWSdw9+fed1XFqqM3/B9V+4bOJngk8V7Vzn
         TnG+CdIZrkdv0oGoOaM4GYJwIdNkhLPb1jNbnImUNEygSfyL12Ui7PHzD7sQ3Go5XvG/
         pleSJXMuC23vcpgzS6+ciFyz73o9Iae45KxmVieUk+JT3QBN84GIa6y3ffs/2ftlTNds
         aFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113811; x=1773718611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egGAxOwk9R689T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=;
        b=fPpsxpF67+iVnZmRIAYX8d7jLPWC7XSgBXgqC8CIAe81IUFJ80Dw/1P9hD38natY3v
         loKZilXiZY+HViOG7JsrYH8M4UKjgXgjFN4eWUu2RVh8a2kjmqf80LWzhQBEUaczw6iR
         CrkCCxhLXkZ9Oc59Gxi5pim7/+VP4S9QA1DTyCcmzSBXqnlq5o1CzVd6jf8AmV1EBP0s
         /2J5b4hMoK8K+a2liPpp6uYG04uXllI7w4l7x0k9hqEIDf9aZKYqcXZplI0ozwyGxPME
         tAd07sBisQSIG81IiBPNwSY5OANM6bIRLYFR2TmsOxAK1eTQ/bS2H/xuz02M3nG6VQlf
         kefw==
X-Forwarded-Encrypted: i=1; AJvYcCUJmCsBmSQI2MxLU5vvCoRVguYeLgL1kVq7Deh+32V2h90vE2SO3UziAWTClhsEWVS1rI2/cHvuS3i9bW6D8Sh9@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxW7aUuQODYh1XR1rXFboLxxFdTpYlHxqmWyBfUBb8Yd2XxV4
	2JI8XFKKJdMPCru8gN13f6lT0LHSR7nM16bzLcuo3wMzmSnc6T9Pj48Hzkl9fA6p/5CzP3pnw1l
	ctje+B/FwEUikrNzqg3Udt/30ZzHZLvW0WB+KoI5bCf6+MxadbeF8/AMDc4nBrmJtiDVscu6Q
X-Gm-Gg: ATEYQzwbxivbG+LUC5GOY4bpNH6PQaTdfAgjchDfMLu+Kzp0jlDnxOxH8V2qQJ6mDoV
	f8GB5AE0fOGHYT1jGh0PmP5iYFYAqLvbQW6vTH/6bJkoqSNSzxXWVKGmNvgO4qvageRJQPhS7jN
	aYar6kS9fhnLM55fuDd8Zffjn5OzJcvJMyu51IQENB6urwwYASGLnwKEJSpyXanLpYk8jVynzic
	Zr3zqkqGnZogszu/0meaUUp3kgtK8uau5VsOHUPr15p2AOJLY0lsgBPjsUJqK49Oce3023LCLi4
	0fqs0l8HrIRgK7d+WkTqnjFRaBljvTDRftKx6f6opxK86F1ZQ+zTGvXTkw+CqbISQEWKb1Fxrce
	9V1CAA8T2XcvimpmLcXjKC2ms1mdicHgs3npdAQrshv7/hphGN3+PPDqaNfXkXckdtBTCSOrS8x
	zLzsU0dwgyeSEnjNqMIO7E0wKYtdy2+pkga/Nh
X-Received: by 2002:a17:90b:4c0b:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-359be21cbe3mr11489541a91.4.1773113810681;
        Mon, 09 Mar 2026 20:36:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0b:b0:340:bfcd:6af8 with SMTP id 98e67ed59e1d1-359be21cbe3mr11489525a91.4.1773113810225;
        Mon, 09 Mar 2026 20:36:50 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:49 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
Date: Tue, 10 Mar 2026 09:06:16 +0530
Message-Id: <20260310033617.3108675-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af91d3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9J5YLGu7rYtaBgtqDgwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6N_cMfj3C_Jt-IWktGaBCEa5eVQXCVfX
X-Proofpoint-GUID: 6N_cMfj3C_Jt-IWktGaBCEa5eVQXCVfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX7746e/wzW1hs
 svzfnArQ73CKPo5yMQI7h8zZJU6CtLpDqQ5bqjCD2oQQCV5Jy2VdQ2PXQ4cc2djYlTmx/C5xBOo
 1OEUeoXOQK4QNhv/AEbI0/SO0RprMIGLqY0hnewqP/cYbcCRGTHIVjZmXVXUvE77CeWmfuIo955
 ERFScSn0hNMMyD0WiXWd7Sy3VKHCoCIsV8g+u6qzIFMVibhtJpN2pWXzm3osdaHm1clao12BSuC
 3pn1O0T2/Kr3SL2d7mqHQnBSHjtGLhXX+y8wMl8gItwrIifSJNOGL1Bn9BM2h4T1y1+nLEabIM1
 azLo2g82pBHqzAMqKs7+o/6v9UP0FG4o2lx0nAoT8rdziy2F7uDG+tzlsIKcUo8KQxEBVcmhB5X
 Fa7+PeWWj4cgG4AussQVDcAl5eLFh8KCsrvOLmf0ReD3QAN1KBE19OpPnUkhNxIIE7sqFfRX6PY
 pr4T3YIc5j2TFVPXhmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 286 +++++++++++++++++++++++++++
 1 file changed, 286 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..ed384d5d9d37 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3346,6 +3346,122 @@ ipcc: mailbox@3e04000 {
 			#mbox-cells = <2>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x1000 0x0>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_MPROC_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				fastrpc {
+					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+
+						iommus = <&apps_smmu 0x1008 0x80>,
+							 <&apps_smmu 0x1068 0x20>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -4692,6 +4808,176 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x2400 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+
+						iommus = <&apps_smmu 0x2401 0x440>,
+							 <&apps_smmu 0x1961 0x0>,
+							 <&apps_smmu 0x19c1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+
+						iommus = <&apps_smmu 0x2402 0x440>,
+							 <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x2403 0x440>,
+							 <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x2404 0x440>,
+							 <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x2405 0x440>,
+							 <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x2406 0x440>,
+							 <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x2407 0x440>,
+							 <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+
+						iommus = <&apps_smmu 0x2408 0x440>,
+							 <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					/* note: compute-cb@9 is secure */
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+
+						iommus = <&apps_smmu 0x240c 0x440>,
+							 <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+
+						iommus = <&apps_smmu 0x240d 0x440>,
+							 <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+
+						iommus = <&apps_smmu 0x240e 0x440>,
+							 <&apps_smmu 0x196e 0x0>,
+							 <&apps_smmu 0x19ce 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		imem: sram@81e08000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
-- 
2.34.1

