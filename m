Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E932A3F9
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022038; cv=none; b=Oz4IQqAMfbMPXXe2z0/vcXsAz/ootwUTiiIPRC8zvdLgZiM+knX17xojvlD3ZlmmfvdOF5rvca4nnPkzaYj/6CHI7CygNReGjLBjLOwIOWPJv+KcH1biaBoIEwQfsoBxc0Ulxcvo9tl9q1t990i6yCJEcvRk/drsKv+r0sOjPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022038; c=relaxed/simple;
	bh=QTSU4D7Q6Q/KGHuyrbxANzoBMKGbdJe5znkf+y3Q1uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DC0bx0Sop/g9pC6feFEu6erjW6yLUpe8TYSLjiCqAA0athh/qdpjqprpUQPDcG+4ZwWKvqgjr/HMgBP3vcIB4F2sjadVDkWxv2Dr7YiiL6dxPOLk54qWJMKisRf0Y3MRolkF4/El3njYJrCwx41ypdtdLP3lx+NnZlhOxHNtWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MG7Mw1tb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUxaQDZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MG7Mw1tb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUxaQDZf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAHDcL4078714
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rzt1b3UDxgy3zzWVA45ah3Na6FFxSJp1Lkj
	vfWI4OLU=; b=MG7Mw1tbaGRGTgdpFGXIW1oMG7LunyTzevzcZ2QVsBIx8S7F2GA
	SNdldukznC9OUJJfk+UHOf9Pfsjv2vpRskFEvwMW3lL+PwDCPvO4AfvwPaSv/lX4
	3ZaxpSyn9nUwjmnQe+4YEiLViNCQ7SUVulK8R4ON90tS+fgoQ4focnvXw9cH6uUI
	iNtBVamkXuQekKmdY7Ug81mdYFJticGgn7HlmoOdu/cCCspyS+w0jG+eT15gRWkv
	LWFx9zrI1J2Q098osLRYDkk+/cA22dtFgbQ5qxIwNfGBvK/cpDnrJy3TP5MXyG6T
	XLDVQ2GUuoDiUbAFKxDbpcnR9XUkUxYXKJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bvqqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 15:27:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so322385481cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 07:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767022034; x=1767626834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzt1b3UDxgy3zzWVA45ah3Na6FFxSJp1LkjvfWI4OLU=;
        b=XUxaQDZfkwZQ8PzTrmtRfW9arnOYQphCkJZ9NyTqdGkzw5OerGq2eGMrsl33TmrQYm
         941V/ZqyF871ytNabLcP1EFmtHP580H9TxgwZMre+XCfGjmlw4o8BoO96Qs1KJfNFtUs
         QJYx8s2EaK5+FUBU64muEfBK/ugDjeCXhjAEJWtTs0v1avIjTp8Ro5jOP2WDpzcWquvP
         JAvV/+whr2JWNHhvXA2+mLHmiWlr4gImq3jLiE1u1G94n5WuRQIgiOGtO0o1nw6BXLq0
         vrxxF83d/loIjXI/hRMS0//ZM66ewUf5RipFyrbUyp0cZIKQoF6ml5rc2rw1jHiiBgwC
         F7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022034; x=1767626834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzt1b3UDxgy3zzWVA45ah3Na6FFxSJp1LkjvfWI4OLU=;
        b=izSfq59/WejkWwCvj+fgNeYdjkBlLon2b59i63o1GFMx0qEVvB2A8WFQD1/bqgdtRD
         Z3FJjlvIoW0OTOnD8TJgetB7A8YZ5tV2aQPcvKsbMtUbgeTjNLoYbba5w2q4sIqdhokY
         EdFBMvZwU7m1Z+VtOyIj1ddEMA2x8v/DlVklWLXuE8WGQ5wNcbGOOLBJnI/mBMfD3Zep
         ZcDVuNid1U/w9l+fS0kyLdS0pJrS7qIjRS+t8S7lTTnT5zJLu1B2EX+XXxIYiDLxXTb7
         u1wDM2ECUydYI++7wBDhjL2oqIrRIQkVWrFmv+bJcZJpDQmB4tdm89c4P3+plk0nRKZv
         W77A==
X-Forwarded-Encrypted: i=1; AJvYcCX2yDTsCOqkKA5Lo34DPvlQg76hrg/4ij0zzPBF0ZRy/7DBtQ5BcA7YLA3BobeCV3+2hzYMJ7eq2VBPJaF36HCr@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEvJ2hPhdeHwhXk2dvHlFmRSJy8ZPWezMOmgHFRhSXZl5MVAG
	MKxT4nGXSZ+QgjtQ1JCgKXKpV5WiQH33YJCvfmNpRohF42862mNBRazVmcoRu8RUZ0H8+52A3Qr
	N63QhpdJp0ZsOPejHLUTXVwwOILRcft0iZnTDtfia/NaRtO17MVWCF8uqTgu8e+U41PrCcksoaD
	BVY9aj
X-Gm-Gg: AY/fxX4lWa854XuACF2XggbRMFfBSc0SnMX04qmd+89r3p9N+QKxq8bkJTrTQAfLw0Y
	24wjvzKbDyq1Qok+oB6MnQsq28rHvuVCKnl18L1F/fBmNXs1Aq6cI9IUmqoWJCBrfvXcL7Gw3OE
	q93R9KHCczJ8C8ziaiPadTFO/q/yd6p9jXALSOno61uZzZ/UyNfbhYOpk/XHPRE6nWzSdRXiWAD
	scXCajlyPdZvYXShCs1Gk7ssZa4L5DTDeYjFy7jKHRDp10m/iQVER6gQ8s9GdiNUxCXmy29DZSz
	5Ncs1rCsmOrK+DOQJFX/ScCH9VXkm5YIoULUmEMZ+I+4iu4E+BwZTuqCvi7+aYwftXTO2sZ5vx/
	ey3buWt0V//hNsoeMig84eD/mwg==
