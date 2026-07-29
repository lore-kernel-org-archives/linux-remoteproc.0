Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3343F087
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315082; cv=none; b=teaIieTaQ1gcEecrHuwS+wsHrF3AlalLRg6ivotDUNs/POBMzWkii8grhliRRbndZr9QWknvEI8cOFdG93+G2WmSPz7gY4GAE9TtKDkWfMbPrbSF+iFozoFzSMKnL0Kq3pIE1vmyv4MIqtq8dmZLQYM1MMCuvYDg4wPW7XSXoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315082; c=relaxed/simple;
	bh=JPb4mh/lcoR4hStiesvG0JTpEOv13ZG7MeBKtDJcAZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rVPuv2eeZi60nZfvpxZ4L4xH+ba2+Lo36lqjW0E04K6mnnUZiuaNUYBXieByTS2RgclVk+5I+2/oSlsDyqjaGExZWXNIic/hNU9Ol05eGt+OlPWVvjr6iWXdeemXaUMmljoWxero0VqpBRH0pNwi1SeCz/kwr2by3kxinMYB5Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXhSYcWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJPdLSlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXhSYcWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJPdLSlY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f6ee1309873
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dX5yusLcAsWcliIf1X5ctV
	TzZQfa4f6t3wL4b8cfL1A=; b=QXhSYcWeA56dPh8WN+KsNelUrFCRmkbRZJArsQ
	SY27Mvxu+UrgBwPdTf7hmP09CmbdEEnUMcfthHNsEje7GfSD/T50iry8ZVfM1WV9
	Z1PKd7na7fv7H3BjbwKATprIOmZ95bvT6AKOzYABGAT6D0b9OQDdfJ7kq+0Tw47B
	c17NPGIRZZBD597srJcEMjSKNSWn2PAMA9mHgAD/0CWXYMYSOixK5paY1OH2RA/q
	uWyQw7F+dMUISQvzq8EdSwRdIbIVMtEh/4iOF7vS3T5NABJ7phgh2837oVJ21xDa
	qfETcHtQiemg14xfy8RtfCUixYZQ49AxyxVfrNgk6BX9prgg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa3311gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8488ac68185so1823483b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315074; x=1785919874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dX5yusLcAsWcliIf1X5ctVTzZQfa4f6t3wL4b8cfL1A=;
        b=IJPdLSlYcqWtOklCSfkGoLYM9URAzBIkdnQ0QDMwLXiSWqtUZAQab+QPuWpT7fyb4q
         Tewpq5XLvYFcMmgGQ23zoSKGPD3w77tiwj0r/eW0jWBywr/XT88+QOPYWay6zflsrzvX
         eB8IF/6pRlhzT4s5PTqR/QUhWMu//nCu9+5tpbdCyt+J717oN0frCPWxJjo88ven0DfQ
         GnWHES9UBFWAhT8zcJqMD9BA4oNz3Wz9LUyU9o/ByClT9JZWkamrPH50xBvccAW9URFD
         VRFVUApGeBkZ3k4o7c+Z+5FjLQ7P4wjKGjUIx6bit4xyW7uedzUP2e/ZjaBrcqDnshJR
         87Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315074; x=1785919874;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dX5yusLcAsWcliIf1X5ctVTzZQfa4f6t3wL4b8cfL1A=;
        b=pnU1TqdQtSPq0xBNW9pYgJ8hj+C/qXA/GGDKxA08hZYgtOMc4LVwS0AojQH7nIp5EL
         Tz503/dZsPZ/HKGYMJ81keai4x9Mu8jWwc3FbuCq5qnt/j6XSUnJtDCudKFPQWXasvHM
         YTYr+EdKd4Hq0MlOz7BfSU8kNdnjpiNofGI4LoEeEpeG4iL2irTuQELdG7wYpNaAFIVR
         3KKj9KzW2Tj++bBbEk0I6FNk3Ic/MjEVrNEP4tVV0dTCVJ5vSCoGUCTEyMxk4sZ4RU9S
         e+bwywo6BdRmND5Scy/zFB+DaKqP4zwpxd64M0dDrlFGTDSARo6sat6rHLmsQXCsAvY0
         v++Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYEHh8ajjIZpSVKO7d/u7F8C0RphZ0qFANX+3AcJ2BXDjtFKvqYJZl5uuxQ4cyt76BFphkwl6Gf6SzcYcp5DPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJzK2bKvGTKHXuBJGk8WBWKoVYA0lNUwJrQ1ELZyMNB+2UdIu
	nZ9M59XP4vzHJrt0cQKGfIjOIafWFyK48kwqJUjCl/a9fA5HFKbgdNwAdPL5+ym9goQdMSuPKGC
	5cXCQu60vIs7MstySN6K/PbcS4kZ641Pb7a1hhE75dpTeYDPYi317zB4Aue7xdXmd6KdGSxZj
