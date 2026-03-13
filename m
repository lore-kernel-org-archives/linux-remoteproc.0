Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAF737FF7B
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403742; cv=none; b=jod4VIsHFjWf/xC3t+n1+6j54W4OVn4XToV4md0tm5cjEVuvpXNcRoQPBwsBiFlIYFtRqsQkESNTljMgO/nRJIJpYhOspAzrxMkYHVdcM8hb62wjYSYow0FN2grIWyB1lIWYzFc/eeHSVMc48GBjeGU8nCniluVkUMkSh1NQE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403742; c=relaxed/simple;
	bh=jU/KfjOdi1utkpgDcepwBDP6F5CKjrLLuSRigvSFxHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UsnlV6ZdSGmwwGF2R13sQeoYGWzb0hvtjYW4gnxLHaaqIvO7nUtowTFbpOelW+XF1WVI58DcxUeX2NeaJuRLRmLamK+GhNtk8zezeiWvV995LhwD+/FZGu4mFywGKdvbaH9IkjvBWM6DPNXwc490V9TphAVAxExttEzh195WKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1PXikGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDHYGY05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1PXikGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDHYGY05"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TqEZ1499087
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=egGAxOwk9R6
	89T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=; b=g1PXikGIwNSDOwRzXEgH+U/NVha
	E+SkljxZgSVLgNVzJKQtEuYs185gReRp3SAA3llMJF/DW25834+j9u4+efkWMTPv
	q4SARiuZDDKybVERjKCFFRTdcZmztpygU8xlncK1LEzn5CVCMzN72jFgBC19S5M0
	E5bwKj9D8r38Af5+A+bftuipYjtrhybhO8/IVwBzoHV8qtBCJHB7O6SASdkBPv6I
	O3d+sANTzOY7dQAC1CNf/N3qFQYrxo+qsT4q7apnCbRp5FzUZ06gYZwFMJF58FVy
	J5A/nyHDUzo4otgj9bSPwtUEw3iG+LyYGwSbgPMkhNI9Uu2nkvCNYrT+WDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgfcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso2173174a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403739; x=1774008539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egGAxOwk9R689T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=;
        b=CDHYGY05cVHukx+jF4IDzNxRpzGhcjNgd9xjr1kJe3Mntw698EO53zUhxq5aqMMBtT
         nQt8WBSqYaguPnfQVWAQowiDa4jF7/BXlNNBfQDtlKNtBXXCjKhY5PhzT1JDDwdKbadK
         R1k9pp+Z0eO0zLBz9fqW5s0Ca2rVln38W8mmDvPXThaJw1+h8O39V43ZTNtOVwfsk9zG
         nAHMn/qeuR6NUsAYznotMBxkfxq9QZUht+VjkUtPycRuj1NvW/kbHO9gEW3hqVz36ZUa
         /7k/wNYhoUwYlvvwKX2KrT2HweiEXNgCb2xpqKJ4JZ9Vmm5+yGrjHfTmhWJpmwd+yqhE
         CMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403739; x=1774008539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egGAxOwk9R689T+8fcc+V1K/8ByaJLUJQYO2pJTl7JA=;
        b=mszo3fJ8EhBo8n9FHyr+KDdEjPAfLjsbgzyabDCkF0cMPwqPICqV39OzYRT5Afmy6T
         RNvROdRjUc9UMFxi38jRPKWOnITdryBJmi64q/8HW78OY03jIzuiYrXl3lqOsm3w6dZr
         XA0eNi8TxmRtWD4uSgMaNI8YUzh5mML69jlHRikRvB0Gwz6ai1/mBRFPLhmDGJASCj7M
         PtW2eZH55mjHamozSfSwHgo+9FUlVmfQ8piTuspUTNl1a0bKIxiTlCFXHRFO1PUvawW/
         adp6GmxlGWpMYfa4/BstTwzNiz3tS2t7qiBjdSiYO09fAtyaOFMmVEV0FR4sYsiWUmSs
         PbBw==
