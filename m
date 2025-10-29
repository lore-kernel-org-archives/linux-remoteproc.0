Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE88315D2A
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725157; cv=none; b=Ax/1ai4Fl7HaWUCzhBxQPdjSqBGclJWO/awXyv2Sb8qaqy8kSlIbh6UTPLD1xyrij38fjAZYkibCTIgeLiyjOAhg9BCxgftj7O4iYa2NT4fAtRZmQ2yniL8Nd+23gYa/6MX9E3Cg0mQcVMnN7lkvPgDxC1M5+npmhTgDXOQLpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725157; c=relaxed/simple;
	bh=wSsC/m90UcMlRas3mHaUoFTcsLJkym6KsxiJChRWUvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rd3xLVGSaNFJ33OMKeONvCeqQM1CdxtG3UB7h6OcmWjmJq0kS887EKRDTy3u2wGHnikaYldhJHQ7VaIfx2zzrM+f1+QDoYXEzWph9pdAoOnksF1mxrK1S/PiNN0WjLXbFKsNnNf1YtawfeOmmZqM9hZhoelhM3p9171t5haqeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGJDmc9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBMXCBlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGJDmc9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBMXCBlY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vNTs3643575
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=; b=AGJDmc9DJHmTpVc2
	WvYAMcxQwEbia0qNhbRMuVUsQVult2FUHNENsrpIrTErBHOfZI5fyixNsFn7ZpnX
	FF2Ek6JAgi1uIxM61r8lXJnzAPRbOJMeOCBVoxEllO8WoYevoiz7dW4VxGjMKFov
	PtZfXyX1y0qAuvJvOe0XuqCDNjcfrUUBgbZFyMq/pGCmR6FHm8wWnuTnARhUGdpA
	sdyeCC7Cf9qBlHVZcoIHk/9Ig9ANwuCBrQmwCPtwgcPpYqHl5f8QZeVhPsVnwxH+
	SWNkJZtJ5dQIYRsslnVhyzw/TSGUufS8L3/YSe0AvxlaYSTNIgbML937acmmelKH
	a5nlLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hqej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697410e7f9so181944795ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725153; x=1762329953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=;
        b=bBMXCBlYvzIhmNJ6ZXmQ12u6vTC7WCsXbFswnmX8CQR+5EQVGCPO6N2SlN/4yPiVwk
         8BQm1FWyWvN97sHuir2TCIQDzLX071xfNkQUwMwovLcqzymkTZkrX1AAphTBm0hGzzV7
         Y5X5Z0LK0cTDQbJzG2dg21Zc3SNRYj+ye1tJKPzHo3bAVCT7hihhJE3k1cXPQDpJY1Zf
         wJIXMKxyh5j317QwQFJ9IQGZMs8JgFUP0KXxCBWAIqpMTnyVfCIUM65dZM0PVjMRv/OI
         xuUpa7PSv+PQNmFzrOblpuA4U3srxSWkmqDLx1Jw/GhntRjwyxzEZbEiR1UyaGt64Qku
         +T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725153; x=1762329953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyCMuRsQwYryKroqDg3C2kFC0X1+TeXJPv9gZBeQfSs=;
        b=ECzVBV1ra8VB3YrToVac3MDwX51jU1z3ba/MqhsC4IgBqwhOwKz9KLB83saUAXXgPG
         tYYK8EICmNyUzieUiyDj2YAShm2wiNxuXT+qUYeFP+mrjHtSjRv1oc2OeKdKdHKfk5hc
         bZVQrZPcmClU7Zp3/CqmLt2JplI2Shl93iK8w9wfh6039FjP0/N6zlsTAGH0loVIKOBT
         PcIqiPE12U5L+YHoj6m54ODM05TUYRYlZvTaT3Si2SvJjkPbfSx4hYhjXL4BpgARYuXv
         0ur/PaIYVtDo41XwxugUZ6a/qO9BkaxExmG0EFtWNymkRqs9TyrWBLILlQQUZnqVpKpq
         iaTg==