X-Gm-Gg: AR+sD12gWOvhDO3EeBvoUs1D6C/GrVWz5G22UlMGYPqfw04/VBOaGpm5aOZIGx00DOe
	fNWEzESsp9zSvA9eYikkvHOyA8U5qS+D0+QTO8nQev9tI8Xchy2UmaxHhDGsPNldmTIKMmtUB8R
	Bhh3Asdq2IDqfdxuifcOjIWVyxXy0Af6cOkmrEjIzUUlgvQ237YpDa2lxD6+7ciJO3xpOKX3gFr
	3Tdmqi5+PTOcI5WXiY+2T5MOFeTNLzE5QZgemlOHP96ItzAfcx7ui6SLoXw0SW0uLlUlD/26gOS
	9aJZgfQswNjMzTRjY5D3uUPcmI8OL8AqkCKSOLJ0KO5BwGD57dT+w1Mq4Po+tgUHCaD4l9+FLwf
	wb5EahzyytERK0bMi8huSDSh7rLmshpNxrkT/
X-Received: by 2002:a05:6a00:3991:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84e931d34a0mr5767525b3a.18.1785315073702;
        Wed, 29 Jul 2026 01:51:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:3991:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84e931d34a0mr5767507b3a.18.1785315073258;
        Wed, 29 Jul 2026 01:51:13 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373ad9sm1032879b3a.40.2026.07.29.01.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:51:12 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:01 +0530
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPS+aWoC/42NQQ6CMBBFr0K6dgitQsGV9zAsSltgom2xIwRDu
 LuVE7j5yfuL9zZGNqIlds02Fu2ChMEnEKeM6VH5wQKaxEwUoiqkkEAjPqKCSRF0yoFx8wodeoN
 +AFGrqusbWZdSs2SYou1xPez3NvGI9A7xc8QW/nv/8y4cOOiCl42W+mzN5RaI8tesnjo4l6dh7
 b7vX2kAk6XNAAAA
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785315069; l=2197;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=JPb4mh/lcoR4hStiesvG0JTpEOv13ZG7MeBKtDJcAZE=;
 b=jsDkA59GHIKBKgGtN+CoU88k2YtUaaRecEK2D2P6ECAFBlpvyLOtWex8kvJrey2dPK1qecF2m
 hHx7hxfvVD5Beizercp70Qifbis8u8mZQBo1Ge0F1hnWPiqZxipKx35
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MSBTYWx0ZWRfX+zjEe4nT4pOz
 gq16uiJaWiM08NmYqjn5NqDByFnnYqGdwoZZ5j9bHQYlrgV6X80yYXPE2f4DXzFgKJ3ZHX2Qn/n
 SEqMmbBjS+4VAgmUPSJmkbBcFxitEJ1oUznAMeaNOmIYXMLZ33zJEzeFy87F4gEBuJGsL2tEoRq
 CSJcUi7YM/BL793Prt9o+DbmwBLdJrkZx5fT2yAp/zS0UOLliJZwWQJneq5RXAviouxe7++d1AB
 1BFAPx8vxSg5Xek+APEVLINUW0lH+iHWL6QRDiyp5yh809+XHqW1EngubYq+RqmEZ36uO6OMG17
 g7xVv9T79/Bg4dGHGP/pHMBGLM7cnyY/BM6i1CfJ2oFKWr4omvTk3yOWWdepVcqRSQw9RvX+FMT
 zjSfTnnGmEN1JroVk/OcRmHKh399eoCiZJR/LhXiRmQqOcTOdohBvNqCkmaPFG7hhDSkkEflvCw
 Mu1ZqkNSPFiI+9xsN7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MSBTYWx0ZWRfX1xNCD4vj8HaN
 YZhYnoYLlLHc3m0U/Vdn1daZ+dDgZuBy/73K84aSTqAcHvcaF1vYWze+uEjPOdKob7Wc3Si/GC5
 rFESka6GeHZFwBT7Lgm6rYCCG/UzICU=
X-Proofpoint-ORIG-GUID: XO-9ym32m_kZQMYiZerr_kOJhKkKi79g
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69bf02 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XH-foFg1LfkvKcJC160A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: XO-9ym32m_kZQMYiZerr_kOJhKkKi79g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290071

The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
does not list bam-dmux, so any DT adding this subnode fails schema
validation.

Add an optional bam-dmux property referencing qcom,bam-dmux.yaml,
mirroring qcom,msm8916-mss-pil.yaml.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
- Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..eeb87aa5fae7ad9022fc800075c2f9e906b16ae6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -117,6 +122,16 @@ allOf:
         power-domains: false
         power-domain-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        bam-dmux: false
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

