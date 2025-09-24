Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CA31B13F
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739091; cv=none; b=ZRALhIGO45IEgKJiS0MJashnM8V2CSkL0i47r7iKXVhdiRuAtb5ExeRsOCtTSvJw4dMb3LLVxpPwxRLA/TnBUBKkOcoG/i4W/bcFqKaIXEaB8367oanG9mJe+RTQokjcm8pVfhfUt9FiR1TopyEiAmJsxJiVoLFgkPyZ+lYE7ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739091; c=relaxed/simple;
	bh=dWgRWKg9c1JS8VUIKBovpHGwX2fAT4eNnMOUTyOCEnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R15ope6dKtpH+8hYQXdiZ0cSUAHqNDb9XG0nLDxXj7qpAh+0s/kBdY/BHPZRXMJKpQHyTHA8FZ4jRIl4zAj9HAER7/qrdN5j8Wwro8ziAAf4nAEGiMWnspVNSVKUKZuWAt7i+wI/XpxuasgP5lRo02Ug7EySE/YpiodOCleGQc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDso2loU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDso2loU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCGQcr016438
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2QgtMUT3ZcJ
	WxmG8dCgxr0VkowdSceCN1072QlAo8co=; b=JDso2loUSBk3hQ6nJsXjz2z2CVY
	mJw0O1Ul9o1SPoHPP4OPKSlJ+b8RHNXzf2NeqYe4F8m8KvP0kG+/r0CbrrZq98UK
	FD1FAPDAWPmoFLDU3H5b229wrZ+a4dLlHKJ0hXplO5UU0YHGq6OYvHNeSC1BU7H+
	s0hI2uicRkz7Y0NeaKc+qkejjYlAY0+WFRC1rHWxdXX+NyeRibmP4VVGdPh13m0R
	ZhL1fiTripmGVbPPMqgNMj5jkA5bqdUVf1dyzQvDfKotlAHrrscIhtpAyK8bd69T
	W6ivgyJrOcQB5xB03+B+Ppy6hWVWmP+4yBq/NEw3L2FpIGvLcey035sqbfw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyh8cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2699ed6d43dso1132015ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739088; x=1759343888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QgtMUT3ZcJWxmG8dCgxr0VkowdSceCN1072QlAo8co=;
        b=JyzYPdH49JkzvtXbXRb2894peSuJyNm3SIN5n63MmxMYfZKjDwdX7jwY9spOWx/+Qc
         h5W8phwZ2sRnscb6CLZmFl8dFpN4/1jcw5fan9W890QDXVSSc2P+ZdMXe0ZF0Sp+VyzH
         dWXZuLQfx+mK4T2/xlw5Bq0po0zGKkyMfbHYnYcLuMnvrWQrm9zWNxMPvY57WLU9RUlX
         LkUNYT4aJMbsG+ZkwIQyXj5gRAqMgA4/17TVU1U1Lc1OAavD1Scyoy23Q04+CeLmBO2N
         fLuYDtT2zrz6X4xflRSod7jh21027YYXlerCicJ6RVyXFWY/tHResCHzXkYaKE2adiOv
         BvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK0x1/uLUhTKJGHDQIqm8kF2T720RTyD4JFf9h8AiLx/ac30LQ9AOCfB8jPSX/qAsuxBJWFphwf+741H2NkERG@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBdYAteBYxXTbz96L0Q2+n38m8ChmTuaAE0m5p6rXEEi6BhqZ
	wqReC5FkDnYAbvkjdgzHSrmDrUCidzNBYkRgd3icWV55BV+JZPmxfElTzAtqw34fJ166nZ22Iml
	qR/xWqg+8tdkoyq8Gstp44EnkjRzLk5vAQa83V1blFgf5a5+1elDuxmpoC3oczaD5E22/NN+O
X-Gm-Gg: ASbGncvi9QME+Gt9QpfKu/8os3OCG5mev8+HjNQfkOwaxybJUM6Qa1J9HtA3aNHQyZ5
	iYeoyDrjB39v4xgv5phTN+R/hR9UxVF0FF9QYRgPCkcccVoch37FSC7TUB1dUoWxmDct4XgyKUb
	dJBmPbhfN0NLjgqXXLED/JcXpBUzcAL75FbxiXtYCzkiC7AjBOXcIOZOOEbNBCcrCCxxWM/b1pi
	nlplmEc0dFS88J9/LhtA9JsFquVc2+NHtEYw45yRXABz3cjnLKcjvpU6qmxOHXo+1IbNva+P9u/
	d6UydLhXJB2qxKwl2yTIpmcF/G6AWcxEAmTfwtfSFUHnv/KFICzqiPqmnlryiFqEtnIoXKRt2Mf
	aEWmL5Q2LGsbAJZglo7E05h8wm4OPyCIO6hQPSGrheOizKb8151QqDj8=
X-Received: by 2002:a17:903:384c:b0:27d:69cc:990 with SMTP id d9443c01a7336-27ed4ad102cmr8561505ad.49.1758739088481;
        Wed, 24 Sep 2025 11:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwx0Y5BNx/AZf0UKl2QB41ev/gZCluSWgmL2NlPqiBpOXayzifxVIa2OG4y7bWAT1hFew8XQ==
X-Received: by 2002:a17:903:384c:b0:27d:69cc:990 with SMTP id d9443c01a7336-27ed4ad102cmr8561265ad.49.1758739088033;
        Wed, 24 Sep 2025 11:38:08 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:07 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur ADSP
Date: Thu, 25 Sep 2025 00:07:25 +0530
Message-Id: <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d43a91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z4uQfrFFlNbWx1whHNsA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 25K7bykqEczU7NT1G7PlmsRE4vMtW9p0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX8GUM5/FKRQ9j
 BIRH23PrpZeaKUV60xCWOASp880hBP6uggtYwJ9Uv7u/hrIuyoumddIHhty/IXfoSpXIgY2Vs6a
 G9T8LoCMa9MExKzPb2LHXVLCyrHIAJBxU+B1u6MSo83yV5PXttv7aihsFNFmePLh4fzmo2d+0bk
 Q8y2CM5W06rLAlsINQ1twJ1abPzT0Eg1ROFvuJwbf2mnqzHqtnoGg4NA1VLA864xNOqla8AWmjG
 /lYnEvPzT6Fv5KSxq3mkWHrZJC2BuU5Mz2MvBf5ZPtd8uQdJl3ytz+DIsmt8mBenBtk8bH3wMPJ
 Dv+0Uth1a47rThmKVlAQiSsGNyxISoxAtOisTVEXLGQMUUUOIo8fy45gho5eqeMm22d3yVw1xV7
 19AZuKr3
X-Proofpoint-ORIG-GUID: 25K7bykqEczU7NT1G7PlmsRE4vMtW9p0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
need to be hypervisor independent, the iommu property is mandatory to
ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Dependencies:
Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
This patch has a dependency on the iommu binding added in ^^ series.

 .../bindings/remoteproc/qcom,sm8550-pas.yaml     | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..cba45ce2865e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,glymur-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -185,6 +188,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas
@@ -238,6 +242,16 @@ allOf:
             - const: cx
             - const: mxc
             - const: nsp
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 1
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.34.1