X-Forwarded-Encrypted: i=1; AJvYcCWiBKTPAQwRTJJEs3TU06QDfRa2JdbYIVjriizAWRBkjt2DFLKaPcyJUvkpr/+S8vnE0IOwnwJQMVDQLtwCjPVT@vger.kernel.org
X-Gm-Message-State: AOJu0YxqeNzT/ZHjhsDDdNrQ5hZeqxkD3t+YyXianvE3evWgJV+9ABfF
	2kYQfH7yGThE7QVWIU8spJ3SHaOyS2G9pLdqA1mnK6Aeccjo10aL9103zwNUcynjNFbNW07/FuK
	FaauWYiZHAWOzNDuIZ20hRhydQRCcX5F1s96hJfwYzFsr4YNI/nFOFyEWreHTkcVrSORlkjhG
X-Gm-Gg: ASbGncsc/XYWCeVpCZf4dxsqljcfuqjCgO64p/INTipqh7FgKY0Rf6R/6aYU2ag641r
	FAkuqBS7xlOELqLD7CUHL+L6xFxDvCZEss/1Nh54vyOCKeO5Zs4zX8ypnfA4yn64md92cbM/ekN
	wlDyk4I4DuarcbB8BHlvv/fgXGtvbDBgqXlRHfpeW3rT+unkhaBIdcNqqjb6Z0NyBC524Q4cOuL
	caCrmhEhR9D4GJvafImh2LfdaUXskLSZ/IlC6o72u3Yy2lGgLXbg+RSx5/D4EaDuxYWfesaSwdo
	c8p+r0epMI0aWrWP46bnA2HzbPrcajk/HiB5ogP15OKHRHl/By4gNcYCemsMjmoHk8WtcJVEhCY
	s7yVpK7fCZTfvaGHEiuGTgI8ANwkRTRMfDOTcdq/bYdleqLGVlQ==
X-Received: by 2002:a17:902:d4c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-294dedfa77emr25415045ad.7.1761725153397;
        Wed, 29 Oct 2025 01:05:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAY5y1XPZmwwX/bye2S8cDKGJs6HaLWTblBH69Q2eN1bFSJbsrs9FLTLCUpKeXfl4vf2jwhQ==
X-Received: by 2002:a17:902:d4c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-294dedfa77emr25414645ad.7.1761725152784;
        Wed, 29 Oct 2025 01:05:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:44 -0700
Subject: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1709;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MbjJGjYI2p6gxBQQC0Iy4v/3D5XLYqqgbONuf+0Bivc=;
 b=mIqI2Fn3tZsYy5tef004AeqHk+HfppmB5mX2ylArmDyyZkhg29XijEm/2juY+QDwt2wdGs4tk
 6kjJUm5xiNgB+q8TfsGi8xaA3kcUnMlJvRX4wMNtB+uKlAhvCf6/d/t
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901cae2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JsIBf0UYXXKOit1WgS4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: sBsMv4ReHZCaQgclSZnNIj8gsDZXDBUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX3lReLbc9pbf4
 BMrOWor+0p9FsJRri/Hs40OR/Jv2WTeQ1H3McgxALP5je8+EaWAjpYVlqK75Sl6YwZ6uDtIhl9F
 yIR2GNKpm2L5D5o+f5HzEKZ18RTWAAoUoFGEIsu7LzAuGEP++U4p2uVDbdlN3lsDMKoYSNHLK3r
 4Ma17KL2239eVgdwcJWRBCPwN5GUNvOGovku78FM98LMGHs8ndFS3A+42L2+3ev7OQiA3cBBctp
 ykXvbf2GzT1JjVQDhuE6DvgATdWHpiSW/AYdyMabDwIF0iIwbVXH8wecmzNYhD6vxFJ+wPtT4pr
 kk2WgCUxog8cXTRZDTCjDAgEae7vXho7rAqiR4ZwTeyNJGV8coWAFgmdxbTARrLbKk57b8vwK5C
 yjbcriILq6njEdDIHGD34rbtJk4ymQ==
X-Proofpoint-GUID: sBsMv4ReHZCaQgclSZnNIj8gsDZXDBUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
need to be hypervisor independent, the iommu property is mandatory to
ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 3b66bd106737..8cb839ba1058 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
@@ -247,6 +249,17 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-adsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.25.1

