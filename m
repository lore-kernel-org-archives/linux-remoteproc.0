Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D423B961B
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113807; cv=none; b=F2WVYxCWt4FgczKDu2/jjALQDgbFEuGbLWeEuVvL/alZZ17hKKmT5nBUDB0/m8/MldlGHDVKg4XLd88nyXDsc5M0TgA3JIHFBGXHEI6Zt8AORM2zhqrFnzgs6hxgaXudCtvkVIWejn7rVqfE/LONaX5NCBZUSwDfYWNmMhrKbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113807; c=relaxed/simple;
	bh=McOFs17KMBE80Kx1yQ7dtWDsgmcWE2xvIe4QDqWpGkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKQbnQRmApgpKNsSUpIAN6M/wR+qqc0rqIUp91wieD4YacvCAPck0wpXr30sEh/7LbyqGH3CDZtPLwpnCqdbcQRJk6n5L+yqlarffPZtz+pltr9VjgMgNpfSoV6v0vmMEND19G9EkllnRLcWn8ZwuX59phs1clofV6dzlhGQ8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qzl6hekO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAwLZwIU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzl6hekO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAwLZwIU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQ3D2460666
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bjsGqclSC5A
	+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=; b=Qzl6hekObTVFaa3UXQUNoGPG7ZP
	/70nrB5uKeuszfajsc5RCxOjC3aNV2zPoYUkFzEbdOirelOfptjT5tHbKmtegA3V
	oD+JT95OKS54ukZMyH9/72U4WTmt0QAz6nFcTsFgOUZ8HUmvQmDbrBrlbmXZuOrw
	ZiRYHvpMZDLlqE95W+OhASdul+KQLzpcrbKmWo5wo1bW8QBX2UL8k+SS2YoeDNa7
	C+WiJWD/f+tK8NuOLyyINpHtt1PD8CCL2Kt7Zwitnx+Ub37MSB3nJMtZqIfDtttt
	oUV3146V/SGy1/gFN/GYEVHc1I7CI7tGmKQd5bynU7Dtqjd7++OtefpdYMQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1admr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738563e61eso3583964a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113805; x=1773718605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=SAwLZwIUR9fNq8aUfksyOOreKYSnA8bt0HZTZagA/tiTv2woJ4pVTH0VQwcHD3NS+H
         yw5uJUo+x/zZshYhmYQFIfFR2KfvqoEvEcVPQ3XobPGOYRcjlWCcATYMoDhVVAOqi7em
         kdP+2DNrHbKw8zNBTkJ/LzBz5stag0+SZO33KhP5lS9XpCvVp9E9inkrwcoZHBLGXS0J
         4bvgASh2nqjyizPj260V4x/o/NLTNwNPBnW2/5RuS9NkYCLhZmZkklqVNJ7uESmTqCqI
         0O366SPJnSuAV8S6v0D7tILjAU6O1IZ2N+6uxMNtlveiRfNaumLMi7jNthRcxTq9RAoc
         L2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113805; x=1773718605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjsGqclSC5A+jOI39DgtAXUsVsWpwMND9DHnXWAUT54=;
        b=OW0KmeiRp97Y6Yj7nRGm6fhnl/2j8hayAQOgCn3bOHq0xyhUQKcf0vmnyD6HWse8Lk
         sex7Vfc24rLjwCE3+0z7T/Wv2PipzRX7Htwwg9ggZq5CRLH8fVuNMtGlk6Fs7e8tP+/r
         DRWFrOr/2Fl1a7PrFHkrTxljaZog81G0oiv28IFUaIpek7H9K2vrqS3wR5hXH5RDdSfX
         Kni9ZLpk9sVztfbRN3UY/mPYOcHZWBAny8Ipmelhrolt0ymjAyBtp5TSmtJ5+yZgt398
         FmRo+Dx5NX2F3ker+VsFrYSXenhaPhy154XbbL+ulvGjNjAyYbt/86LW2l5MAlCw0QSN
         0M2w==
