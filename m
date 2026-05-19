Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151A3D348C
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175472; cv=none; b=YGqLJrh/fGACMMcwmZ3yFRZjij5WC1k5O7SlitkDe2Rf9Yu0wPeMW0F6lYzMKY1zPs8VtJIO1dECWyvNiARNEI9xy3n8H5V56vIp8jgIpNKzCRAbpvfRESqADXpmxxbfRJyjVTqfZtSN+o8mm5+bzSvXWIWz+4Gbt5zx4KGuptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175472; c=relaxed/simple;
	bh=3Ji3C8JJe4/d8U4AgLvbrOfT8BUcflDhcma8crXqLPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfM89pr+OOlAbBkwRqtKUrqmN3eeZyuGbdcAIWIzxBZBS3JRQDx2/n6YuI6Mvlw88j5O1Mu/yhpXheBu+98SIfb1989YzG3qDK+kBiX82SNHssKiq17TO/QWU10jaoqg6Zm5vC128O2j2LE1uaWqUCPU39ROa9xrgtp+yeXuVHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9ujTDoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqAOiX8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9ujTDoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqAOiX8K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1LAJa2975393
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=; b=U9ujTDoFBSVZb9M6
	rqAxDzANMN4Jgw4EWA6j2WGvqRSnpKdjnlKrkb6XRyWMBoucV1x3IhKrXOt25lOI
	SCVMpSNiqyJCjUqw966VisMpEuM7xg7hj9XgfxnX8MnWbfnWQ5ihKhADdw9GaKvs
	XVY+ybNhv4GWAeAdIz5UlHCPays5cNhL46/TBh1VtrtN9kPBldk9my3guAn75PgH
	65rJVv/Xyla07TuIrPWuffm97fxEzAWFWhbUJdZaXRJgiPeCZQs0s7g8pkgcWrae
	FBTQ6ugxW3QpSgNYiGrXE0WvmipPHZ7IWvIIrpfSSL5WXD43hpw6R4oXKwvysRPe
	twuzlQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4b6e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so3375032eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175469; x=1779780269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=;
        b=HqAOiX8K1yeZMMlMDj/sElOe1pOX0RZj0TH17SYYPQKGQqVjax0PdsdOokJiA0NFqb
         5lOBZIaJBQsZh0BDKHefd0+NVZaVyMApOFgC9O7N1KWaWDfmlOjPNteEKmTAn5AmT5Ra
         RZNGsTUhGzv1Ko8wXcdo6uUXseKp0dy02tIVve128py5A4G6kIZFAJN6UpO67Zkr/Z3x
         3scZlrRbp5uBEVAYUx1a0S8ogtjRr/xOJlXP77RM00DxAhHjaUqSGmWaz1j426ez3KOS
         X3RzUgfhQEmsJjNWvY8off+FqnG1EFu9fjOf+b6iucgC9Nk9HKIbjIrcDbtFydlWtFoV
         Jiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175469; x=1779780269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MBaZPmaMZaO9OsWhxCQha58YBZu16ccbeCjjhHuqYg=;
        b=ZbXUuKo+4HoRIZfBTbumRvV3f3J3WxRdwAPWAHNIvDugm3Z58HMV6/58Dr7R+b/HAi
         HXPbu3dmEAL6g4hXcJeSCQgCiUY9B5C3RX+8CuS9MfG01SBPrpj/JXnmcz8R95w3ZCc8
         FnyXVBi7Jqg6qW5I2qXAyH4XbKXlz1OnZSI/qZe/yk8jPyQJubb6baWuM5E66BgGWQT+
         wBWSHOpwAQOGFqp/R3aZDzxC37PS+3R849y6HXz/0b4uc0bWY9wbjRgPlzTBGW6+olWO
         1j+XtWYKncbYSmSD1baB2zBWOin3bXHImlFqq99rl4eNV36XPfkx7iqfxnB5AoaxWAbL
         A78A==
X-Forwarded-Encrypted: i=1; AFNElJ+lBA62EzbGzhilDkd3ru7CwawGcPPAhEysQnxGhEidL1qaYd9UUe2aQOYrETT5FXkDWImVnPTvv8bRxvAP2956@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8D+ui6Iv5nQL4UlY5Vf8XAvJAkQ0eL9byoFxCtzfjXAt1fSz+
	l+ppyydrbHkb5/l3mLglhO6TxAARAxUn5eqt03DaNoFlGVHn+L57zEVn/rutcAFpBFDLqWP82Qm
	YbysmENhBVBTUdmYf/qMWXJbK23yxK2Ozd+BfowANfpzm2tWmo4eYdw6oReFYIOemsSgkPyTP
X-Gm-Gg: Acq92OHbrdxpx1kgww6X6IfYvA0b4UiKqs1AF8xzsVfLeO/XT5ATDKNeOTe5uZ9s7zq
	SMbMMDDNc9ADtF2zS/Al+Xe1HLGRkp3aF8SQQXUG76MPwuqwj+TOWq/88xLox/QbV9nXYXbEH+6
	2ck24Oyh5gzQYedPDp4g1LFat3/aq/YV3PMRF1p8yuMYrwGIlQ7CSMrOOHk+Aij02efJHkihT3i
	RikqwbGy6uAN1LMGY4kOuoXG+x3Xim4kjLCJOLWZ++byRWy6HtmCXVo+wg4nR62bhYLmcDp3WuB
	ijSSBy0V9vGTmWjBCqVzC7IUQyhpr+hEvDFMlOsHm1ysi8MwbQ5bwZw513Wwk5Ep7k6cVqOIrzr
	sFT0aLONtPe+ukKdurVTHyMuGuYmusHSkuPNY7djHjdX7eJAPqcsdA+uQv6ZvW7YQpE8BuXLW
