Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88145471D04
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936113; cv=none; b=RUbpfh5WVTFdWMR1NmOO0aYwEfPd7/ECKO9Kb7oUd+QfJkxwNmS4oYDt2GM6DJDhCb6pNIs2mTmF0NvbchCysJU4EuypU4mt9r3UIR41oDCBSXqtQqMsR1FdG2R6ubTEVg0Lkis0nesBRlEVwFFWdKjgvZezQ2wzLXBk9QlmSYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936113; c=relaxed/simple;
	bh=FbsBLlen6niGwkN0P7vOOCPPXECUkbTI0ANLabW9UGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCqeXRi1OgpYI+DZ/IMCSjThZfNZv9TEBJHglD5+MIO62Bne1aO9behR5VKXZpMkRrrxhM3vp/fqtcTLi9rboB8XtJgjppIv0EgwTPLSiSJJtYO5Fv8/WAbXrRI9e2ZRU2IgnlSONAHBk+bsU/qLeQTBu5vfSrWrqoxlomXeOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUVz5Z4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoiyvAav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUVz5Z4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoiyvAav"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvBQZ2164912
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 13:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h86X0nKkh6F
	i7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=; b=WUVz5Z4H5Ne7TL77gMNAeX05wmN
	AYlr8iQRPWZjEV0eO6WX68m3JC7agJb+9Tl9b7Y5aRZX1R/hwa2XTYqIhunTLM7Q
	oBtk0ikjBhv5nweHxXrCmvDozCC2l3ItJoOivf7G2ieI2e9jnvZqcimO7o3GJmCf
	hsmcdasI1zoRpz4U2Viz/opb1I+e3JMVB4D762OcJ6yIWKbNcElk5USs4MNBbR6z
	/kPJuydy6YmrWZofIq7aG8hnpKJdKkIyQIzoTlYqdIXwOWG9mCFs31mRdCew3NVw
	bzvCg2FqmMf6HOkly0WxmtGK6U6xRE0kfFLxTjyORhPp4Zjx2OZ7jwXWGtg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqt9yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 13:21:50 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9f565a6e7so1290243a34.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936110; x=1786540910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h86X0nKkh6Fi7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=;
        b=QoiyvAavSj1WsyeQZK0nWUtxPjEMiOwhX/x3B5xqDpl6PXcCpQ3x/PSJ2GYm9d5K35
         TQ4GgE7p0K40YQmDVmfPubAE/IlHLXVXxH7GXXGQxAhONO9oFQJbek2gGC5db0Dj7Qna
         cuUzdVj2cNlL3MyC1glriTcWugclN20Ee+LyVClBMcb0y0kjnLSECUrA+xdCRvMJdK0i
         l3Mdk4cghonvFHv6w/zeijsoRFv2igucfknsoxlr71j7dUIIQbIjvgZCi8diE/9g6xHF
         JOeCBc66dDGW/Pr6sKXyeMixPssB3SRN+G0fDNHQkDpSnGrHTcpgwvd5AF8Edq9zcC9/
         KzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936110; x=1786540910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h86X0nKkh6Fi7cT0Y8QoasfgfRdFXrWOvF3NrEXY3D8=;
        b=UgfUeMCLEva/Lle7a1TaHRgjGJDzjbSfDLYvI51TAd8jckvFnAvxIUgUbeJrZwE77n
         dPC6Ugu+vOUmhFZz8KQmhZRoYGTcUD6dDal3aSofZ+4shBq1sNcUx+cM121KGuwOZo+4
         EhVk2vcbaxSAs7fzJWbW4QRBApMBTw87Qe7My1Mv3+SmkkJydkjwhAtZW+XtrTY4yGyG
         4rRTTxG4km+UjLWCINti8xWdgZtwizLGS6x4ed1z0LxThE806p3gP2GuCKc7EhooAnd0
         PsYr04MQJVJS5q4mkgJWQhIJSq6oHc4gY6uCHRwOGBb3eknihiC+T9tqJjtKPVEpL/7h
         nwWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXEb3Pmu9WS3s+nAeVgo+Yx9mtW5QRpvULrg8uptDmsUvNw/6ohISEDwSkU1zF/7r/w7rcXImwxAQiHCabNJBv@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHEC5NEd1kJdsLOeTOV++u06PEhDRjj4W3dpB4UWiTN8r9NDr
	fg7Gn0HCnRne8ubr4tLfe7ztBCV/h1JzzV2ztLdYni0slHa8FK1jwRzfPqgGcdfd6PkJOAa6ucu
	z2D7YlbtwZVa00pUp4W7S6cOuRuqtqa6GrD2GrhxCR/KTb+zPDtRqeazJ34huAPK5fHPdPXL1