X-Forwarded-Encrypted: i=1; AJvYcCWprgxViTPUrzWgAnZE86qV5nPsuZlvwC2UY/HOzVlGewmmsst3w4IaSm9PJ91gDAUUjAEW2w6iF8dS5H1i9cSJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrxn/UgUQoA25gMY5y0iLQIZpUfXnYx5fkyAw4bgK823zmoul0
	vWY7CAHKY/G2gQnCbcJ6XSsCvRRf4DDr+NoEunqugvplnASKzybz7o3QVNQY36M4Jw4THSW89aS
	/zkbSBsGvIrVk81kx8FgnbNitIN6DPO0eUznY+UrNwR5HGo7qOn5qQ7N9sIrd0c51n86afAzd
X-Gm-Gg: ATEYQzwWwK/UP3h+E6TH3kde5jPX8hryPbv1lRwj0X0EtYfjevthLE9hTmIk6iDEhZS
	8C4GnzKF9UXNWctN588PXDAfyE6C5tpOplg0AXCw38UMYwQM9z92GgmvF2s35z4X+aQsegbvbRe
	v/NiId3IQs2jpm11QwpqFwHpw3cqjbx/LmG5v52B8qVsSKBzV4u4E1OO7FCMUthM/P5/W3iNVoP
	Tll0G61PsjeHnlI6SsPuBOsoRa9YJvGxhGdrm7fx8L03XeIjW6ae375S3yq8Z02Wx7rkowQcIJ/
	s/XEB6dtESBE4J9a9G9ve8/cwFpqwL38Bl4+FpMan/wBdo9zqpI2dAFlgQ5IbEnI542oOpHsTbX
	Uf3COeeAFs0vVb7Smb3scY4Qe/Ir6lwW99Cr3Nlh6IKavBhjWFphG+hwDlNnkLHDdKG7xePRaEU
	rrTxSjIkltyCw1+MQHyElDCdoDmpgzk/wzzvtJ
X-Received: by 2002:a17:90b:2d8a:b0:359:7b9a:2cf1 with SMTP id 98e67ed59e1d1-35a21e39f16mr2455067a91.4.1773403739272;
        Fri, 13 Mar 2026 05:08:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8a:b0:359:7b9a:2cf1 with SMTP id 98e67ed59e1d1-35a21e39f16mr2455033a91.4.1773403738674;
        Fri, 13 Mar 2026 05:08:58 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:58 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V5 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
Date: Fri, 13 Mar 2026 17:38:13 +0530
Message-Id: <20260313120814.1312410-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b3fe5c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9J5YLGu7rYtaBgtqDgwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PaYz2F2FtqtNdvbXB7s9uV23MUdLxdVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX03APcrX8VrSD
 BFFX4Cv+jsiumHTRWPDgLNa5M/oaBdnW69AasQ05AwuM/6/bBVMZ3Vl7px9fhU+wyd6YEMySCcM
 QHBL5nNu9txk4f0HGPVyhFtA24ApjtkKg8ElKAdqt3KfTZrLxp/UX7ZTkJ9zyRDLyr/2k7HlEJC
 vS8/g7ZJUy4WYyrbaPpcHAU1L4EJPdw9Ychfz2/OjdcnAcCHhzjenP4zfE3D7Qq0omMlQuTUD/4
 Qw5+VQJDDuZ8qXVfhR3k8r+plC3lQzsdEsX70e7W/vVXf9i+W/QKRrBR9Utwe06MPkX4JpeItY0
 1Ks36JV0KtxLc+nbYyYtvAHYbKV7eQbl60unB+zExJoj8H+jl9aeSZ03hqVTNq7XQ0H/m4Irr0D
 zsCwitnBRxxIi1AvL5gtUP/HSsKh+MsH/4Q4/OzNngMC/eUai+DlQVn0kiuhR3o6WMy0pHFNIUd
 6e0pGHM5nonRnf21v5Q==
X-Proofpoint-GUID: PaYz2F2FtqtNdvbXB7s9uV23MUdLxdVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

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

