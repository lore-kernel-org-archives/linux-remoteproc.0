Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580376;
	b=j4Fb3KV5LnKl7bCxZcO3P4nYynUwvYcw1jZ3zxNyo5t1vshEmynIpvJVFFXlLhXPQpWe
	 CGZf4RfKTP3aq8naRScqemTGo7AvB5FO1Adud9awBmx94ppxPLJvdY2aYTjdePGjminol
	 tsChVNlCv1gx7dE0FtWrwCCcGcdZnxsfpk2cjSIUYanqgb3X0v7QwMQmSRbfm20NZbCUd
	 p8imk86hg7iaumzWhUS7soRjJfCvlVP2Fg0Qt35ndeetYs1oIWz4o3RIdRd1T0+L/8A6L
	 V2sSgqm6LRS4Q3lCCpgmAqQ4IHWBuK5wIDdCgMgh+tYttYvM7bFwpQh6nEYeLF3Xutg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
	b=xfmi3uapnr3UH+iMO593L9vam2FwSaR/L/HG9pInZsz9Lbw6eMnOIAgRzl4zNfobnAdw
	 mQMdnY48RIRXzNxkxEuXaak1e6BmXC8oEP5fD1zHAe4sSza3SYQ314Sa9/UIqsbU31Nui
	 2U8HuhK03clbluH8ekBFG1I/on29E5ZLU0XB15Jn3wPNTpZyQdFG0h4c/zZP29b57a11p
	 eKMI6ie7gNXc1SsTQueeR5fEM7Rh9YSzvJphfYVprmnuIj/d+T2URomDNiTIdOguQ6Ckv
	 eZsP5Aos82QFce/Vf+VLPNdY1QBcwxP/bvgSyVIQ6xjylxp/7N5eaRERM+SVAV4J16w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JSCjFhaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3Li7M7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8C606A330
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E8C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JSCjFhaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3Li7M7i
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTG3033801
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=; b=JSCjFhaC4ibUOLCb
	lqKAQhI+kL3ed9Vd+lhJbSMUbAzchjGLXlauk6Ez71a7Udmjx0ajT2vb/vFffxRc
	6KQUmdncpobX0S10TmRb0Pp/Ov7pSwDBfvaMXgKevUe5KP0QxgDYJ5ialqvcur13
	BTI/V44mgefD6Uipdn9eyb4AW+TCGoJ5OJZOvfK/ijqVxsGB9YxTeTlI2LLt+gND
	0QfXXB3TKKHd37GOWh8mTDpkGWU4d4ziMgRWMLD3TjJdHnFODw1qjYRpEtw2HJEX
	BSgebtyokpRVKhSiATCQkHSVepqpkzvy8KHTtEhnd21Rf0Cr6npthfCNLkwof6Ia
	cKzPiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9sxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so206490985a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580374; x=1795185174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
        b=D3Li7M7i2pz8mb0tdoPgdA5hftj/rwrWx0OmZH27bozUKM6Qu33dAdbLJ0u1IByhIp
         dwfvlKjKjmFDKqINMYYLlJxNbxoqYLa3UtQkRtPFI0erZUigfzTZJfM1ZegYOS0WlZ7X
         eqOBc7pHLaYV3X494iqdFRd/zPfBWRwe45vsJDgvR0sEIQIlEJd/i77ia9th6ykz9rCN
         WSqiQALFi3up5SWS8swYtR8quoVXJ0XWYgjT9fcc0ForDN5EijXJqWCfCR3HP6gKz0wn
         WjR/0pS9eFWdtNzWyB/QX4YIQqknjAWAl1gxzxBa4zuiXz46N5kGuelRytvvjXNQ0VVK
         OloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580374; x=1795185174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
        b=AcGlYC1gHHDvvOG0wPxfh8v3CoAHdR7AWI8TvKGVKz/KJUmv6K+j7TINcVOYUg0Dgb
         0abvlgnYUA8m8/wSsS9MN1kxCDW/UWJ6YRVkQZcmBvc0lQ2tCeLpOOMU/uufHbUnxqRq
         O9h1h1XvRcHYoAmCq9H2583ipgRzptGw3dqUY53s9U/h/OCag/e+CA7fc+PpaTOAnpdz
         ZfAVzB+gUc7nd5I4z8XhFFgdLqez3kXjIj0xRVxc4M3awARc51s+JpnGcUOQlzagTvRJ
         b0i1eAQ7VDvV5DypBqvyHoXc4MVOKV+7/NXeq+K+CUahCNs3rkTJbsiun77Qpwxh/fki
         uaeQ==
X-Forwarded-Encrypted: i=1; AL+hErGOZLWU+e6WyGGEYtn6S3cs4TZSv4HgCp/vr+OPiSA/gYu2r1aa5AzO7KaYqbQr7ckRDiJYG3I3slPA4zLujvMS@vger.kernel.org
X-Gm-Message-State: APuU4Z9uVKYAy7AlZlDs3l7uHduKa/6lGWwADe2uCJ51HdfiLqElEZBK
	cN/Po81IEu+NUWNv54s5lue7+tgm/lW6Xok6P1nh0g0/gcl4A/55W+iaJPELgkODnctGQLc2mo6
	5Zdp0ns7u3nnx+sqbU72ldQ650QsBgamuaszl2sM3PQ6Zk1sXgyljw8GeYRxN8yLBI90rwXhc
