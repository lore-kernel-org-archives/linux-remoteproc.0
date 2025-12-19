Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0526F2BE
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113840; cv=none; b=JmYyNEuIwUmYhBkMTPWU5Un0sKEV/GknOQ/ZnJ+2fTT6bYSEVZ6Zp/ySdGq7enxnnesJbt7jnLL0cd1IkKWAtGuzlNN0Xg2mf8m4I/I0OJ0GIkEiDfH+MSiTJjXd0SZQNPJLvLqB5EB+9kkNhrZSwL/N1TOcKUuhpxc9kyVLenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113840; c=relaxed/simple;
	bh=blcX1nouYNXC6ol/gZDD5PA42jcTWn6mTJAJP1lU+68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YXtYAVs6sJXrTTcUblm9hyf2tbiVOhp11mIKEGLncT+bqR/SJPZGq4hzHSIlaHfsgwKZs1/u85gMzZojoX/zEiWJNo1VKjnxP3rAYvSZbHMvLgbpQKRHZ6kas0CXpVSUVZUdcCQba/1sJrVXgrqJ7l/mp4PcEPJKuEw6Umiu1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS9UdRMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7unrF0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS9UdRMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7unrF0Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2O3ei3713059
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JegHHkHOmY4
	/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=; b=XS9UdRMkax9gRv77X7CYJ6P1iMP
	WRx0DJWWq8aF8xHscn30bhYBlq2VYNX7JlXzH+wttHDUBc/4v+sAPR7wwxDG5iBJ
	/l4ul3+N6lDbVs+oWMhVShVv9exKZLm8hyReMaNNVMkxuY2Gb3EZXuWaBcLKeckr
	snz+SDqu36i2tIj/cq96tthzW8GH1DM29aIdzFRFdieygHJByL2hGe+WeZv4CHRS
	zPXZxx5+oQhkrHULkqkKMpuwbatkv0ThC/lCbFvrmLsIe9qn1kAu51mW4xkEeBiC
	jqY8PQasX15JvPaqlDeT8zgiZGQ9uhAE0o4MtR0kdpXmXGX57ERIb/BDZnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29h0p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab459c051so3667648a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113838; x=1766718638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=W7unrF0Yn/4QgCXffpa/vNEeMbteQVkB+Ujoh+rBXvKBfIH+sXXTOKK1NjXxahmSaN
         MaG9YL8c1hpBLq5ZYUcNYZfQbU/SXI6QcGSms4RjBOSRbW2v39oLch/phGsw1YfHh1NW
         1fIQkoC1jMmGOw+IheZ42Rs91A1o5jMPIUa+lW0AbxP3xO4MsVBtLLpfucmteIGnonhi
         JVpbUm3R3j2gL6MT3xE9payyenyVOLifDYK+YlSM7mYR6xO09Xp1ygtNPdzh0RnVN7Xe
         EO2usY67MO6Pu15ZCCJe1mzF7Fb2ustmPGxkoB2lBXAtpimwKIZ2mHbU3dBDoSTNmbql
         lQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113838; x=1766718638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=CT+vcr/98N90YJw0uqqKbyifYOcYm8de8D8hXelGIpLOnyxMFMLBGkk23nnr148pN8
         zgZhVpHbWytuNe+u+m1NM9EQrh0habll5NWA9MxLyxqEUe8xU1GBZ68Ud0JE8O+KFzJ/
         M1QnomaU9ZeubojKnBxN/PHsJVXXE4BWbAteXLd6sylgEqCPrUhppp+KEL/SLGcgOfpe
         7Rj5pqfUKR84Unv7cjBfs5IcXfo1u8ArgkZk//aOAjkQ1YpQ00u3Z4qlHNSlxTGbFvxL
         h75/xyodIvkqkL/Tq1NV79sqJiHiJ+Nhdj3ytLht0jUu+wlvo0aS8p3buuU0n+sLDPmt
         UNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHXnkpbs2ro17gkPKWfFDrQWzCDoUuGiQYUtGu/pOM4sF53SGCYTL2f9mqoXguu/pJ4pjMSA8olaIA2BYAyMpT@vger.kernel.org
