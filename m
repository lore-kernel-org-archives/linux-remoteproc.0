Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C726A388393
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055095; cv=none; b=A84n8wiEaZRLRCzWwtgXl4bEChgcTXm4lFcyjV6Od4K7b8YsTNU1gY+DzJIZWlOqnZQ8YRuiXhVrGdSZya4C7378D9lkYo4LAj7Cg86QrLxJOACMFbBoq4ufcK5c9VTB80zj2i32qoTQ42tgPCiGnKToGJJNXk/EiHs4LScEqpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055095; c=relaxed/simple;
	bh=ABIa2dnZxJbkTD7vqVOMfkjbVDGiXVjQk1hCuVnse1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbbqk8kkxfKQ4tVGjDa7oYRuCQb5NVHyUpbTXun7Ukhes5cjAFd+6afbgL8VDd0ti40xu918jfjoL1sZUc3bJlC42nRFCtvu9SnMMbkb5FbGBsqiNQQ1MX31OoN+wfyZxhuvGB/MOfUzW6dzYQ4ob98Eu8LX/gHcykPei9RvAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9PXqbS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C377dvxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9PXqbS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C377dvxS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342gI12817932
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=; b=T9PXqbS5zFqPbSOI
	TchufIj0UyPDKBvN3eNQwjqgYZwUsW8RyTyiyK+JMVilcxetDqFiazu6kG5x7VZb
	Hr4DV5R/3u+z4ZEKCCqaXBMk+42Q0mt2YpSFdUXI8Az4U8Aji5xeEpgWoyGowDEX
	QCHGK8eIA4GlWNaF5Dgq/z9RXY7+Ub2zAotiWkTbfOUSKUfkx3caaRNSONEMMWPs
	pG03As/2kX4VaQeV+MUn4kcO++eZIPxht7xsfdtj1Bc6a9SkseZSipAmeaW0umz2
	CAnK9f0WmskxWVITV3A6f4C4NLwl/Yx/RnAz8iM7rhxID3pdUtkOFvAuanKnnzdo
	1Gpf+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnjn12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:04:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811279d51aso366685a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055081; x=1783659881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=;
        b=C377dvxSZYaI+otihL2u+09/AYQaobUnP5MteLo+XMLdh1ddhTSxrjt6uU8C/GjVgp
         7BaUnET3F6lP5jWrnqPTFy5+AssOeJoBn5g/qNLrio07em0H+NmToR6EcuEe172XTEmf
         sWQouL+08G3iyzV51eXTWAngzkctJE2182pImoBGtRw+hRSO0O+UzYm6FNko8kKCtYvj
         CDvzYA1j8d5fuLUu79n/0XvKqByUg82ql67oP9TiXOMQj3jUYkhZcbsYYJwjZCdDYnc0
         VS6EqRDOi3Pp1jRfbWpFn7OcqQL0LGfKNehwL5yjNU4L+UK4xc8LXHguoVshxIzIFd91
         2Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055081; x=1783659881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yaM6ECTNt+y7sLb5IR1bYHVjHz4BwlWWghAHWGeWZI4=;
        b=gRFINcBlpTHicrxoAutsr1sGuoQOhR02XVMeFTJW7o4LokOFf7USqQznXespkQ0Pye
         J4UmcvcaenFjRa/m/dCISltswWZeFU6PIJZWIPu5zQ8H+m5qdYDGcptKsPcaYxLkUwqa
         X+GijwSMVtaloLrbH5520kuumMWLfPj4/OVkB7gGf7qNMK2MAMnKwq2gjcNXtsFGOY5l
         7cSl72qhxs5NnYRKSYe6ftRPD9xH15hh2m9zCsR+iiAe8Ymm5oEje4/lrUrVWJlx55Ty
         yptxJHnaZiVkoYO+f9VBDfdMAv3gdyr3Rp1dHPXfA3/lO+ArnCsB0/KAeK9jieYe3QOL
         8BzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlGVIu5ZUKB+uxDQTf2UnvlYTvjt8NhGDM+g0CUHIDXNSrTIYn2scTDOkObW3nnqqyhQ4UgQHyvgRwJ+nW5RG8@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJzA01hqvHAnXb5bClQ+/pGkfDpl1qE75e+yaSN9DYvYseOng
	u6p/W6aZVvJBAPEAczhaL0O1pZTi5cDILbxKDjUgaI1o/JOEobVm3Zs6aWspg541x5QFIKCbCZi
	fwO0742gVe21NnNNzKVm5WYWfCJ9dmJQ0mrtU7HgotQEs1+gtJaiou/YSGGOqeH1QQEWFhu6k