X-Gm-Gg: AYBFou0LHzyrE8js3RyTe672reb3Yp2XtgSk5/OzohVM3dJDG15XJNy6hTNcnnVq/rt
	R3eFFmIbKmb3POw9hQo6KXEwj3y0l4gcmQwGNChw8fN3QYg2mEWU85EFwQ/3KDg0bEyQ9de7duj
	kS9gPE+AHK+OHW8erYebFbyACs2repDpS36RvEJynfZ6N7i4/vskbAe+1Uhsa1WoRqmdA6VOTcE
	haiU7nIkFs2cRrJPFIc8zyoVpRxOWqgvVpzAe091iGupmi4pOumkR0nO3Zuq3aAWo9w7ZVukxg/
	RNWTGRkj1VgQVIJuU55xOsmDDvnGi2JsY1hnzHYyT7XE4PcRJK3p6zEKGZOoAcvhjy/b6o2Bt7S
	b/Pg7Z3ReqqaSyWN69092OIJAgQYGAj/k6lPg894zy0akTCg07lLi4xpd5iEZFEQ=
X-Received: by 2002:a05:620a:684a:b0:945:f6b0:db0 with SMTP id af79cd13be357-9494bb3103bmr412284385a.30.1794580374094;
        Fri, 13 Nov 2026 06:32:54 -0800 (PST)
X-Received: by 2002:a05:620a:684a:b0:945:f6b0:db0 with SMTP id af79cd13be357-9494bb3103bmr412275485a.30.1794580373281;
        Fri, 13 Nov 2026 06:32:53 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:52 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:20 +0530
Subject: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
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
Message-Id: <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=4275;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ix1p+s4/5FlmtMKNK3IrENkc79CTbj3oJEUhEGUvIiQ=;
 b=puyWhF/W3owc44RYAXXdymbp85R+5+n49L0XBd3Me95/ff/5yOnGTpjkg5ks4LNlLkbBV6q9F
 dT9vc0FbZ7nDvoWfteB8iX+gevNczmLiapdMWivy+t5G4kkUfo88b5/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: aixYu7bb6Ji-yIuXyDKC-SqvP4Ny-BqO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX76nJeACk6KWw
 Y06pt+JzEPW/FSDzN7dFT3vYFnfgyRQLQvZ0xN+WDtnn5dVpIKAbb4FwsaNTTvxpVa6l76hWOR4
 vTugX2c3EFK/lNAguanQQiQJ9QstFFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX0PZdeub3ogJP
 h3ffNvrcXE1owTN2swOkS2dY8woD08nr4WP9IUClYU/STUQUVEOVerg7M2Z6UO0MnaxQyFXhRTI
 dXGWshbtZsg0HHd7sibLcFoAgBdKWslDQ2NREeu1/9oXsedLGB8ADUoK62j3TFMyFWFAE0owyM5
 Z+M5WTfcUh9CkqCdsSFn5kHs5t3IfVc6lKHj4qcPCl6GcgLjCyn2SzwGibulXYdV7GEiSDyksa1
 EiqUg2to6lMu/+xNs0BORySoMQQr6BG1cEKPUy/RRRxmC6ATxZP2xADv7yX3JTtQyh2Yqa3T7R3
 3/D5GHdzf8DLytXyO+cGZ6EqSZiZoMiE6G0tcllhwTx2Gg7Hg5qDOKx/fDNAJEGjyL7lpncl1G/
 cZQ3tF6CZipUkVocfQ8hwP5KW/xdZMaLG3Ly/QGYgdXg5geVeuxepwmVBMfalTfuwLImNZrS+PF
 uoJN6eDO9RrOXAufMag==
X-Proofpoint-ORIG-GUID: aixYu7bb6Ji-yIuXyDKC-SqvP4Ny-BqO
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af71f97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=K1dVU9MMS2i6ScopwDcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130057

qcom,pas-common.yaml limits iommus to a single entry for every PAS
remoteproc, which is too restrictive for SoCs whose firmware uses
multiple IOMMU streams.

Drop iommus from common binding and let each SoC-specific binding declare
it with its own limits. These bindings set unevaluatedProperties: false,
so a compatible that does not declare iommus rejects it. Declare it for
every compatible whose nodes use it.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
 .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
 5 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..4662fe4cff62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -32,9 +32,6 @@ properties:
     minItems: 5
     maxItems: 6
 
-  iommus:
-    maxItems: 1
-
   power-domains:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..3c35da52204d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -38,6 +38,10 @@ properties:
   reg:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+    description: Firmware Stream
+
   clocks:
     items:
       - description: XO clock
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index b20780e5e26b..8aebc785f212 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -169,6 +169,18 @@ allOf:
             - const: cx
             - const: mx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-adsp-pas
+            - qcom,sc7280-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..5c41c8936960 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -178,6 +178,19 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-adsp-pas
+              - qcom,qcs615-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..f838b98c43f4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -317,6 +317,21 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
+              - qcom,x1e80100-adsp-pas
+              - qcom,x1e80100-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

