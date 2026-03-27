Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689BD34B1BE
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628338; cv=none; b=aYpr4wc8vbzIi+U+JqFOpjDGdYMmVuJUtODzwqqgQq2F3sSmYZm9JF3Z7AvRgaoSo4WMR6e5UvHv6dOaiBhKGXwm/c7K4VWy6axuu+ArN3jnVGClcoQlwMabL+oY9DlE1SsSsb+Zr325Rridht9NYUSG0SnA7xWQ6AScLCxOlNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628338; c=relaxed/simple;
	bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZbR2Mpn7sxY04tNHBAYkSc4OJpNq/XdhaPiD+z+klovyZ+JsPGsRm8eWFsBb6AQr5gAdEzQd1GsnbmTOQ16jeT3M2nOUpbBFRISONyxCF/fZm1ddssIQiPZEnAzxYhLnfVLgZSal2KBXtvtCW1r2JSLOv43lULoLgKldSmCA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJoWHilW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNW2rmHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJoWHilW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNW2rmHV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFL58d537091
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=; b=jJoWHilWsVWLf9gP
	NIuWc85VZOtrRRvzQxmZ6STAtYqIkib8JjFlJ8Lo2uVfxOrbxR5RF24QhpdnmtKJ
	BuZAJNgtOd3z34R50rZ2NhLX8Um2lnty9d0+3HWDlh4YrAi7g5NGfYxHkA+nzlUg
	LX13/gPa/HVGh3VBpLaWmp9WMbXQcFB1vqdFrCfNsoMNnhJjoWzYIK49xI4euBdc
	ioOrSB4eAIpisglZ3ITXz/JIGEUY3xuHwyGgOsAbYWgpk6L8PE2Wqd1h35ZrlZMR
	Ke4GjQjyHv3F+lz0tZiytSgKm0A9WGNqskFwEYK7a0CwNbRsvUdrbLgR+vmOMSHJ
	M5dwEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6r65p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so49670091cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628336; x=1775233136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=FNW2rmHVux3UbB5TKIqXLe/FsikIXfHjdmZMbsqs8d9rig0mN/vCgNMtk+NWaHuZV0
         H7P416xeuhUQYIhELZrliqNYqXa4Vm+N88et0e9xdvvaqhG0E7YxHy0mA5W+SkPQ5LZZ
         wYrniX1UX9OjJhcEe7bm3w43rwxjr4FzBmFl9eDkxTrFb4wSNVDxvFLtAi3hjkdGbV5F
         GTKJxC6AwM4yNh5BNQijxSU8R5vBM+i1AsIFuVZMB4GEFPgJwa+KPwEkpM69qyH9UFQE
         Y71zMXjJeZuqj+zbjD4Ji1HtwTU61rnuyiMLScNlIWtLRzkmTxtujAcSI2UWKr/StV4E
         Sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628336; x=1775233136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=fZb3asJuoG/ClxHwKcX0qmBECp22eJZW0TFOSdS+CBBCnd5xHhDLgqFe15KyVpdLAb
         4CcWt2AOhKjHOdyuCPvX7vwrLFAIvThz3EQ2DeleJfXjCXIlAMOY6ElGt0ij6Z8h0yHZ
         uDGQUP4g6CVpxv9KOucVA4zbIa/V/yMagr0o3Ntu+yHbp0CGTOZpcdCjUuFDBAP77PSL
         cK8ADifdoGDuYsoblOF+lAhG56wGpDPdtqTCYv3OLAQ+YWd/tLe2oDD/aj8zHJ73mW9d
         /bG3ySE4zKtPYpd0rqGd9ICGghgSyML9LmFAh1dA3KOAdhJ1Ohx7tOxIBS13DVSQkqlA
         xdEw==
X-Forwarded-Encrypted: i=1; AJvYcCWvv5gN+LnCTzPQaAk2042cavyLEXbwOt1Ma/79zSpYPN7gIHDAd6eMkH1FSvvOZmFpUQiGIlDAN9s0W8oB6Ru2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yaI27Rm070it4W3EwQ5X2DtsdVNiizA6jhV5hEDGZt5M+cK4
	QQdE6PWihnZ1mjqShfZEhoqWWg4MGLAzQ9KzWsmhu+B133sfXmn+XJDN7pTlSq0WDJNElrt48eL
	n7jC/MFvrpdgfTzNP6ZZQKbbzFnrXHU78/dhkFh9o9p80mBQmcmtSBfKh211TaHKRGU0/LWqQ