X-Gm-Gg: AfdE7ckS4GkrWm+uJ7+TpU1c2o4ZnKfpUFvThtxu4oFzZ7IFuZwvImYeJgSfdL1e8x/
	64QX9dT3/A4nQI3oOeyPhZPTWejuc+/hHoAohQadGKAAtITeC+IbkhtW7jMQQFKpZnldc+vRJp3
	LJISX2LyzcdatdV1AE5z4NIaGSD9lBJ7RBzSI8EFOUWapoyfrHRzU97WExa3jYux6ccuFZV19iy
	rDNPzGU7O0aIJR+mLZIiQZdvbNwkmXYWmz1zalr0+AFszOzNomZK3lmgJUl7/guLX7YLqnIiLWM
	XU3RZnZ5YZd8i45+iZsONyTOSeZuRjwCXRZoZAFrPYEF3FGI6NNgrRmzUztxESODryvdLsGGNdF
	XgE3VpL6N2Vn5lh66cSqVGi6U1PYtdFhNRHmGqCiS
X-Received: by 2002:a17:90b:5845:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-380ba9453c6mr8281703a91.19.1783055080830;
        Thu, 02 Jul 2026 22:04:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-380ba9453c6mr8281673a91.19.1783055080342;
        Thu, 02 Jul 2026 22:04:40 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:39 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:12 +0530
Subject: [PATCH v4 09/10] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-9-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=4833;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ABIa2dnZxJbkTD7vqVOMfkjbVDGiXVjQk1hCuVnse1M=;
 b=C3B3kXOPyMnurF2RpED0IwL8hSGIsqTdUydr1v1qHP2nQzRzcLOKVf8dJbsnt6PsED3sarXiu
 FAKixSDQXR3BO63VF+TbkcCa0Aki7qTV69fqwvkOC899zXbH60BXSvb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: N1LBRwCkI79VqL8GA4rqmRog6xRvHKGR
X-Proofpoint-ORIG-GUID: N1LBRwCkI79VqL8GA4rqmRog6xRvHKGR
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4742e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WTijfvStGCArOK70lPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX03CBv/PHF5No
 nPNVlscbQEpy8LbtjIoRxmRr8/ziQJqPX/qg18ZpUWBzTl0YOUJz6KGyTvk3egQsdbPCGqM5WIx
 thDhYWVHyMDMdwh86U1KpJFw50J4I9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXwLrDJXpK1z4/
 MATy/t8oFog9Q3hqeXh4Fa5Pd2dMcAkRWD+xb+sqeF41d2KaFoe0Q8pd5tjYWRH7KRprdT3XcOL
 0U3gnhn9nc8+Uh034essTfSIiMcZQvux0GVwjp3VGnSGJTp4ojAcHGXBlYtyqf5iai4cNhqDwGv
 xCfnMEbwsJuJ/Vgm5APhsxCFXW1azEETV/7cyzxff64E5e4Sjo9ZR8rDV4FtVxBuexT44FWl3+h
 6lXrRKQAAbN4DTXMEpKGZaC8CB4Zqx1vBfpt5ympDm/oggUD3dlNMpvyer8FnyTBGwO8br3BR3n
 ZlDC7C9KFUjfqS/ZfYQvmkxeZElsXAceqPuLbJ6wD/lNspIRAQ37fpdkPJ0leiwz3KhhkNoUkcq
 ZDz/LE6QanTAZ4IxNMEqoaBT+idXiPX5+Gfgm5juz7XCzKdugFdHECZtWurkogyFTASMIrih508
 fhC/7kZSMEKHl0KA0zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..4576f9670962 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -7728,6 +7729,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8160,39 +8163,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8280,39 +8331,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

