Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF23AEF2C
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805830; cv=none; b=u7RGXedGemzKq/9U+wc0XH71FZvux+qi/cfbMHd7/96kQ8PV6xfsjAEbhuVnS7rMSHAg8SU1KXTlU7I1ZNGWck/eoo2MRa0udpAJ2ngVo3e8LE9CDCLKJJFwARzoPkS8Ytb32kbDk0MFNVlP5FtzUxcO6M91TZ5kjK6VDS7Gk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805830; c=relaxed/simple;
	bh=kJAc7f5m5jxavMkgdIHdotCTd133ITydGJDsM8ctX+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTn+Ow268k1UtYlwoOcuBL/lRfTVDoywrYAQl0GHl9wMp6uAo6VGa7KZB/655GT4ucdyRD3tXYTqUZk05nD8k1RlSo+mUfAhJOeWZ85bWXfKEP/S+LW7K/ZIR4XRoiMjXfPatTWGqs0nhbBXP8/6zl8RCuImLE0UiJl14sPaoII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcX/xm6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9X/K4GC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcX/xm6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9X/K4GC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BcF63631290
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Mar 2026 14:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkj
	Pv6/pb60=; b=gcX/xm6HmU67074MVmE9teSdUwGPWt3J/qIS1GhXSsOazi/ExHV
	pJk6bTRxemgeDPsKFShQXxKJiAabAE5ssaIzRoi89goD5LalNGSCnMPuCYPx6JTW
	PbNQkBJtoeNaWYXo9HtvOtYnw9gNM/gWcTqO3rCWksNEPaySjg+sIObP8Qe+89W6
	uxff01OfydmJkr3AP7qge1bWiN31Et+sidktV/B9kYKJonuye7fa3DDKD1I9kBUd
	7oBQn5lZlYMN4PxhpT/7PjK8wSXJQyQxzIsLNkrWMT2sQvAtx++zpaO0acSwvYd9
	oGyiTQSa91e+U03q4t5jKKKaIiQPi9h7djw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4savvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 14:03:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21146933so6577501eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805827; x=1773410627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkjPv6/pb60=;
        b=C9X/K4GCviyYahOoB4o7NYj8g4SOm4Egf1ZHhwbbYr8KhapwTiFB67jIofac/0uEhf
         HS5fYuLQ9u8HaD9uSqWFEGSWHvqAgqpXUUMSKmyjxW5N0e6KhDO6OaMF7t/xcA26qZeo
         +It42emCIyKZkzG0oteFWohQHphfzbZq5eIVsxVzTjfzUsY2Zm38f5n9x1+uGnlIbjkA
         40IDKacQs5k4dTavvbZtzU047wCeqwiMiZSaSHTZKhuf2KId4npB6GGE8kBc66Tlqym2
         bu6+vfjeyQHC6JCksdSR6AbS6MsbpUCxhYHgQd+vS3OU+R9jgwGKO+waYzqQrAwIBSuh
         Tepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805827; x=1773410627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkjPv6/pb60=;
        b=UXxOG4yoXFh1tiBQqjDOlGuTgJSSREWozVCkt+FbYW08BcV+MC9EprLF0OWhh7YxhE
         6/+0tCkbxBRhx8h9bfXZShiEfEENsf1fm8yJO3DZFrW45iBE38lJcmy3wXMQd/EEe5yA
         6S0Am7PMZbjUVRaRdoCxrjEFcmGKs9tmrWxVNYBV4hNtrNfd2Ok8uuVkMwHq6B4A4qE3
         C1+Jn50IojPxLripj+np1atVrer6xlv6NFze4Kdpt05lhy3RF+RXFZPtWBR4V3OSx8L8
         5uYUtmjHAeJfkCGeuvlKZWrcs64nzJBNH9Fs1o7LdO+/4NaKRK9cW0W6bowwQepkbfb7
         03aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZAqEOGGM2valvVTZ7oMe5OlDg7C1doTSjpHX3h2RZtN2t+7IF0lNNyItiwd0zNzWMm/VtwUfPi2NLAxRe0d/i@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsWYKRj48d7KqBSDuiTM1z1hyT5ge12OvddhhoJ6V8ZlkgdEG
	M9PttPKXy7+C00IQpqXk2XIO0hmkTsRSsNw+kaBoqmR9KrvGfr/o5cNaWTek9Y+NYmsvrAVMgkj
	k6zay/7HtC0EcdIu9mZs3NHgmsFt/yuvU4svq/Unu48uO4sSjTHqa1ycZW0j7nH+13Avcx9R3
