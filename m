Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0315411693
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615419; cv=none; b=r5ZHbffRI7v20rWPav1Btm5vXNKi6aCzLDIOznsyPcCh4niDYG24qak8IH6WI23oZm0dyJ5Thz4tyJ2KbbCAej3yoDotpWji58rAuhu5aCrwzuvDGwK2nm0KJfo9OhgB7Ydv4mgIG821kvGRt2IoQPdR/yB/hKh3dMius41kHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615419; c=relaxed/simple;
	bh=/XGaEx/WlMFIsBwdLtdXEKKSzLHpI+liCqwpIwdMBQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/tYVmf5H0N1tSBlN4oLq9DFoszCykxG8o6glCznruv+CaQ0cQDOGW4VGAHojaPUkYTb5QYdqACsxEikrR3LECslFCkAdYyxOeqriAf8NQJddd+OxuOINK1X0Ka8z5hUl/GIONHf1nEVdecjXQ9CBa8eh5tGBPT5e1REiPzE+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsYv2bsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvs9XNyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsYv2bsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvs9XNyy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6NGdi3978765
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v2pLS9vuueRYHFLtQoSMHRM+1vbkZrHQovIOvP6imo=; b=OsYv2bsIE7bbemxd
	QOQd+pnKAMJgBU+FMRH09K2Q72fHbWMOKd/pC5QM06lV5MYF6Ddi7XSy1QkRwMUo
	jEFhvM5VY3BvTjSPHMBmkXAD/nKWsCIJsY5x8tC44uQS+QUx2whqeE8Slqaol5Yq
	u2s6dG2TpcL3k8PiS7sbZH2g03KBmPle/hBgVB2FUAkh8QQoojWZwRb9PI5X0XwZ
	8JizrL15jINhN5oAuvhArOioHZgdZDS2rDdhKymMiDrGMlVeLTWJ8NOqoK2N/De1
	uJAAFZnyojxW3TeeQDqKDIPtdV4hTtRhjq+YIzasekanztkEwWreqnj5HrdeiDwZ
	wa6OpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42s62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so214481415ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 23:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615416; x=1785220216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/v2pLS9vuueRYHFLtQoSMHRM+1vbkZrHQovIOvP6imo=;
        b=Fvs9XNyyQ997zW6kNNLJVSR+evdtxXSzCYqc+d4AP7wQoCj1GpkbhCvP3zmi+Dk3S7
         9UM+a20hRPdsxc4DH4IVWvKF7hSyKGEMxzhTaRTFbIgB2UkwD/ES/jR+1cDTocDbWPDt
         k/m8jqhnXKJxXOeg8VBrMVyvAQGd/Dm2VAAZaojLdW3je2WBEyvLZCKuYK1OWC2F/eQT
         SbJD+rZgiE6/lEKfvu1v7XiFIeFA4mn13XHvY9Paor3tb3jySGvhfy3LjIgjCI7VlgFt
         gY0RuSRwhjrEpaRDu45oNzUHXqDdTSR9Lq0uUXZmxwMG//4s6rFZS6rLnTUe5WPRa3hs
         YRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615416; x=1785220216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v2pLS9vuueRYHFLtQoSMHRM+1vbkZrHQovIOvP6imo=;
        b=A5g0stNIBoV6xY3pwyxRT4IBjo1CQvaGqB4XdtIXPgfXiAer0wto9BgTB3T7gaJs1m
         iS7hAEM+2c/mrsQ21Go1JyFi5RbTPomWgGSfghII4Z/N7OI4Crz7Bt1xuRC8lMrv/3qW
         9Jm6tO9FlfuO7rhvA+V7RJfKMvA0sHrB9lu3Dy9pwe9JuWjgQt2wTnxzSkjiJOJPp0YX
         wWJj/+6vy+14BAks1o4bYfmY88TrEnZm1gIB5DGJW2RExV+utIPxT9Gyl24/bcW4WfDp
         eKTZStYexfdKmpLmzP1o8f7lFw6oiwsK7UNPJC6aLLkELe4RkgiP666u5gSqnkV7RV9g
         xV4w==
