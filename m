Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088653;
	b=gw4A6Wgzxm7ZLZy5/oOZMV5mjA3P20vWOW7Qzd9gT+lo+b+OudW+okhBPfZrk7RoqkWw
	 kUboODKtrfKhdnzlYiLPuOWhQv90Y72xdmY6Rt8gsyOBkFQeYiXEIxhTGEzW8MUyrPIqf
	 J3a469ikUzHn47JEmNkfNn5sBhOkLQLH1R6ZL2uPR0LSOlJTKXFFn/DrBy8ggzO5vIFYr
	 8rketXzRkUlFNhVz0cqYdfxO5SLJuDokwm2zW6zwtFPwuutMEnO4bxvrTessTNmZp1o17
	 huKN0jYZkze4/n0WmVT1K2YNzKfsGZsBXP1CLYZBoe7k6w6G4f6nnGJAhSzBxNM6XZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=MpR2NqoKeQ592qiK+swMgsL1nacTxyQI+VY7iH738lOyC10qskSDImifJ59pAdzvvHT2
	 mpQNr9mSGoHZj8O2zkovYAmjh9Y7u6+kVTtApMt4pmM4750dDQsjVGOF0qniXKAGLghp4
	 gTf8blIvM3EuoecEz4QhnD4okcXYZ+h2ojVAgmTKKuPr6wVkIf10Lr3+bw9A4lJgR22w/
	 cRaayjgVspHL3UagYI2ad+HkWHYyqqqdAcdIV2AxfEbOK7PRNF2Hff2jmpuulMD4VjcFY
	 8TWQWLz8CEp6KEZ0ftCUxiidF0W0xyy1sR7+z34M0dn20mU90rnJDgJ8+tjimJNswJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B5606A324
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30B5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuWht3476580
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=WU26EFkemleH72Pp
	igpyMWtqi57bblLFZ72wUfDa3PdQMba/mixao4J8hdgOBGwZtfzuIYX/hOPkuCsi
	PI96vKLRXdCxoKYuukk2HdfAUdqliV+/JwZF2UJDrbwqkXPXql7FO+mlH+NXfYxW
	e+vvcCCPLIWXA4t3wbdtx/WrGT1acJOSQ1RKzXdgPTdCx6tIyCBSSes9pqVVfMMX
	fVZuuSYJe1dMCr24PDhfv6yuEh9Z8XJoqFDjXoZ09vcuxxGBTEw4A4GBfwtg8aem
	KSExzH+m1dlxk5fT/18smSZZs54rywbsWCzKrHnJRjZvpWgn/oQbMQPPTAmP5unb
	9n03yA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgcfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so619292a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 03:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088651; x=1795693451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=WEP5syGtR5xCz4lSNAJqA9BS8aKZ4oVxRCzcyJVb3CEd4c+dEtw6tCBq8WFadRQFLU
         84ivkdZ3M+rho1EroHb8DyTE2nVfWtHWhVLzoKdbYQPXW5Ag5rIXJvlqx9hQQvx7owtl
         1GTp5SGxcukRVLnYJYjhP+w/GFDZX6tRvKFUCr7n4WkUunxo/NSomUiC9kRTR0O113bW
         rzUcEff4j/b/12ZXD/hFJxIH11DsYqnyoypX/aJD2YJo0KRQbCjRGa3ss4j4juJgVg/C
         /jt4AJa4aE3+NYMcLtPhCzNA8F+e4ZW7fjRxGCkB+1x+y4bbgJyl5nZyIanJKTCzzlPX
         0Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088651; x=1795693451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=OvL1JLEeq9gwi+yMa/6I9L3erzgvqJiII5sbvtYfuDZTxzwEs5XQU6Izcimk1hP5PE
         G74rN9k1fY1djIKWmmokgPul3iWhuhoQlfUvMx3Gkhb7aXhGohKp2D7QCDaQWIzVpMXG
         9AhexTKJDVLS0oyK7Mbrxhjpt/yfryzhrvCNdiQAOGAwofAxr7kk3CjA5KWko2K8h1qL
         84KH0icKLzEDBs04EiqvU87Xnfphd2oiEXNWG4+OxBk9mN1SwzQk8jP9GXRhU44AUoq3
         xj3m53hMMES0FiD8p5JopKd+AR158kX4mgc5LxBrLI85ovmOiCYwccV+WHV4+zI5zUgC
         ETNg==