X-Gm-Message-State: AOJu0YxsDVV3HDhkedtXjWkBH0va27hV9THLC2VmeUaC3ol9cVPzjDOa
	w1ZzPlWTODkrzar2PnYTwbFzeQp+j59+wt0tPTAh8C7TMGwdG7m07NGkV52YjXq37Qcn80LR0zq
	QEilj3pF49U5fPz3Qn0nV+lNH5OzmrGH3BAKKTi1cHoPdcd6i7NfZLbi/kQSh1U84qaeRv117
X-Gm-Gg: AY/fxX4nqzChHMi0GoAdveP8tfmNi/41GEQkbYFm9sfA6vCitcfhBM7tobDr1zYnE8Q
	Mf0YxoA5Mm2Y+kthjS2XmwzVDMEKyldadv6ANDWDWNk2kP5QYUnjR1lYfFI83bxS0tw80Pj3yr7
	zwHVEieGR3LBL5CYMfUz7ZYBAWvDMd14JuCFluup27stF9fOH3tTLQuMIOTiun7j6OjDLj7ustb
	G0HqMISEd6nGaPQzdot+nVUxbbX3Fnz/bAElaDAOmNonf/XqxlGGKnoKV9NeWXG3drb8DbMKjnk
	CjM6a5l7fPaxnmusvRjbk9VVuJU5Rpd9yuKYGsOpU9undLqeCmhG/QBNdm+Tq5RpCsbGUqql09G
	hPL2LEdWJJDR+QUmal2y/V8yXXcxuizAwYJmfZRD1vGl4rRqiL5+eAq49VZn8Wf4/pjkk7kiX2U
	HUSl5u2YkFtIoqhFe0xBFTMohNY+trWaeqzufHBbo=
X-Received: by 2002:a17:90b:3d0d:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-34e9212f34cmr1468811a91.7.1766113837740;
        Thu, 18 Dec 2025 19:10:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjoO7rmj5mTwZVDn+RLFWw3ODRMf1ImDvCZ7pNDu2ZSpIPdZitTV6bPAc9UBCjfuvIlOSvWQ==
X-Received: by 2002:a17:90b:3d0d:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-34e9212f34cmr1468776a91.7.1766113837333;
        Thu, 18 Dec 2025 19:10:37 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:36 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Fri, 19 Dec 2025 08:40:08 +0530
Message-Id: <20251219031010.2919875-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=6944c22e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=etOpb5xliKOozrl2HNYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8Mega4UcaSarJNBGvK_Zr6CIoshinnGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNCBTYWx0ZWRfX3vYKpEFCk5f5
 DQcvtjVDyIx3O6ikdP55tGSWAvI/4NDd6hoP17d/LDuK7NItZp1J/S92qR7FnhUPTGsAyZpfT1y
 YEjJP2pPRz1vCAwnbjBuxrHhY9WSXMC3sqNth2xYU4ECCsOSa+pIVwfWPpoZU5DS7/nM4ptWBJo
 UWPXsulnmC9VLw3bx1IHkGvO8FkNbZyVuFhSkyCcJgREifM7dB8TC0rsvoJ3LLN0tIxUrhWiPKS
 57XJcoX+a8lkn5PLyBS5dOQli8KavIuHcd3c5MPdXHKQ5ScI1Xfv40cwvE9HdYD1oM4/xBAEu85
 XZ9h/EF2vU8ObFN32e0OE6RyApJArQ7THL8+nsm3ch6J7xaJngA7aInkvSssIkCpGMYXF2J5Wjz
 i34NQcN65Gyfg30b8KGQp93k0Ny7Wp3gGqc//76b+AgVw+YY7e6GT3zsPmYjtYYqdGg5E9+HYEg
 Kr4/UoHRRVeP8vz6gZA==
X-Proofpoint-GUID: 8Mega4UcaSarJNBGvK_Zr6CIoshinnGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190024

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f..d077f0ed9e46 100644
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
@@ -717,6 +746,41 @@ frame@b128000 {
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