X-Gm-Gg: ATEYQzyrp4oD8UP/9nWiBYIsvO0oY8wdQMdZ1t1XaCErBS16LZGYOv3oKV99f/AiC2Q
	S1YpO413N+9zfHKS4vnIDOA83+DASodZX67jQfkJqtfx+DzeZyK7PhDJMODAd5iYhcMXWNatouj
	pJ0SN+uB555HcRfbjobKncMxK7NwoIYHy1mM6jjZADmIZ47k2xGIKHCtplPd4efcIu2k70haZnT
	gVAcM2QSG/N0VJAzDD1Hs3xhOpepT/btJiAIPGnNZMHD3MAE9iuI55wCxi0Ih6NJomgvOxvY5er
	gPQBx9oIfHpnEDygFGIbre+ZpE4HOlnNFwaxmTKEeZIBRX4N4ofinbrVSYJkPHQWh4MvwQ/a3kG
	5KAPjY7FlJo8tT5cdyKkK8XuUde0=
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73261601cf.17.1774628335579;
        Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73260801cf.17.1774628334502;
        Fri, 27 Mar 2026 09:18:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:18:38 +0200
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 Eliza ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-remoteproc-adsp-v1-1-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3oaZ/QetAeynWbZB3KbmQq4OjLboaqinfN1
 5ZpNgyuXVmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat6AAKCRAbX0TJAJUV
 Vo1JD/9eV3rwqakfe2vzvi++o7rrdNxvW3QYoN3batkYXXHvbjGYzFw0cuVgOBuRnwyNyZFaW6S
 S13JgZOuhnzAl/GVxH0f1gfdGGcwWLkbgLtSotPJyhDaWgAdWlJOqNjCbJibOdlgDbxzA5gZzPS
 0fqtRfHo+lNojMnkGcKJrmyG99GoneZFNsDuyFkqXGMjsPWI0fjXOkInyRxKMx8frn50WmoWBNc
 SvmWAwFBhWZaCoIdsHAPtyag2tV7VPfDM9znFF78DQ8CHiJObxKT3QF7dSHGA2Vk0UCn71kH2aQ
 bLNr9MbSsflccsWLX9clKBQpXnmVzGXEvMzWlOlKDGMg9Sx3GbyeAtwF0JJP1WIlLL8XCTKEFVC
 Whe0Get9dzHfvYHI1cifE8uHV1JEQQfvH6afwjV/6J6j45JnG5Ib+gkMdS71CBeJVPSktV75Xuq
 +S+vxWhg7XTDb2vb3OFNfMn4yiCc1Qbf1Ln+tYDpwJb9zxQMzktuo7e4GR1xm8Y3hVUyRSomWlS
 bsadWAjjpoe/Oj9VTaCAu0C85VOuE30yyb3b4w1GcEKQoCf2qQ8IpadTiXtZUKJE+7lIqfVh49B
 PLOtaoAPciOz89fGUIG1J384wzpbhlbqdyHEfvutEZ8WI5HvKoM5mN88opRsRLzm87vlciUp3DB
 WiV+HrjRZrU37LA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6adf0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XKsGtxyC0ZlOnUANqVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _3vdDv8pXD5rqESy1jLs5vzFJ5zwKnUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX9dsDPwNTNyYe
 9B1M/McsIcYK1c6rMUmn/O4aUCHJ5l3RL4h0WZnecrzPsaIAE1aFRCeO4p5ZPYbEkPyH0Z0/M88
 DosAW8Z/gFFu2G3oxY1TRqrQO11M5uPE0H+3clC0ZXYV1WTbcYmkzrZoWQ7jJF97C5qaJJHC0Gs
 VLTO9lDl59X4DMoHt+sBRG/of+/Da9Wff8SQN5RxezPts3ES9VD1gdNDM/AxIWCCynSTFAYRmKn
 JqgMpaOQX6Xo5p1nGetunA4qdzMWJwV+8Ytcl1n2hMnza/FuZQndoZdKS+syywidvsINTSkay2f
 dE82tcuARhWaPsvqnqWnplt4tUZpYdei81Mhx9B7xbGc4OC2y5DflQuo6cdYqv+o703VgtrqKIJ
 39wJ6kCAsMStItz9sRVrcDjcFeUK1ueGlecSxjF4dvAnEwU2P/KJuchIBGV+/6E3g3u2JOH/N5o
 JyIQNdC0bZl3MqNj4DA==
X-Proofpoint-GUID: _3vdDv8pXD5rqESy1jLs5vzFJ5zwKnUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

Since the devicetree bindings are exactly the same between Eliza ADSP and
Milos ADSP, reuse the existing Milos schema, just add the Eliza specific
ADSP compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index c47d97004b33..e5cce0d05fc6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-adsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -69,6 +70,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-adsp-pas
             - qcom,milos-adsp-pas
             - qcom,milos-cdsp-pas
     then:
@@ -89,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-adsp-pas
               - qcom,milos-adsp-pas
     then:
       properties:

-- 
2.48.1

