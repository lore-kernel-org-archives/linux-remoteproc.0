Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21235C1B1
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055083; cv=none; b=oZvCahCV799TLFa4FDWO6gIUQVWOzehzVIEHyxAxG0OblhR33Bg0M11RxuoKcwNZSh9kxn+Yx4x4W3O9pJamLd7/I0ZuoW3ZvVSpRWPezzeJv+0I2AOMaaZsDhb9KIpTwPyFBvfcPWfUZQN44Zi3pGuKE4Kp0Y5cxmxvI2vcbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055083; c=relaxed/simple;
	bh=1mamkNJMTGOUgZwgMU04aGiuIuZNEqZ8TRLoDyllh1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNc6f2bTrBNDTRUmCMJkIJwZP3xjCVfNovlVdfifSpQANgAhTtsu9/3HKk7CXZW4bpQFXCMueTruJ2ema2QoEZROcDc/z3WWr6YKzFmr/BakCX28UPqO8Q/WEezAlxth5thAkG+fIU1FNm/itKDJrNgTxHTXo/zKGuUQPJeafMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aowLe5hZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYS31wWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aowLe5hZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYS31wWV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342w3r2838514
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtOyS5wEEpV+JrUmsXzVHwqPqgLkVhjK55bMdKm1ARM=; b=aowLe5hZ08Q1s2Sj
	zHwCxc5efTJ5flMIgW4pE7miuhKOz929qaZJ/5V8ydmlLI5fIJjzsZc8+3vRdR70
	d8qlG6YZCtR+yEkWHzFnwrfLaf6kOwxtcDjdlZ9LNQVt4xlRm1BIO1wRvtuhNoTH
	/MlaUpVFQBT7eDtYw1EVloQLH3jRD/UCslyied8eRq1Vkj1xlFgsztoUsbODUVqG
	6onXwMdxk58uuLaB5/kKhQpxJNUiQiMnJyNUWQSIkgBKSIZfra8Cx45aRnrkyq0R
	m1XH7imjVM6S8rEEcq0i/0uDuY5pOUIpXGgOqIi1TWicR+/iH1/s+W2dV/NImR6c
	J4INbw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwvdfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:04:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so754623a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055068; x=1783659868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtOyS5wEEpV+JrUmsXzVHwqPqgLkVhjK55bMdKm1ARM=;
        b=IYS31wWVNXVny7dr2P7MGPKziAeVJeeCacehKxGyTiIVOQkWH0q07EGGBcycgr03uL
         DXYH5NeTjbRB3f2BPrnqpury4+NiWqL3NkO/iTn0RhF9leAN0FStC9lVXqsC+8X2iGRE
         wDfsm3sioyvluhHAyll2nnO9+hqG9ZtQFi3NYTX1knrbfHbfRbdPOR4FdVZHNNORZZcE
         cyM7Qii2Ew7+ksU9IBdXRJ2+AMbFmGgbAfhgbPKqmHXqKKy5xL1ChsTusT5Q+41Eri/7
         XOhqHHAnuVfUT0Eqk/3d907YNfXVqsoW1xV5ulJg7IAosTVULm4AHsPAG8nl633JCBmY
         8ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055068; x=1783659868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtOyS5wEEpV+JrUmsXzVHwqPqgLkVhjK55bMdKm1ARM=;
        b=e2QAzqMXFXjNyKGLKulygFA0ois2lESvU04T1Ek3Zs8zUx93+JPOLwSOpJNI7xQU0c
         q07s/EJMetSOMu/8QtrgiE52JiOpdhk6V/wZoxM/vJka16NiwnpYOWEpR5jPiBuBUzON
         8ZNwB5RVOHZaytTSnZBoNz20yhYZ+Lg5F0PnqwhMa7MdGg6+JZP9QEldVjyXgRzzZGc8
         h9cwlNYbE8lmSmJoAPk6SUPKKM+S3clc0SZx6zt+CQIFXsLRa7/FPOgDsxrCMd68pJkn
         G+Ir/P5JRdQtMgq0puLzudIbsXUjazOrrr55yOzjk/HwneuqdoKU0XQD7hoAIA+TEpb4
         dDrw==
X-Forwarded-Encrypted: i=1; AHgh+RooWYWYY7/Wt/+5x0yscIYNlzX99DxCfPKsSdaMmSguZ7avjWtfN01s8lzUL3Fz/gQczSAuTOJdRPPNamx+frkl@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVOF2o4FMkxpA9lho6ChbRVpf/b8DUF8+0TJzVw1CqK9jom0n
	Gh+jN7Z+fDrIG2H4Fd7/B72Gf5YrjXjZIOmfOKRwd7QtyAlBTVQhyk6f9Mx8C4VeWZVZWzLnPLm
	dvZz8vjGCKXG5a1kjPqhHbPH8ED+K31tiu8gYHVT/dl4QjwS8xbgQB3YxeO4NurScLj4T2nyZ