X-Forwarded-Encrypted: i=1; AHgh+RqWuogF/GGykISWT+E6st6W4MRRhRKxpaKH5op/JLmTprD0IiHXA/XOs64arnKVNpVr4x3wBtKPuVL7ajWGD5Zw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg6Wq3tPFRD3yJRGnbLpsH/B4NmAzz7RRx6XQPaYfAOuQsLEyB
	aO4FYSkbwty2DE1sDS0N/3eepdKL6FhsQK4GMquNAkyZ7XjyQrCM38YGOiVwIbaFwfpOUSgYsMC
	QxbaQ77HlKfJUsXc3RGYElYzfbxFGS0ucDrtm8Ys02z5ZYvK2+lm+RHRK/JuKoLtZlo1gPLbO
X-Gm-Gg: AR+sD10x9nCUXVU/cJWejqqNb0qaJJaC4dNYbfC2OZv4KjvA5nZpZC+Zbv44L3IvZlY
	azR2JJFmp71Xu6LuLGZWRjn6FV230ApCflhKYz6WUYt2k3VwVuUU+g+azVl79MqSEpyYEIxPttg
	hmWzOGGmPH7r/S+4wknximeluF8dYEJUWiRijZ7DHkGuubx0EovpjzIMR3WqOUZd3a5sodcVfir
	I5jvkBpCtyNyGxJ1XNYuawahqLKih4p5RR1Zxa6RUeQ7riC2Xq1MNbYd3EkZH5hfYhSoc4C2rof
	0LINUccKuCEv4aOktMBDS1DcyBUHygGGcZwAyppjD2XJqSy3hJpgxFqBm25Ji40bvkm3opu6oFN
	7UX1j0yobvBVQZMFzVV4nPAL0uhGZaA==
X-Received: by 2002:a17:903:8c8:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2cf349640f3mr176100555ad.23.1784615415537;
        Mon, 20 Jul 2026 23:30:15 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2cf349640f3mr176100025ad.23.1784615415106;
        Mon, 20 Jul 2026 23:30:15 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:30:14 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:05 +0530
Subject: [PATCH v5 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-8-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=4882;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=/XGaEx/WlMFIsBwdLtdXEKKSzLHpI+liCqwpIwdMBQc=;
 b=dbjn5kugB4slamt/ESErO+iU/NTJKDYUhz1yFloFURfbXK2PGggxHi/EQ31n8reQybBZGeHGj
 jiyR/FoWkENDWUZyZSOXIjEFYNaPQ3rzAdLjrknuVzkQpeoGZztUwuV
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: GbHhO13Ex0TtEsNIM4rLgPsDW2ZPLgAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX3XVgZLrYJjfq
 +Qdy3SQnxSL3JRH1MapJlJDfmuW59TYuD6JXODLRWXZTi1loTWEycmemanJbfUFkWHZJDim4zq2
 poSHeDppWRrV2drYJZNXGTdtzwi7SEUaOEg9FcWmRjn5PSoc0C/y4AC1wSErA+cQpgNPWjwMqGN
 5M80CbL5UKq0CIEtudh3/9/GRov8GkYYX9X67Mdwse+SsTNQcuUPEBvTZ4kgLOSN/phnLAoAPFx
 7X5LR3L7jUwPrry91Hw8d4E/e4XUDgyKbGG1YpITntHzPe7cSwIIbk2WfW9nptW+qEeRw1wUCJA
 vHqb6hHfElhiVqKN0yime1LLfKwmwNIsxWPmWEc1pDWjaf/1bfQKAPYY7B6lmYP7uyaoHPj3CWc
 EE6ueYZ8J8uNklGXGwWadYZiGHgc6Ek5STA0rbkB9NNiTcZsFqrEuuKexYBlYpvYFb7lgJvAWUf
 5cf0aFokaZRJG/0fXUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX5BkTYG5OTfAN
 0eGnYm7LMWuMHZuN33RDupwVn/vMCrZudn6gZcrheVwaAHOcuxwWwTyur6FMjOhvGj5ObQkUMdU
 5yU/EkQTH+gWcz8/OYFQ4PRPpE2atR0=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f11f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GbHhO13Ex0TtEsNIM4rLgPsDW2ZPLgAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210065

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..cf30939b4cbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -7738,6 +7739,8 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -8170,39 +8173,87 @@ cpu-critical {
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8290,39 +8341,87 @@ cpu-critical {
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1