X-Gm-Gg: ATEYQzy8oLXC4TReI58Nv1Z8gwpXEqGlUm0XQoe+Nte1kbpRw6tkNpqKJ41GH2PEaGM
	iHEu2D92ShyDTYVpfAjUFdR7PLiI1PkQO1zxtLgFqzzbWTckKfm+6ZpqsetBVmfd2ojCdDHSKB2
	xiYAIUdeSgIaHcRec/dAZApJkdhgD32izhyugMCKkqwfgaOzA6N0t1zgBLyyF2mrrOqL0a6/EAW
	DbBQdxoKiguXikQP6tGYdJ3dsvYbVtnL54w3tNAHGZFTXh2+ljUPwaKs1sk7vfa6w8Ih8g87bhy
	e0mcXfOqCw+B4+Tf9kJC/geWEMtr8JJL0xUbZUV16pTrOi+NTh/PmlfpZONIsXD9MAr4NGM9FaB
	offiwle7/GED2dUcfrVo4jHxGDJqOOK9pDOZ1BzhK7lOB1WeYuvamW4vpxFso5QvtbyA3apI0DB
	Hkz7kIQw==
X-Received: by 2002:a05:7300:a44d:b0:2b8:6ad3:804e with SMTP id 5a478bee46e88-2be4e0555a3mr767863eec.22.1772805826499;
        Fri, 06 Mar 2026 06:03:46 -0800 (PST)
X-Received: by 2002:a05:7300:a44d:b0:2b8:6ad3:804e with SMTP id 5a478bee46e88-2be4e0555a3mr767820eec.22.1772805825537;
        Fri, 06 Mar 2026 06:03:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm1200531eec.19.2026.03.06.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:44 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom: Drop types for firmware-name
Date: Fri,  6 Mar 2026 22:03:06 +0800
Message-ID: <20260306140306.1328719-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX9BHIfnupyVF4
 yh3qlxvoNi5XIfwqB6y1sOsdN8g6z40VpPT1W+SLBCDlGiss1QKZWDnEmHT5YgnKk/f2N79QQeN
 +66LTxNg1S+7EmiHMuseA0iWkAx3ik4/A000WECXyR4D1I9HQe3cXq8gP3I+fKIUARTO/ao6sd6
 0szAfeIQorzl+FZlxdsRRYDVmYH35cLbGRSHuef8DND9dV3J/duDhOQ5IvJzUDsRQ5LMk2Mkw3U
 wXE2ww/QFT4DbO6NswXGOJceI9buzeWrVqAV5C0Y/vBEvxrV9PuGFbTxAKZfQwAvLZQlgCDCc11
 9rk4SK2NaLHq/55xvAcXX4Md+L3NvYN1mQNdTqw2trCV30bEPMPET9P8D44P1JpCao6PHBzLYSo
 bFyoySZ8ItoqYKpQ3BIa9xS4e3t4bYiEG2co43r3dl1CKGMOA4/V2LnCxElFyVWO2X+N4F90YWv
 iXaJoclyajIzYY7YEig==
X-Proofpoint-ORIG-GUID: zJdauXZIzn9szpd6vRZW4ZtrytUaD28G
X-Proofpoint-GUID: zJdauXZIzn9szpd6vRZW4ZtrytUaD28G
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aadec3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nzWYI2exGoiye4W2V5EA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134

The type of firmware-name is already defined by core schemas.  Some of
qcom remoteproc bindings define it redundantly, while others do not.
Drop it to be consistent and avoid it being copied over to new files.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml         | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml      | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml      | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml        | 1 -
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml | 1 -
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
 8 files changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..1e7c165f925e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -137,7 +137,6 @@ properties:
       - description: MPSS reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 4d2055f283ac..1b65813cc8ad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -126,7 +126,6 @@ properties:
       - description: Metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 188a25194000..bcd2bcf96e24 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -51,7 +51,6 @@ properties:
     description: Reference to the AOSS side-channel message RAM.
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
index b1402bef0ebe..7c9accac92d0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
index 005cb21732af..f349c303fa07 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 5dbda3a55047..63ae3a30f626 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -42,7 +42,6 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 5d463272165f..7e67eda13240 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -56,7 +56,6 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 11b056d6a480..27b8c127d74f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -52,7 +52,6 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
-- 
2.43.0

