Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180582;
	b=YJYjOagh3hiFAPPCTjbwISMrjeA9PhCTThPwvDRstzJA+Qt8mlLQ4Emucftk3f6Sb/aP
	 TstLnxEk9huDqVNOj73hE8OtjO0j57IGZxJQ7/ohT9ByapVqS90pGovfQToiW1pYBxK2Y
	 68lt3sYjOMdgsPYfxkFddZbrprV9hoTKVGYHjPFhkxlCNtniUUzbtDGijkT+S5PdxGSyt
	 XUcpz0rFU7/03YcdhtJT/kTsSkcJBwGY7yI9dwyVD9JmaF0Sszk3CWPqXScp24wPlO9e4
	 jGibG191wI8G2hByXH/zyRiYR0DtNy+3ybee4d+YI3uxYMKut38+n56FUdCqguZ79aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
	b=bjqcVEu7c2HedrAkgKXvEQ3fzO5X+rvFRcWVye0VCc7mP01xQnOvQskDiYxKxZg9jRGV
	 e5tIwgaiQUtbE0nSh3w+/prwePSxtzLhzbgM9fe5h+GJAQpsYjHCrxYRXO8fIa7ZSK5q0
	 NfOVqUd9Y2vqoHBRgdHN1uSrR2VyxmmXVPpLSCVFi+TSf64vAYxGkuVnM1869vuReS01y
	 lcwpnc5rEBH0n+iY2j+y9+dwyaKacLzD3cqPDAPJDDEPkyohNQW2IZtTGrhHmTBVn65lM
	 hz6vSRe+qV2klLU2rnBOsYrFw6zf8QO75DRi1lQPm1Ok7zLTpDh6steRLwvuyf0qcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FjSIE/wt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1AQLLl4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B9606A326
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjSIE/wt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1AQLLl4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvNL1528593
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=; b=FjSIE/wtVB669Ywu
	Yrv5b0AhR6HMp8KwbhAFYqwPJrmnMkE6tbqGtWQGSfNY69n4quB3efG3+GuzhS7H
	CWccCN2osXQ9hupg59yFW4huFULjYA193VPalAeHm8XhR+rFk7VU+w6TKhPTEh9W
	O0Ito/Y87qjhx6oRzRuq2/mDV8y5cnbOXWmLWEpPF09fV12ViHCJVup84yF8npkm
	EgAEXvtxOEq5DaaK3N91C+R3jJEhiXOkbF3YCgIfbafDaSZiaS7hrJ9vA5Y0Ej69
	REzIDZy8ykZYJa4nY/aTInQlEudAJkWNaNBitmuUPhmJOUqKGR+ip/9e+didKtIM
	ED+1Uw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt09t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:16:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so2633864c88.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180580; x=1795785380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=H1AQLLl489VBCtquRGYB4brHv8i/9x5Ey0v4JdxyFJS6tQHjX6I0lq2NNzo6CT0oFz
         GrldyW/UB0gtW4MgvJw3lTrScx6CPG6OtKSrTfqY+7tydKJTVz5EcB9rhjJpTqSELsIu
         VmeJQ5NgP3++3c4/bZnvkJB9BpUEgI460vehdnTMRJvFRG+B9wQ++1MkdIdbqsiBJj+x
         5RUZ8feRWxQ8qriqryGZFpX832cw2VZCjSTonDkN4CFk6VJaXt+ZU1qzra5hti/Low4G
         oEoSvC2ZIUOTFPsyCum2b2TtNwgtfyIeL5Hu3bpaCRoHyioMjBRNEEOdIiIuDK15uABx
         Pa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180580; x=1795785380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=FyJC4Tu31wY/MPVdaX4d8axFv6J+qpm0SgF+0RQ5K68GSrrzD+itS8oZhdW5IefYwF
         /E18o0vwZtt9eUvsw7ZlA+/OtYQWx+f32yAy2+4Wmcq50Suw1jwAir8cJ+JiPWQU9G1x
         tRQX+OgzTvzqVLDi56sHmvbNUiw4QtXNWxlyrVivSLxfxfRv0Qk7NG0dC192K723hfI6
         ySxhw1jELYVbh6x63M8fTJ2HEtlW7Z1Dp8x4RUAbbElb1TquhN/pZdfgU/ZlJjPofBYD
         PujfVtXCbwqjb5PvnyVm+0DmmNn5Orx6NFnPf8Jjs4h+cOoPMbaOQbhKQMaeuXQha27N
         On6A==
X-Forwarded-Encrypted: i=1; AL+hErHh7aQoXWRbraYfkN+ukxHv/YCid0hLxC5OzVBKjukdposVwxpJEHT0XjDBNqhdygcJ3jwcUl1G+w9bnKuzYmBi@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mebd5Ru1CeET45L3y9sI1z0IA8Pv70Fz0K3DB4hVL8dNG9sS6
	xcyzdrfsh9/MDOhy8KpxpgRrWY1oN4COMsG36rl2eTOiaMqIn/eIP2ov67nRrTS48J8toj4kG8b
	Lrlvf2KjNICpFedS4R58nU5COx5gvEHdTtgVODTnQYH7nUiHYCwR9eDBMF/H3VxBTdGdrBLqb