X-Forwarded-Encrypted: i=1; AL+hErEAi3uq5rKDJbc5Ctj7/5AvNxsU9X+24OB+L+HfSVZ/12KeBh8WKsPeSl8uB53OZkYitE6LuTtlPspprMY9RAKu@vger.kernel.org
X-Gm-Message-State: APuU4Z9SXcTeI1T7w7McAGlD21S+LCQIFpaiXK8o6p7tb6JIH/wWvwOI
	f/5u5VFVSgm7UxONJpHymuaiJN/tOrTxDxk+eJZ7jb8KAwjrcSVRUnwQiftJKC46YFIgACs3q9m
	OFZlpOVEeeJVpbK2P7w6jqwJdAa8rSxNj/S3gLDeW/a68iy0otWwQ50CggOVAp+5RVQ2s2UhF
X-Gm-Gg: AZFdTZewwToMIrBSnPcFKe0BYuL73XxlDWZtygOzUSRuSlzLeHTZ+gZ+OhZdC3bfM5V
	F1qRcm6ZofpbqRwLF3ynZc7zrvxxD5tfLMR8LomERKmtiij9DnHyIll+/BrJi2z9/bAIs/h1f13
	0M8FYaqoIc/xwFL5ZnmNg+9svnETo+jtnDwO+NDDZ/JkzHas5pOxs+xgqQx45FsAdahcot4U/Ds
	1CAQF8SuhQYGEWvaZDZ5yXbUSFS40Tl76IeoQX0dDXkOTOA4KgMdCBB9SSWiarbtJSsC5jk3vhk
	icaWTr6l70w7c07tKIoMHGsiF5zlB79k18RW2D95ZsrSlC4RHw+Ulquwkp0BIf0lnrGXdPb2UXN
	cGooAr9TsG2YsNqFzpro5dQEP/YJ01jxM66OyQTUtZtQJH8wFa04vb//b5Ln2qIU+
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499400a91.1.1795088651336;
        Thu, 19 Nov 2026 03:44:11 -0800 (PST)
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499391a91.1.1795088650893;
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:46 +0530
Subject: [PATCH v6 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-shikra-el2-v6-3-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=pGu0zY1XyLxlrASpCoMqPSG83qmdxILDZDlB0yZoXwChYVIP96LNlsT+alnkitTg9GVioRKyA
 tdrnz9A8gORAgU8RX8G9//H1/y89nL0U2TqzFX/29VAaOjAk34JpA6X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2A6WOCF3b325
 b+x8Ez5hjEDzuPhAYO31qPm2YW/9wgoJ7TvAP/zzBehxn4//r5LTL4/qhgT7EQz2J083EpTLFuR
 KcemRUnyMAvZJuMNEBuIaOxE5RSUjD4=
X-Proofpoint-GUID: VDCBRzWobBmGgvkF3ZV-zAEu0pUG4Ayv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX6TIKicieY5WU
 x6ZjIszn6pxXmM3za87nFxQihFGOieuRKPC0/nIg6aJmwF0GV7MCdFt3SNVLNtiHuBKRlAm//hc
 6in9JU3wUGmNjlUYv10/a5W5kDkmQaBfdxTj/pE/2sYl9zwS1dJA4WOe7CCxurwS9ePCIY8U5lC
 fhBawrQeEHHEwmbSQxQjCeK5/VFuoot2M6sJyGDQD9Extzk2fC+sB26GlDVpmb9rdDgCgPV7kOp
 MTfSZo5SMzTzTHtUwrL++vXR9jFf/rln5VxZxqsJqTPW4HqrvUqgGnbdtEsex04MjZA50RquwgU
 uR63UC3CXTZcKpJ/vDGAgQKYzkpNHWk8nSsRo7DnjgWY/zCiQ3VuRUc4x9MbIL9dwByfOX1gwTJ
 MsU/SWmqlCdwGx4qrW0bAh/byw+r0YIip2d7dO+uaYbhnZDT0vQQFFtu/gcUZJ3gtAYuNnDaGYN
 LhHYBEwtow+lZgg184g==
X-Proofpoint-ORIG-GUID: VDCBRzWobBmGgvkF3ZV-zAEu0pUG4Ayv
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afee10c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