X-Forwarded-Encrypted: i=1; AJvYcCV3lMFVNY0+ArHn+xbHfkHdRYSk5nt+CdpDvNQkub3KC9tsvPYacUPlL/wER+kziCM/PbqHzbVcHFm2Tl8dMthX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwl6uJ9M+UhTW20T3dwzxOHSoZKXemZvcFS7bwP4CYagwO1yn+
	exr/0vOJ906QgcTRQOEa1W7D/U2Nk2CZ8+8uQ8hs0BSPPJ2jUwjB6+e+hVBDW5cRV9Ttf9eBY5p
	olFz8syhCpbR6Tnj/xql3K0d5cAq3U769fllm0NZzz1nmAzaVgi/ZEbA9gtclHsBQUfsWpWoT
X-Gm-Gg: ATEYQzyadu3CAqwbA5d9YqN4E/JOrmE5+fwpRC17r/xYx/Sq6lXqOmejbvRbKM9nQRT
	/GHtSb1HK2nSbtrIF/AlH9jOj4krjcCQPlJQSKAx9zKRnQCfHQMMSQpIBPKOYrr/0klWKxh71A4
	80bRlNXI7FSx3/H3JmHvL3NB/NDGYFWMc5Ne3RImb4yl/JXhNuZblo4LwMXhvU29CojEb/XGS/D
	YJyTFndeaSkGMocjfLcJrTBMNzBDrE12ASIeJ1zjB1waLh0bbywS5llSH9/BvQEL1EjnH6ZFiM/
	T/IEfd/3jNwiViXQnLw8ttMOnXjskTqRkzs44vTKf1+MEdocj+o8FKrYF4S1YY/ebH3SuTFjUdT
	J1PbjLbBodQmIS5O49apSGORfBGoPqfpvi/gtpx5VOpjeoGm5ioi8bP6pQ+a4DYmNO+y0Fxzx3V
	0dScrZ9EbnvzjHD/duVEVbY7Xk9krpm2PH8Ww0
X-Received: by 2002:a05:6a21:112:b0:398:a6ae:9882 with SMTP id adf61e73a8af0-398a6aea519mr2681091637.50.1773113805290;
        Mon, 09 Mar 2026 20:36:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:112:b0:398:a6ae:9882 with SMTP id adf61e73a8af0-398a6aea519mr2681064637.50.1773113804848;
        Mon, 09 Mar 2026 20:36:44 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:44 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Tue, 10 Mar 2026 09:06:15 +0530
Message-Id: <20260310033617.3108675-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uipNCbthpqikbZtr-9D7wImffB_Ci7fL
X-Proofpoint-ORIG-GUID: uipNCbthpqikbZtr-9D7wImffB_Ci7fL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX91mG1dMCAdQi
 utJsw/kcP7ctgGLNRi8ir3U2DQno4o2EAwLT4e0wcrKPu/uaiXqf6UhAx3DncxtpNMFoM37ipPK
 kPTFwCWdOWjZzzCmkdn3QQEm0+actSGlHbWa2h2hVfEC4aCjd37Vu5Uk3MeDSib11SpozSSzbW9
 gwcocFIdXnYFyLahZTI/lOilfFAqrXwOgmC0TklIA4lIOfHQbQA4XOzJXoqP0CEb95r4h+56iMT
 SbGQWzhKDIIL5L4pTZHnXq7nwC/u4CE3ZOgqCLN1+qmqI8a9BLxeLIDzkJofHyOGicM7Omow3th
 lL3lQpSO1VXe4rzBNjFunSO2X7zfTKZ5syo/ERr6xowX8ux3Mtu7RZ45KidYmIKh4OJ5dRIVxXj
 jBNDvf1vD4gcUN/rIA6fbDUeumahfjLhp7uey2dRA9VIZdKKCVLc3ecJ4fpTKAwImjy5bW+Op27
 fsLk3OK+/szWCxeRkOQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af91cd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Eu9c2-cO-uz-pbzhnSkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1