X-Gm-Gg: AR+sD13hcVsbXsoR4Xlnm49yDQnAGL+ixPWtkE774Vr9CBP8KY0P+eXLe6PQj/82jJW
	n9VUpqav9jBCVJ/n9iROHxw2I1S9nt1MdDX8bEECU/lUmvJYqNPVubyex+tg622SQNOgd1TSoHs
	1aYyekPhvRmEQBR1Fi1fXMzXpvsbJ664kONfTh43X7GxmsdH/MO0t42NJfA61fNy2lo34U+IUWD
	TGIqVVsdE14ArQ02MHZESrcNSypFXUqVpCJQdY/PAo6WYVakeeO2ub/k0Kmpa4qgIqvH/GmNLL4
	QTI60gR+/xvCACdWYG6nd2vx1Y9PSl7mwE4Ug5sQqNwO+RX3+VISOcmjb8vMlmf8cphUYplSOol
	MN9fkdQ8imrPOvwYdtLDfs3vJBtg=
X-Received: by 2002:a05:6820:f00c:b0:6a3:f41c:de81 with SMTP id 006d021491bc7-6ae970b93ebmr3166654eaf.35.1785936109810;
        Wed, 05 Aug 2026 06:21:49 -0700 (PDT)
X-Received: by 2002:a05:6820:f00c:b0:6a3:f41c:de81 with SMTP id 006d021491bc7-6ae970b93ebmr3166615eaf.35.1785936109240;
        Wed, 05 Aug 2026 06:21:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to SM8650
Date: Wed,  5 Aug 2026 18:51:28 +0530
Message-ID: <20260805132129.2713174-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qMNGAJPlQ99U-zw8k_tV0DyKyVx1zIqd
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a7338ee cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0fILAVUH9iuzxxz9WZwA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: qMNGAJPlQ99U-zw8k_tV0DyKyVx1zIqd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX5r5YTTIDXQZn
 4gqtHa6tcMkBrUVEcSdKYIKxod8s2b9a4o/EGdaSmtyNe2MWMi5vEuDO+IBIxOsNbQE8x26tV/w
 7Q39rnvjIAqdIkIVVE1Oj+CXoDBfeM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX5ekrpgaDVo0P
 lAPPuf+12dSt+OTVrMaAQvjFHdBC1CsorZyGE5aEF81IRpJStthdyQxaxsZvOZnCruuz24D7dOL
 t1hv8C7SYKsbeg7Z3PvRjzTBxhoxJ7P9llgRPFnok5KWQ5IWwW38gzPVAKNLkEp2g/a7YHKFJi4
 fCyixYDGTDAMDawOXkwIJqueiVwvPNkd5NYWAqD9KbxrVR0cS9b40LecKeXaBatkBml68PIWArc
 asdzlTp+HqHr2a9xc/JMudVt8YjQVIPOQFBTRJxH1Wml1mDnLDMr/uWZa4aTkRlq9KlfYcpSleo
 CGcVzzGHVmBC2j+KdUR8q4nyaW6AqiHv97N3TLFPDJM5HssP4KJh/S9VJFQ/Pv6m1cJ6q/YDra1
 w4iMm1IB1FwHJkRyh0tOCKm/+ykGQTAmF7/Uw9dqrnIcLBpTrfHq34JBiwdsq2BZOQ9Nwt0MNID
 Mje8vZX1OVIiIfcowfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The SDX75 MPSS is an instance of the SM8650 MPSS: same interrupts,
memory regions and power domain topology. It is currently modelled as
a standalone compatible and lives alongside sm8650 in every mpss
allOf conditional, which duplicates the constraint and hides the
hardware relationship.

Move qcom,sdx75-mpss-pas out of the standalone enum into the fallback
items block alongside Hawi and Maili, and drop it from the mpss
memory-region and power-domain conditional lists. contains: on the
fallback compatible qcom,sm8650-mpss-pas keeps the constraints firing
for the array form.

Two consequences of the tightening are worth calling out:

- qcom,sdx75-mpss-pas as a single-string compatible is no longer
  valid per the binding, so the in-tree sdx75.dtsi form fails
  dt_binding_check. That is fixed by the follow-up DTS patch which
  switches sdx75.dtsi to the fallback array form.

- The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry
  so already-deployed DTBs continue to probe. The binding is
  intentionally stricter than the driver here; pruning the driver
  match is left as a separate cleanup once the DTB rollout is
  complete.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index ae74aa4bb6cd..f722c55aadf4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,7 +18,6 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
-          - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -51,6 +50,7 @@ properties:
           - enum:
               - qcom,hawi-mpss-pas
               - qcom,maili-mpss-pas
+              - qcom,sdx75-mpss-pas
           - const: qcom,sm8650-mpss-pas
 
   reg:
@@ -210,7 +210,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdx75-mpss-pas
               - qcom,sm8650-mpss-pas
     then:
       properties:
@@ -261,7 +260,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sdx75-mpss-pas
               - qcom,sm8550-mpss-pas
               - qcom,sm8650-mpss-pas
               - qcom,sm8750-mpss-pas
-- 
2.53.0

