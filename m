Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC6380FF5
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924496; cv=none; b=Jg3yg7qdv4+hhP+xBMwScNF2YzNv1cFNPz4CCIBjLT0pStZYx5qYZyWPj4+CxRo9qPhTmIpmv+DPV0pcs3sinuxAlj/iZ1SQ9RWjrppe6krsYX9Sefy4Nj+ivuMJV3WG8v88LFci6FJIsdQPNMQS2qnw8Ua1CthsogabgvQZbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924496; c=relaxed/simple;
	bh=mYzkB9ThUQ+do9DM4Df/BqKYcIPRCl8M++baQRJ3Pc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTUQ1zovh0vIyylAwWb+gVtw6O4Yq30rC7pnCa6D7n3BKeUlr/gcVhzPWRJRtCv5sZq38fgdPJIJOUI3qZ/YlQz9ICOB+eWznZEuU4P7UOtmxh6ugxMbIIkAdUgxDt7pTvXBzwP44R/0VuiqJlDffOMRtm15CydNQO9xln9EjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzfsScn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7C39Moz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzfsScn5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7C39Moz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nk8I668623
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=; b=EzfsScn58eUWByI5
	que33sg0iKZQ1aW3SJzR6uPMrNmhqUocB0zSLM2PDdLlV8d1PU8rG/hGPoNcDXHi
	lrEnSexIZ5G6tYzGTt1zHa5JSzKRqbsU1OZX49JwXNJdnptRsL9dCBSxLKkyXqDh
	95SFBltmiWEQjXOTm6l7vH0VEPCeulDVKCkUQ14cv7U9cD9sQOpks6rJESgdOSEC
	f2ED5nDcl7xDuxjthWMYC1FDDOmEVSVEt0S7IeqnYU4NjkOeEb41KzAq2BtiBAVu
	N7YrMtKeaTBM+unDGa5X1wU++p0qd8jeM5wZlmAJ9ewF4H10BJDrGdxcMCLndLX9
	3KMSEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:34:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2869644a12.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924382; x=1784529182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=g7C39MozYhx+2FoetQ5p6RHIidzKvx/9UQhi7M1RwN213hZJ887ic3dD/xlqWvmOLx
         u5WPFQao38yLPw5wklEkuAvO+lahueTWErPQIsS84TWnc4jIshwFDQTJxkv0AT68V8vB
         ihAIgFfJ0cxQCeziORenDZ+T4PrDOMLbtOJhwM7+D9F5hqNsoO/Te1SwrixLp3P9uCJc
         5t1L8jP6sOKV3+7wALnwiYPqlQEbnlaoVousxmo0kN8OvRYbbXgeOvs4tO9cYcArc3An
         mTvLhBHiJzeEy51yjviemWpx2YDKDhF4jsCPeYNkW74RC+o9YGIZL9SEuIYsOtXBRRE0
         LXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924382; x=1784529182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=ltGg8ZH6wQYqGPbYLH0/ou/rdfDItorGcfkc2Sl92LSOx473ULyR7G4ZQFAOMM2ZLx
         WROgZdmbVNMsDMdxGaCm3K5UpJ8eX/rD9lVBo5YFlLNMcFCjwXZmKizCcuYiCDlCD7Ao
         GAKkKTyAxaTt4PJqx3Ep0akVOZbHhJKltHeLpuoICMkEmGDp4HyDblRRqGG60a7Rmy+z
         f+0s+JP9Z87Cpu3salUBfjGFwVInnQqlLAZBF5msZNDocler/DEvx4y2CbdEGJa653hF
         BfDPlYt62RpA/vEiS2JpNymm7dzjQw3rrvjWDN93I4jOJAZ+2XWLKGZZ98inb2DcuUD+
         CnXA==
X-Forwarded-Encrypted: i=1; AHgh+RoDLBE/6AzU/VVnvwz/O0iSjU+BnD6IY+THR01mwRiwgbybTFSPcaWW57lYAxqrt6pTCvn0jK+F/yuEdjOibYDK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53hCuL/tFzpSMjVJvcjxzEIPSwxRwo1iK7VDdGUGLGhL/th+z
	uURfvrv369c8rf/wo3AEEmDkx19EUFnsrF2IHSYWZi3aYDH/4s2xw1/ugNFrx/gMLeBTjuG4j2L
	QWCeamiUbeA78EaymcpjHH/0kfRz6kyoS4mghKYNQZ+OKfymmWseu136pqnmEpEoy9+h10WPn
X-Gm-Gg: AfdE7clBwTVhqi+CUcYc+zgZkD/aYvglrpUPDR70HovTl88QydqT80rjsn3uPlqgDi3
	6vKbFOfgBAh4XBTdeFyasNxzCN8a73C4pkNn5/zdknJuav+qVRLqQL0ZSN7VDlfTN/PtF50Hw/8
	cPU2dmyFlMx3LeaVar6gxPMkeJpqvt2gc8WerQW6EOzkp+zSgU3Wzd0JlkbyeYyGE+SBMRg/g5f
	I12pTh5U9GI8/nHCFoORA+B58Aw2OQbDsISiBJZmFYbzC42XBU7LBJVW0jylYJKR1YX8dGdQUgG
	Ke/694JzvHCVPWcS4WNqksvAzWDTUzK72IOpS/Tr2tPD+ZLQTu7kho9yIXJHIWdX23GkQC0xAdx
	MpFFT5OwjJbrdHHYZdmp8y+29IjZzIuDMbhjyf7mP5TM3+JPG6mKLe5I7Mcz2ELi6gv/uX4TLq4
	tRL/tZ6vEqaBKYNLxNXqty66HiiC70lQ4asxZgCFzn
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471443637.58.1783924382524;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471403637.58.1783924382048;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:20 +0530
Subject: [PATCH v13 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-4-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: lr0QgHEgGwwVRIaOWryhrwdTA0E2oto-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX3WmWfTnxsF5Z
 Qw2SFImoGSSVGuFCJh50YyCDt61n0sx9GBUK+i4cd7H6gWdtzl/+asbPmk/tirI/I40CBulK/G3
 I0gD6KJ8OdggWX/Fc/I6JqSsxrr80rBhP05GpnwMKtjjwujyHIMzMe2Fl9zZ5SHu3prHfCjYH5x
 K0ocAILsnG4RewM+BHPyPBhbuqUO2UnC/o1FnxWk7xj8vWijAcK1MpewwzOEvLsZK18b7Nw37GD
 2nzWSK2IS9+O9WOnaC4b0nwTDRNyBDhbj6n+iGxMRbliutBgrmbIJCf0XjRljs8rGpc/+4ZK6E+
 iHg4wufBZN2yUclwEV+UYz6rIMIqzxJNwoV8Cz7oUcnR6ajMnAup4906DZpFJfAC39aSSJBdJtM
 mDrXrc8/i/RT8XsYXgzpNG2r1R1ddrfEj9k+NVzNEWcf65JK9jafDfGCLwLUq8EQQfHN4y7NLUK
 DybYlH/O5LG8LaDy9eQ==
X-Proofpoint-GUID: lr0QgHEgGwwVRIaOWryhrwdTA0E2oto-
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54870d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX0qUzopdchsLn
 X8KFuSRAjM/Cir0lqgu3YRq3+SzYWbUZOWovr1Y5lUD7f+A/sT608qjYGfz/k60YGLbz6tN81Dg
 Fo2uBji/zC7KqRdwWwe3piSF/n7jBOE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130066

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index edff89257468..86e8f837bb09 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
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
@@ -731,6 +760,41 @@ frame@b128000 {
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

