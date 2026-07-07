Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224F3DB997
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419189; cv=none; b=jCz5FPJwzFaTW2gU99KZGMIrO42GlS/cYgDvuQFzkUbbst35myn226Ic4U2UtRjNfWW5uit1z8Z3h03o+giw+3Yw+sEF6Jy7kF5c3esuONrIA/bokO4BAkFRBItfPZeXT9Bxx4QAd/waGhjMtB64kU2JjCYbFA0SoN11VVWNoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419189; c=relaxed/simple;
	bh=btumoU3pIG/LAxnXpjlEt5hEk9N65ss833i6VOVfTGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBjISv7/JGYvjy6wTG/yZtRojdkzIBHS/eBjtfXhF2pMDTQu94M5ZnUHBn7pIAmZvc0fB/BvZzNwVEt6YlWE3U+ffLFs/gCvMGMHIzMKiUxeiD7R9ZpAa12vlSLoGqp9bvEqeOxY1paizTrQhxkGJ6jXiQm44JBHwGGsZOtJ5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bys1MhJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PX8KRVJ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bys1MhJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PX8KRVJ/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dsns3182768
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Jul 2026 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=; b=Bys1MhJ1HKJuFcfL
	c6uJlLn+XY2aGZqqvJ83LuYfEHw4lLeWn3Ymkm68z35ySMqx+4xXoSBi8Us8azSi
	kEB5IYW5Qfk3t6Gg0fzu7thLYHLuQS9MiDuHQN8q39Z6E+Mo5glpvwgKW9T2zSO1
	lkeTTx6uSbhtobeQ1z5LOEj0wUtKSuQX74Fvn9arsW7q7mmyPq5hMYXGLUV8ERrp
	ximQ02SXFxucWnSqXGNZU54D1MaN2U5Mc3FptikZQTBMJVrTdymKuX660lbO9Rzg
	A4VimEKXCPX7qyfrkh6R56WaNyWL+vyhHPWHA7yQb/jQy7ZLFQDNp5piLDY4sm5Y
	KcSrPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8xnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 10:13:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so3408830a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419186; x=1784023986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=;
        b=PX8KRVJ/cyDVteQ5/8GbyGFsojqCRtqD2vz0xQvVaxzQwr1dkvgYCkKK5Oj9YSnV+U
         ZMSL2+bf73iGdNNsydPcUXiUDuN6Zs2j+k5z7TsU8MSDhuKWKDyH+Ed5XJ9PYMJXyqRS
         lnah4ey6VGj10RBr7p7CRxpoMFN20m8oDGn3omdwuiqQO2ETt23ny8HKjMNIYKDzPanR
         MvkGArA9c8Q1weVomlP7+2i8M85clNPTmYmr11a77x2qf0XiDaqBLNJ0vtvAB1afGbFF
         pDJ/zvVFzud+39Xd6pAGDxsxlCNTnklJ900a/J6Y+HKUx6gcHRwjjWJmSaAlpZ62PIr7
         rwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419186; x=1784023986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoENZQMBRLol1CJ95/um9zCMXYskZHoxExsv+BKuhsg=;
        b=ntNE6C70YSRqjhZqIxLMYuXtGYuGgtX5fdv/I4fHoNLxlFJSX1T0OnW8FyPf8hidci
         gTsCPzJ7cjcxosH8H4E9r1ppHqH9AozIwms1JElRXtPMnsksEp1xApcwA1Z4DsmXUy43
         Y/IKQOS7caLyQ/+QY4wgsujF7Mg9KzVBbNRgTMEy6GPAIrus4cDmyYhUeDBuYn8MyRu/
         IzW2AIAbWE3j++0nGmwKFT75skDFYEA9RCz7+wfqCOvOLZtdg/aF5ivdy3asbj6lIKv0
         TgdgN9XyR/xmmI3AEWhCpoJEr1mDVisLOv+7v4ydld0JR+XJPVi40CkFZjKZ1c9HjMbZ
         Z3cA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6fzbu5fgr2qlZ/YF6lwUFbeogmyv4WzQdihBRfgKOpu7chrNEBqP26meEIhHW+iQ4lYb6nt05JlyEMCF9EkPx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28eyUC16r+p3YXoSceVU5uv8dFlXrYh3+EPt0UxQ8sA8cweG7
	JxJGjhMuLfxyHYUQ41H8S2gw+/plIHk5ZFmOOoBDTuJHpr/6VfKl/Uppvh8Wlz+NAyTompvOKmD
	4RYukJmZN6ypOxpdOaP6uQX1+dOCWQopOU2rkLQk6MBdihL9agC4YkPwX+BtspDaM7RvAxUyL