X-Gm-Gg: AYBFou1lsZRE5WwJNKL9LizS9Zple8bgw1HOmWwNH/LFE+yDQY9kz95pZaDLCgeI73l
	fBfriTv4pJoZi9dhOK0VFRSoo+n3c6GIYLnDJYOwjzTS1w3BRecDJUGMtRjpINAHimD3YD6nhXn
	t18V51Q/BM+DKHhos6fueGw27KmoI6W6cvTXz43NRNw6GZTfgldDM4OkQ4TMqj9lbVnth8oW87z
	u39RvfQwnnCFAzSGkxM3jSlX8h89nlsjPDQoaHuJ9XluyhklVLKTIXdK6H7HwzHcG6nQDcb0KFQ
	KqosvTsm6LKk3UziMoxO0mwNSkbPR3VhusIL0jjj97JgsK5EshEeX6racSyMoo1ogM5a7IjISLY
	5bXQbSx8vc8PojAE3oS4Z7lFocaXX/nk0g9ETByCIywh2qJgNZKiZ419P77fib3Mo
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id a92af1059eb24-1b55691dbe2mr2596728c88.37.1795180579648;
        Fri, 20 Nov 2026 05:16:19 -0800 (PST)
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id a92af1059eb24-1b55691dbe2mr2596706c88.37.1795180579034;
        Fri, 20 Nov 2026 05:16:19 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm10494874c88.14.2026.11.20.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:16:18 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:46:03 +0530
Subject: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint to
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
Message-Id: <20261120-shikra-el2-v7-1-b19595f24eb1@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180567; l=13099;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+o0b31Dm1RBTdPfDwLMNjJUq7df600C1I0aEPpq1j9s=;
 b=pJX/OF2V+Z+7KkI5hMnrh2tKRSII1jY0r1PflRpX7g6FaE7XVquaIj14pI8JBOlJghE4mollX
 QJ4wGKD54leCWPvSLUPA2OBS128eVfwipIJeZxiirQjYpFFDu/rhyZs
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: xjDf1zsQO4jMIJh7XiuVwhrmbZDyE3lO
X-Proofpoint-GUID: xjDf1zsQO4jMIJh7XiuVwhrmbZDyE3lO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX/nCnhtlHY4lk
 DEnO9Invp8ks8eeEPrPI2mjMKYGaDCiNhryMWSqdT7zVC/GqqcZZVm0d6f3/vZH7h7XA2AUNM4J
 r1h6EsdHDgzYbwMM34KmgdPcE2FTPrSWe4kIGQBBwBdp4JFc1A8w9KlpJ4//1/ownW+EJKWFkd4
 ih3bH3hOIl0JNemSjeFFcCU3kIMQnY5ZbfJO7poBu4PNNcauykrvlmJtqq308gFSXd+nm34OYyK
 51zZLF44MqVXUVdvvgy/yq5v8rEsC5saJl7nAbANOn18q1IIGzNnzUzEyziIiLZ9zI52P9Tq7fh
 SvmhF2F+qZFp0jW/59fnnUzdCNcjMRELTYoVMFMx8Pvq3Q95nHN5rqCRiPPdvJUG77mDsrXXfd9
 MwYgc0uYcaJdG3e+MpYd6DFwP9kbenPSYqg6moeAkfVDtoxnVEYcPbt9X+6nAb/X7RwwibcwFht
 Cxvv5EBs+1enJPeswsw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004824 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xh12SZzz1sePY-9oQmYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfXzrVqAV0sp3GN
 mKGo6rTJZIfhweMZ3VB5HU2n2FS6TF/J04/3Kt2I8/V0TIpvrPmFkvsQ+SjppvZTGpDPPBB8vkT
 FE8cPQM7zFauEGPQBZ/0gqVC6tzu2rs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200052

qcom,pas-common.yaml limits iommus to a single entry for every PAS
remoteproc binding referencing it. This is too restrictive for SoCs
whose firmware uses multiple IOMMU streams, and a schema referencing
the common one cannot relax the inherited limit.

Drop iommus from qcom,pas-common.yaml. As this removes the property
from every binding referencing it, define it in the top-level
properties of each of them, with a description and the same
maxItems: 1 limit, so that SoCs needing a different limit can override
it in their own binding.

No functional change intended.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml         | 6 ++++++
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml     | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml   | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 6 ++++++
 17 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 6cac1f77993b..99c567da3e98 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -82,6 +82,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - memory-region
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..06aeb45fb2d7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index b24e6f6eaf37..4a033ccdecbb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -76,6 +76,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..b1d84d8be4c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -89,6 +89,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
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
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index bf9bf1af9ff1..c8898a041fb3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -67,6 +67,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..73d25efed820 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -82,6 +82,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index b20780e5e26b..33c9ff6522ce 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -76,6 +76,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 4bbe4a986c7c..6bff0ed118a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -73,6 +73,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 8c16b01c53e4..83b9d7289e06 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -79,6 +79,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..74f83b7ce08d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -88,6 +88,12 @@ properties:
     items:
       - const: stop
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 454ba82bd6f1..6ea56b497f89 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -79,6 +79,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 42e02c64347a..28e44a1dcc7e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -73,6 +73,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 274f87880e2e..710dae4589b4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -69,6 +69,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..9fbf1b6aed76 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -89,6 +89,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 72d0db5698c5..15da49130146 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -83,6 +83,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..a3131e6417f5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -115,6 +115,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.34.1

