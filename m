Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F883D3D11
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081909; cv=none; b=Ufby1nHqXFvAKVYKaPu0tajnWOT4kgnb5iDyubFYguyxsJnY9JWjByMH+iPwbY3gj5kCi6a8Vf0vcbrGvEa0NVtKQs1+uYLh77XSEj32w7z58pLsTA1RSUjG9XvtatAqZQWDYRmFsrNj2rS/XbHen9rFQ8JSKpY6Lq4h7utI3tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081909; c=relaxed/simple;
	bh=K630DEUTV191Dc2qesPz0mTnQpvjdlnARO12sy8EzHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciWe5MiNVgslzyMzClqFJFpli/b+sYswJgz1/RZuhVpZM0ccDsrlgJdFeVn6xreuvFrFU3jMSKWSKaHjHt92T+0BZe8/KD1V4lPYkFoiHHwQGmbIsjMKgYqHTVAqXW7s+TKygwUXF5bK+9FEJYY3GLgnjC8r5ldipEPwQ4EDJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCiXXfj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joRIQ7Q0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCiXXfj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joRIQ7Q0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2tHh3772693
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=; b=mCiXXfj6s/wbPan2
	IsFCSR91R+q2R1ow2ZiLIilUCKeYpzzT7kE5xOlqZELuOlKyDvukSkClL3YJ6XXT
	dGLkx2Yy3XFTxwBb0/GVOmnQsgzaFTeFH2KgPasHhZu8FW1QT6bwzZ4mYArYNXbL
	9p79xZZFFcV6j173jW7RDx76u+XerlP++9oN2JEzfXMph0fI5jwR6JTgnJ/ysm8W
	nJ0xwMCJhHgpsqrupWkB4YkP5sqvtlA1Wq8pmxtCq8Tu90QTT+tjsSdUhdcUIdTc
	DukVJ0nXg624yiqfzpytdPCrPJLor40ia8ohnuNPU/oXi1rCiP/LUQqdROqXNtQi
	QYOGcw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038k03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:31:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so786790a91.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081900; x=1783686700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=joRIQ7Q07GiE7AVugw2AuuCQQGJYeuF0TVdZ82H5fnn9Zr8AehO9utDuh31hAB6e1S
         QjtiddDSOlmZap0BKev3sScikKqm6rwpDZmt9bF/N5pTXfH3Al5H3I+e571aUUK5loip
         bt9cRAacY7/xWzyPYG+o+eet5gcETgFd2XFRFPJZfLgUyya/lObjyU4BgxUnpzaDT2GP
         xCIMghuDQJOgkrOPzxsXeY/8IrljP0xsecy25S9WS+R7jrE3+yGj3lUnE+uJfdYdwY9N
         6Fp/OIYOVxx7QTg8kyqCqEj7recyBDQcYLmkWE5mTagEFFaNycsNohBGxk1s8AfAxSQF
         DydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081900; x=1783686700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=Ca/xZ5B78RCPVW1BMuvphRQdcW8lrSZcJm1IdYyCiTjH7BxbJGUx1q17mGncK5y7wW
         iIK4o0Yxbz7LOKNPJR490rrCnQarOm3a91XKHmSPTQWs1hswbQlEyYnUrRa/iZEPV7NY
         pWt10yrHnZdRG/huWAgMfGbq+wu+7Mi6GTNJEFV3NnOX2aSw38jePuEngskxdXueslrP
         hs0ywP5ChwUJXiZ6boAT+Jmae+UejIKJ49wtiVhc2huL63LGmPvP3aUz6xcK1B9qO4sP
         8nyDBNhw5qvOXAzIElgxxlmsntMSpjTWf7BZhEAzVWaynbjz0lbKgMiERqf3mPWjcOLB
         1Ivg==