X-Gm-Gg: AfdE7cl65felkTsRBW/YQDunnTg0V2qRNoUv9PwDikb9SziuFCZOKQp9ylneQ9ld7uZ
	uY56Etvy86OZ6DTezyTrllIeRMJyUGf1Qg28VDYaZ6XdrqhwkNhwspbP0PZlk30iLtJdFMDFeJz
	AyhfyA2jU6NtHDvLwfKVcu4eMuMThT1hLakFFKLsKV7ZWFlfOIWA6dlTyRnwxw7qPfuQccXHtfX
	N0rJnYttj3cWM0yVfiQk7b4TpyPhvt++ykxr/KYoKdHn1BaQ6fG5Uab6Y/Tb6BOw+2Q/tDb3Ok1
	9FAbwUt+takWdNE5OgEuKhqvtQuEFstyS0rzK0pK3GBZjGdQblvHV91tAkbFHpir/JqUOpnxO+7
	6ERdD/Fmq4AYR5/nEaNW1vkwkACvB0EfbhYXGoERKuHj8tCpsDW4Y+yQGcqgp
X-Received: by 2002:a05:6a21:62cc:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c08edb777emr5808555637.26.1783419185679;
        Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:62cc:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c08edb777emr5808514637.26.1783419185206;
        Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:46 -0700
Subject: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=2856;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=9Yzjj9aQIU5lY5XB41tE+SgPpEtYePj7JS1qPaS10F8=;
 b=Dx6YSifOOl1dITFoEPkXoAu9F69nnhmOtDFI/GofB5C2BUrGlcnLuoMNH128MHDMtHBAe+GBG
 7QR0xNF6FSwBgwfS7G2ehT2MOOQaOyO/sh7JJ1V8e7PNs0xdttPtgjj
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: 1WykQhG0eKN60KqhvxdsgBdumHS6Es4N
X-Proofpoint-ORIG-GUID: 1WykQhG0eKN60KqhvxdsgBdumHS6Es4N
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd132 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9f4fzsQZ2b4kEiPl2jAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX5j6RNCfTzmX1
 2dHsg4t6CJ5oSKGkFaOHuaPgAhcom5dyUj8zoRfNw/s15DH1MEAHYj+nojDJbVX5KkSPWDTud/X
 Xx2x580ItjvpVmQ7A0Bn6wm3Jtv26J5GxouLoCbU8O9SC5t6IDJcBr9oE90HwjUNFYc2Ggwmpjw
 8qu9jeyaFxLk+tjSZPsY0MdTvOMdCqtEV4JTIVbeFoaEsLrX12r5vUVR2LjwIMEiZ/iS/jQJLAg
 FyFqPE4dsn82OcLQjdwPpAw+LmzbFa8tinL5XsQhKnXrpKFsi+uyGCq2s3GneB45GcSKrDUHdEI
 AfFcN/xiXXQKV1NLkJiHSX5KKsOGyemZ3uLt5ynp7VvirR0jFP5y6d47/U8aVUF3iENocuU+ucB
 nWEqVyuYAxGLr0xTmb2TKStUT34G9m6rC82ysX7wjrK5gGfZ2Woi6Z0S6FkHDP7xoTLez/5nmqy
 SQdEkEdNhSDrBpNRUlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX9Xixkd7S/Ogg
 nTsDTd3gqn3iG1+pDJF5VFW4+0bJn92Ha24E01Ec3VuBxRGHsT146Sv/84+lL02nfOZTuOXimN+
 apJENjCNfCC1HUOspGXMRfRLVXq22po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging, and various other functions on Qualcomm SoCs.

Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

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
index 9ec7c256b80a..e3dee05de3a3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
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