X-Received: by 2002:a05:622a:4a89:b0:4ee:296c:c7cf with SMTP id d75a77b69052e-4f4abdb9101mr395229531cf.71.1767022034007;
        Mon, 29 Dec 2025 07:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk6/5RbLrPpDQds4GXGEH62LTY6bcrVbSSrtmPlaUrpphLqyFUGsjXOHEtarZ/gc/beziybg==
X-Received: by 2002:a05:622a:4a89:b0:4ee:296c:c7cf with SMTP id d75a77b69052e-4f4abdb9101mr395229221cf.71.1767022033447;
        Mon, 29 Dec 2025 07:27:13 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a0fb9asm246414005e9.2.2025.12.29.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:27:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on qcom,sdm845-slpi-pas
Date: Mon, 29 Dec 2025 16:26:59 +0100
Message-ID: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QTSU4D7Q6Q/KGHuyrbxANzoBMKGbdJe5znkf+y3Q1uc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpUp3CUH+OgTKAWU74ZO6JpEED8vL4OU/DpRUSx
 MmhvTaVHvaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVKdwgAKCRDBN2bmhouD
 1xP2D/9Nd7ad014TniDL+CpIgrjI7OlkHJs1Wj9BiNsErX3xmb8wnZQfFpzeGIn0QxQKhUipbBx
 SxLjaAOiX0GbRuXaVUUJuB1jtr3LG3GEQMy7X2xFQ22PGoPdxtpAW9W1FO+xhOgjOwuBOvEb50j
 nZj7DrEnR0ZuwT+HLS9REwShURngdKw/i+l3YB6TtoYpkhfamuU0ezyzRsYnOWiY3Z/VxyUGcwq
 UzrDXxRooFYFs7JvzDUlSPvL1W8qrWcyNaR3JF7sDSj8yb+DCuhSKfnCFE7ITmr401+g2GZT2aq
 TWgQrYIkqYRqHT09J+L9lXur9HR2av5yWCXnw5W38HPjHRnGTkwkQM8V9V1kEdURHwUKUCAB1oe
 JYzV8g2Gb9hrqhKd3TGHxGKS2WXhZzNdRELbp89k0SSlZWH+ID2jHSJ3L47fQCDn1CQvOpn6mVn
 mmUBXrPSB9C8r/ji4Ood6rWmCTymQbGqa+i1ayrfig29v/YsGjU34291dnCiWlpHXoLI25sY0JK
 uSQ3ato/QfnPysicek9Oq40EZ3moQ8I8i1bE5BBP5lEqL4jbry8R7FwktZHDRSfl5PTwE9Z5u73
 W2f/XJr/ARHjhCWbzJZG5gW0KFErZrH3VG+NsIOapSIyooiP6jyAqqb43D1ecGun4qb3tTIL5VW jTpIwn7JdiD54Ng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -wemGKwqjN2ZF0vGMzTCQHdLtCkz_eBJ
X-Proofpoint-GUID: -wemGKwqjN2ZF0vGMzTCQHdLtCkz_eBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE0MSBTYWx0ZWRfXx2ImvbAQMuuR
 ZqxX5HAoo/AJx6gKKdteFXAvJngfVS6InCVBYyDp5Mw/jpxxw9rr7w0AMeIy9bq6HkIsePXRMhL
 ioorYCb0VnXiBI65T/comEon06y/27qMzq5cN448DDG21qOAGUJ2P/qzxwxurprmr5niZUA3NQt
 VsqwfOVRVp/X3dgtKthxFNHw6Gaf85iwpp2dw/9Q33vPoAPJ7sXAd5YBNSoLbAd/fCmz5xNaSab
 Fbd1UgvWp9LVjD6YqaVUvGtQk0VLpnf2Nf9vvLyEQrXfV+cODCdcIUIRrrDUVHuFClK4+A5DbB6
 XnOT9QrO5qEwxcB23FU8sWhqMQh/B0gKgMVTeLytWUKo9OO/1NHBsRc7Nh6c9lchuxe0Su6u2dp
 TmcTWyeac0RDJ1ad2yeXasdTN1Ft6WDhCtrRLvQb9fqL0DVxRVIVJoS4hokfvpAE5RKqw//QNI0
 uDDYq3NZO9TY/evDdBA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69529dd3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D2fDyMcx4HOThAO1zLIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_05,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290141

One SDM845 board uses cx-supply, which is not allowed by the bindings,
as reported by dtbs_check:

  sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)

The SDM845 SLPI binding already allows lcx and lmx domains, thus the
cx-supply seems like a fake name for something else, e.g. some
enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
established ABI, therefore document it for this device only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 137f95028313..16a245fe2738 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,8 @@ properties:
   reg:
     maxItems: 1
 
+  cx-supply: true
+
   px-supply:
     description: Phandle to the PX regulator
 
@@ -159,6 +161,9 @@ allOf:
           items:
             - const: lcx
             - const: lmx
+    else:
+      properties:
+        cx-supply: false
 
   - if:
       properties:
-- 
2.51.0