X-Forwarded-Encrypted: i=1; AHgh+RohnMWrHjTdCu2KRJQughBdyV+jt1oIjN5+kjukEu2/rmUPmBLK9JZYsMPDvrDlxXJD6TawJ9sJsz/wiFGpC/xp@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8os5YHQ81/ECv95XtxhZUPoG5nQteRL5GoNioX5RSaXU9R0I
	s0wktP/GWP3qy128JV3aJRU+9no06Qfa8F3Nu5v5x9OaPBPU1UYautUyT6e7byuOUjqL19oacGa
	q/opAv1zxM/mUD6RgzXVPdndWaXOLjF7oDmANaun6rJB9zmjM6SW+dhdPLz4m6jz4aURhP9KS
X-Gm-Gg: AfdE7ckRhJG6xnz91EmgME5UUqppRPWbQcxlwbTLMORBZa3m2XEVHDIJ54fWTdvUWJB
	FAJgI00xZRrclez2bHAiCGcHukj/8+J5yw9dtun8vzrBQg6Hr1b3CqQW/NWwcczkFe/o6bHV2sH
	3eDVpEa169VxN4weRHdi5TWJ1ZXHSrNQwaWOZYjBxu7dyIq6X0JdScKJySu84apIa4PIOnmF9Z/
	cv+1AGT1bQn5PSPRhbt3S/iRMQJvc5aKR7ir4m/md/8i7bYyqFEb9s7OMMWeXoz4bHvfAMmaNJa
	ecpaHLADu6+szLfLOK0pgUndQIwbdW8iNpZrCmdqmnW8Yw3nnjEa7v4H38bZJEX5uaEfv3Wgffb
	NfBioHvlPfq2JbavXferiROp30mo3Rp13orp2q4gCvVZkN/sYJ46WbeJy8FZG
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10133010a91.9.1783081900181;
        Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10132973a91.9.1783081899548;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:13 -0700
Subject: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=2909;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=p4NFAc7UYqZOf2Vhd5hWCbhRVXgxqVSfX1RnoN8Hnjo=;
 b=5zpjbDkcSFTosziGt9rFJPCWbhZl6r+iXwOm63BXvLpO1Y1Z2MdtGb+rEVk6uNcR4rSl5N+yq
 fywu2wKWdylCOkNzu4iNRrpoaGMb/k/cL3JehcDPOW4156SzxByY2pI
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX4RMsOyLKUAYx
 tDvBqecmw4BwMHiOk+TXIKPaBHAQ155e0dQOnSv/h38n1YUpRg9qLs+Ff5McEFElN/NkfWlvrBc
 Oq6YyWGFn9g/45krErIm5gbvmTz22Y8=
X-Proofpoint-GUID: DsIp9KIB6zapyl0ypE5ht5_PZXFIHFs0
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47abad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9f4fzsQZ2b4kEiPl2jAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX/k2Kr2kckQ3r
 YLskpEHfxT2rdStc1f/Z9t/JPRtgf3cBbhXGOL3ssr3/H5Lz0pcuGuYK1L4AeI3BamKM6foPZJU
 4Vg/Z9BJWglwdWaRQjuiHkoMEVekwG/6G6Mn0e9UFeSkHRL1cOrrAq5e481s+q8gSAzkhmPPpx9
 uNPLWdTl/TeGAEpqLm0rgOTcALeqjUP0GGEg80MrkXbVsHZuNKN0JZ5/gECLEi06PhW51U7FjuP
 UMgEB06DuAqNxj+jqXKJQcCU50gu4RYyWL68UE+7Qe9Ud/7Vgwba85RuNTLkr+aPnDfzQpHj+Wy
 jxXK6cVPmySMc5YAivkbdQhYb01oAdmlSNSiNAlaJWQJUPEC3iHOzJhstP2nVP2FvG1H+6F0+Vw
 sWom64p77YOKxD/b7bPrQcSV4TA8Ltui1jwggA+LKRblj2Zgv5chSD4TMH8wniX2WGu//mf+Fyk
 n6yWf90JMX/7Xv3QmhA==
X-Proofpoint-ORIG-GUID: DsIp9KIB6zapyl0ypE5ht5_PZXFIHFs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add PAS loader for SoCCP on Glymur DT.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..328eb513140f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,13 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5f44f68efde2..bc259dfbaf0e 100644
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