X-Received: by 2002:a05:7022:258a:b0:135:d7ab:7ed3 with SMTP id a92af1059eb24-135d7ab8500mr506580c88.15.1779175468996;
        Tue, 19 May 2026 00:24:28 -0700 (PDT)
X-Received: by 2002:a05:7022:258a:b0:135:d7ab:7ed3 with SMTP id a92af1059eb24-135d7ab8500mr506563c88.15.1779175468450;
        Tue, 19 May 2026 00:24:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:27 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:20 -0700
Subject: [PATCH v6 2/6] dt-bindings: remoteproc: qcom: move interrupts and
 interrupt-names list out of pas-common
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-2-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=15056;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=3Ji3C8JJe4/d8U4AgLvbrOfT8BUcflDhcma8crXqLPc=;
 b=xtY0kVoR0uuKipHJzZlC1uSf5QebZZn9sW89SThKDL4n6InoKg9YHzzx/knome+HL96hEyldn
 F4z/ezEQoj8AJDrovXs9Aj9T0NkL52xRfqkyTIhY/X5jVLvVcmnQ+WI
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c102d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4MiHK05HUdkkAtNoTgEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: PFxPkbiidldlS2KtZsXLZEhF2-81XsDw
X-Proofpoint-GUID: PFxPkbiidldlS2KtZsXLZEhF2-81XsDw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfXwTiIpuvPr5tS
 ndIdT3mdlELrG4A/aS1/I+k0lGsAaiYvhCCgSUfFE2qYN017Y9Lzs/HsioBQj5zMWQq23H6l3lo
 pbdPXfC7n+YmwPzbvwwtzMOC/ozdG6LQRBaiKvSDOUUYe4trpigviuEhxeomvlemNCLAK5zes+6
 ezmXqlTRaeCp2BnSSTa6G8EHfAYI2tccTvntRZkkzzyEx+TyKI/sLhO6P5hWERXH9NVRQRwBT+P
 RlccSJ1f5CYDf5xMsw2ZYJKARSBeIQiy7dpovv8WHhGDIttPhdRWHEQLyKOn9u0BLgz+fU8JIep
 VCooWMsutuQSKQrU6RPm9qFvN7p4L4I0jgij/urRjB0W9DUSuUQikgNEvQEXLXgTWbXUjRj4Q74
 t4Wrv/3y94X6zdPtU7vBf3w1iRNranH1AlPK9WB66KC5TW3jS1jlajlw88xix7xMN+EN+oSq6uB
 6XJmiq0Gk6mbLaw/3SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071

Move interrupts and interrupt-names list out of pas-common since they
will be redefined differently for Kaanapali SoCCP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
 .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
 .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
 .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
 .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
 14 files changed, 226 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a270834605da..16c35e15ee1b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -58,10 +58,20 @@ properties:
     description: Firmware name for the Hexagon core
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index e5cce0d05fc6..d22d50c1e1ea 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -34,12 +34,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
-    maxItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
-    maxItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   qcom,qmp:
     $ref: /schemas/types.yaml#/definitions/phandle
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 68c17bf18987..dc5a9981c12c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -26,23 +26,11 @@ properties:
 
   interrupts:
     minItems: 5
-    items:
-      - description: Watchdog interrupt
-      - description: Fatal interrupt
-      - description: Ready interrupt
-      - description: Handover interrupt
-      - description: Stop acknowledge interrupt
-      - description: Shutdown acknowledge interrupt
+    maxItems: 6
 
   interrupt-names:
     minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack
+    maxItems: 6
 
   iommus:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index ad45fd00ae34..5854b3d2041d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -32,10 +32,20 @@ properties:
       - const: xo
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
   power-domains: false
   power-domain-names: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index bcd2bcf96e24..7f287e55896e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -59,10 +59,20 @@ properties:
       - description: Memory region for main Firmware authentication
 
   interrupts:
-    maxItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
 
   interrupt-names:
-    maxItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 66b455d0a8e3..cb0a61fc301d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -48,6 +48,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 8227527c1d77..fef9d7c39f3c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -45,6 +45,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 8c4abde74915..2bbd427c6ea4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -30,10 +30,22 @@ properties:
       - const: xo
 
   interrupts:
-    minItems: 6
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
 
   interrupt-names:
-    minItems: 6
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
 
   power-domains:
     items:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index eeb6a8aafeb9..987fac433fae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -51,6 +51,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index c1a3cc308bdb..53ffb1ccd199 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -45,6 +45,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 7286b2baa19f..6823a2a8d74e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -39,6 +39,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
   smd-edge: false
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index a8cddf7e2fe1..8a1fae095a3b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -61,6 +61,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc..4ea7518db537 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -55,6 +55,26 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..74df49b5fbe9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -73,6 +73,26 @@ properties:
       - description: DSM Memory region 2
       - description: Memory region for Qlink Logging
 
+  interrupts:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Shutdown acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: shutdown-ack
+
 required:
   - compatible
   - reg

-- 
2.34.1