X-Gm-Gg: AfdE7clQtNqcJfDvuUujN7Bi/VvAlHv2LI0PZLnVMU7x9mZAPN0J7i726AJoN/TfplF
	GU1NJ73leLn/CCj2MPp9aD7NJx7TfxOeROg0hZnbVlsdxiYoq+6wtcn7yzfSdogLA1aD5aKdFB3
	Ylmg2ApQU3TqjBThij9PmiQxG9UXMRRmtaoiipao3h+rsf72Vggk5N98rYFZQFYB69n54n6teUp
	Ej5FBgWEH2J3eYwxUbRS4WdG3zZzEycbMjpwctVdD5zAVloSYpF67N66bFD1qDn1/EE2S7p2FlT
	PKviZvBhDG/FnB94V2S9176cXcoMIzfa39+4LhfuIgQbWs0s/0xy0ZImgnNyB9r7qYy9WblJdzE
	L324i2GtrEEeJuJzmlp5uJ9zmL+S4XvIKf3wretVB
X-Received: by 2002:a17:90b:5710:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-380ba96887fmr8674597a91.25.1783055067612;
        Thu, 02 Jul 2026 22:04:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5710:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-380ba96887fmr8674546a91.25.1783055067048;
        Thu, 02 Jul 2026 22:04:27 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:26 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:10 +0530
Subject: [PATCH v4 07/10] arm64: dts: qcom: lemans: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-7-3882189c1f83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=8045;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=1mamkNJMTGOUgZwgMU04aGiuIuZNEqZ8TRLoDyllh1w=;
 b=nai306MkNEB+ywD43ClLI2EkK+RGCAZ6/PJqWS7fndPiRr3Eb5A4uHzQd9vfdaCGn2hcVp7pX
 whZdAVxJe9PDFhNBo98qY/uOJ9JDaUew5st7ywJnX8jxePcCB9KhEaf
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: fjVBiAvNWgfPQjo1MShrPAoVzTWCX1go
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX882llrPfir2O
 tQ6ooSEzQ05jdtx8BYZQEg2DQKPKQ6mMmNg0wRm7T95q/sz1WH8nHajI0bL3JyP4ovD0k+GQCFF
 6Zr2ReHiCZ7iDdI+7Cfm7riZpkfNTBKkqFWneh7IXWAt7UZG3gY7QxZF7e6TU1rH84VGzmM48gC
 qVc6H751FLAaYFcqSejUCsJf3EBU2326DzUtaHfZyIBtNdbvHhSYnRtC5k4WIPFbG4R1zvgNX7r
 /NQO2Izjy+n5Dot+dmbAIyCyBM50o1jxH/jOnTJxUmkKWzQbQptYgAzINieyxiMq8FJ7xYyNEKx
 p0HDX5aJCCrO16R9S9916dY2ssM93DRNGIbvrR3A2P1JfpILyClFntMXlSgwEenYJ13AZhO+9gZ
 xG+09Bq7gt4Uv5QWAUcLFMGIQaPDFjdcBHFE1VAapXDRntzsCz/c/YUVi9gmh/P52dCgrUDRs4f
 BZ8JtspxpCd7jOLNwHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX1AFS6qhTXoAO
 rlsHKqPlluApQTbnfX2cPShCKDTADoGEql3S7apAjsEo17RciGfuK4hYcxTHDhqHB4t8mK1xFZS
 I4KIxGHm8ArUlPbOdqP6/QhieEWNCpI=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4742dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cnwIH0_uZE9cE6M6O2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fjVBiAvNWgfPQjo1MShrPAoVzTWCX1go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in lemans.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 125 +++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..89fa25e9d3c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -7777,6 +7778,8 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp0_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -7916,6 +7919,8 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			qcom,smem-states = <&smp2p_cdsp1_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8764,7 +8769,7 @@ nsp-0-0-0-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8776,6 +8781,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
@@ -8784,7 +8797,7 @@ nsp-0-1-0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8796,6 +8809,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
@@ -8804,7 +8825,7 @@ nsp-0-2-0-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8816,6 +8837,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-0-thermal {
@@ -8824,7 +8853,7 @@ nsp-1-0-0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8836,6 +8865,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-0-thermal {
@@ -8844,7 +8881,7 @@ nsp-1-1-0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8856,6 +8893,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-0-thermal {
@@ -8864,7 +8909,7 @@ nsp-1-2-0-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8876,6 +8921,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -9018,7 +9071,7 @@ nsp-0-0-1-thermal {
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9030,6 +9083,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
@@ -9038,7 +9099,7 @@ nsp-0-1-1-thermal {
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9050,6 +9111,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
@@ -9058,7 +9127,7 @@ nsp-0-2-1-thermal {
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9070,6 +9139,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-1-thermal {
@@ -9078,7 +9155,7 @@ nsp-1-0-1-thermal {
 			thermal-sensors = <&tsens3 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9090,6 +9167,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-1-thermal {
@@ -9098,7 +9183,7 @@ nsp-1-1-1-thermal {
 			thermal-sensors = <&tsens3 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9110,6 +9195,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-1-thermal {
@@ -9118,7 +9211,7 @@ nsp-1-2-1-thermal {
 			thermal-sensors = <&tsens3 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9130,6 +9223,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

