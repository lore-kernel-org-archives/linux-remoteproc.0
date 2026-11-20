Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180894;
	b=p4Lt3PwnU4hSpBbk50eTNgL8TB3U5eiM/nyKuJFgZrp+6hMpgBvqNGP9IE5VAg8qbU9C
	 gsh9WP0SVxCFUf5oE1RoQWelRAdqCbNBtj3kbrtPqXS4Fk8RVvXkgEkAIhjOtm0T6jtWq
	 T7bmqXD4GDaIqll1uRJq0R5EzWapr3pJjF+gbyKH5Irk4GeORwV0YdmYp2Ct46WI13rHy
	 STU8B915IsIzJSq8deyUKsPCdX1s+0DfZDainYVJZdwBiThrxs6gpUOYNDksW4w1QhK6k
	 4YXFImZyzzkrkjUCxTljfCczLaf+qstEGnb9gcg5D5bgRcE56kh23W02J7GuRaQwtLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
	b=V+Ssi9+EfKSeuICxFV7pHnZsIekiYb8HnucVmCjXeHxwfVA9rbBuX3qaNxx3dEf9KhJN
	 kzAlOFKe8McmrBgXQJDpSPqyZnoupNWZIfPiJfSmUy1OAJlPAcP7kTDOTtK6hciqV1XYC
	 spE+4pu8rjllr3sNXp7VNisTgTSrfkq3nj61fnVZrCVFOLa5hnxRX9Wjv7iRUqsYnSh6d
	 IhZsIQ2Q+OUg2P2P881aubdbQabLj3ibtP0L2sPo28/GZw31v7uJb+avWPH9pe66sQPUV
	 sDiPq4nryJl6BlXs5/neg7UhrOM6zfue7BReMoFlrY89VGLWhNAF1472n6/EdLSSBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtbiPUP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ge1WujHI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE92606A331
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE92606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtbiPUP6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ge1WujHI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6jD3987229
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=; b=NtbiPUP6IOYwB6x9
	VM4bk/Ih0Rv8DR2WCuEE6cYxa8TBAFks4wZBEeECNsqHzIeIgVRjkvnjDlPh9twJ
	x9HTYCMGtvvgyFutnNWraNb8Y5Bbf325dzm2BGEYlXMkQ0WQNG8AMpnu+2zcKyEM
	2rn10rAaMcpVw9CRdsxrZbSssS2qlZfMfTkeJgC6ieYX52k9iV/q5oVWsJazWBP0
	BwbXxSrc3z6TEGLQSGzHBs9zwQWs/Zj5pEvg+6ogMhaW6ikLUlLatGIhMNUWDy3J
	/1/uoE8ygOWXSeUP8tnRqFFMIVk3D21DFoOJO40KAXK8Z9m+zDFXOyH4ZXHmwR6A
	VIhKWA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81mpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so905959c88.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180892; x=1795785692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=Ge1WujHIFXqQAQu3ZEx7+zhiPguAPHtpXRAMnFGyYRQStCAYV3psvO/jNVQftmox74
         hHpJQSJoDYIb/uhCvuKBeOPgOddzgTFO5iX2G+YwA/Lf8ZuPVJ3VbNjWJ56qw6XsUTJO
         kuNCCF5jXMIOvaetSDv8RdMjVpSuis2jOvFrEfI+KDvutqMMWkpf138MhgUfILqGZDCF
         BP+iLVTHfVZGncaJLGsFXkD4j/l7TRNl7u1C6Lgbn2FqfSCMqQyL0QcYmpu+pLDwwK+z
         0PuoGw9kA6J7hBz5GONnk6CQ6kVQXhX7rBzszE5E5kmx53FXYNCWNpeELBDxqvQ/KNZE
         Lj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180892; x=1795785692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=gfcuNR741Xqy6G3/feAEXexl9OI71QYcCWsbOYBAE9HHTPS7f1BskRLtZtJp4jHJUB
         2hN748FNBJei7AKTlhMM+NQDKJ25IRKVBcrVKOV1dkOnDE8kWFFc6QlE4qV0PyTlSpCT
         P1BsISfGxmnIccPgq4HIzu3JFVYomLapZWCHRZq15dIidrIjg28DB+3swp6BVnGb1qys
         9rS3NVBy8wr2by8Sxzq2Nmi9n66nA2+lMqlOVcIhugIc+RNQtWRpfl5FeDY+4A5hiKDd
         fiDLO1sZiAUnX/eGFl9Va9nM+edZLJV6Kiwl5YHxue0N3PxQAojNIieSzJZinX4vXHMF
         JASw==
X-Forwarded-Encrypted: i=1; AL+hErG51jbsBxbqL0HEPfnNO8Ra93xltGlWlpkm2oViT+cCGq4miy8s+0Bf2m5cHm7sc8plIZo8o/j3ZCnDWse/51J/@vger.kernel.org
X-Gm-Message-State: APuU4Z+MW2Kj0eeYfs5N5zISLvqdLwjkz18pVt0oMoZNfhJngRpERsHB
	vcCzCZRatXtXyKElxv5athL4ARhrYlSa4/yVEHUwv7sYusw0FzFt5paAfjjhWexH+m3sf/G7pyI
	4TCLNmj/l4gHxdkwapZCDiRwtwquXuyMHDtA1l2qcWxxJypTjAqgSegoUGDLqTWmDSXcBwW3h
X-Gm-Gg: AYBFou1vZBMRRw4lcjeOj1e6lTHoFNXoWbvt/E1mya41ZRi3ZSywBNryUdz75qTKKh8
	47zmRQ6dhhyotjGWXMoVFjNZfv37lYZ8cnxWnCi3G7OZZcfzAsbQ1s7518/LFAFXGWudLKlJghD
	V8TG97CLJdEPbU1UkD0Vp0R6rxJU8+Nh1V4qUDc5+x8mVAdWMaOE4ZaNo45mMGBDq50zLtay1Tv
	FDMr+u6oq/qneTLJZVr9ON9aSLDIgkfC3pFwJ1s+yO1PKPq73PnUQo5DA62oNpQJkw5RBi50M4M
	jC1uZ1M0bNhe/H4ZOf0gXj3oqO19B6KfN34vsrxs8XbsvleUek++C1l/cusmu4k95PEBRMN1D0+
	3mJt3mNKxV9/U53keVetobZa/KA9o84D2c2osHkcXrDH/TRkBpwPcYwWL/4OqANd3
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b556695bf9mr2705044c88.0.1795180892040;
        Fri, 20 Nov 2026 05:21:32 -0800 (PST)
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b556695bf9mr2705000c88.0.1795180891219;
        Fri, 20 Nov 2026 05:21:31 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:30 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:49 +0530
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
Message-Id: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=13099;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+o0b31Dm1RBTdPfDwLMNjJUq7df600C1I0aEPpq1j9s=;
 b=9myfbHZmPdy/YZigoqeCtZSX+dGbcVCP8AmCuxuM41OkOP2KPFGlNPcIpxWvdKfjn6fEa4YjU
 FR8G7NoT9q7CITaDrZ5BVrHzGqjighsLKoDrIHztaamJeLUCpJczg8m
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX+1CqXxhxKiqX
 Wstyvn6UWaLvrUUKVyCTkbmxZoDx0EGoDyNDtQPwKMrmGYNDSiMOsvlnQmnJvE5MSALinI6uiYw
 u+Hwzn8yQ4mE9Gvc7qgNmJMD+ysPiO7wVIkD3+vgC+Px1QYhFJDtBLGbg+/XbeKRqcZWp1QP3nm
 nrL6hFQgznbiQLa37F/uDoOParr8R1h6QoZZjH5DmXr/SoJYjxpycdOyeT9+iyehYmoRoNVVIV8
 4YfEJZQtIXc6KH9zi36OgFFJMuja2355pWaoaV6u+htTbthnD2Juonz9yvo/FkSy+izyb0ilGUi
 0Ozkw1bYkXEbolWXxrdy+PqHneZZaQIqYCqe/frDts+dLGRKd+MRti03dPWRo4fk+t5h/VyVwtv
 C9MY7h9IQH3SuwoSS6I5HW6c2wEuYriB+yRQfefJGikRz7Ik2x9DbfuPV+9JtRuYqrhK7dxNpNv
 0S9h6ZpQ19pIlpGWQyw==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b00495d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xh12SZzz1sePY-9oQmYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: JCiUylJoGVDuZ6llElFQ_9li_zpmRNub
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX12rkaNmQd/aa
 AMBY9Gwieepw94whzwh2fIaSDBCVN2AJ5LlBjK2MsPtUldfbnAiSyoVAvIe17rGHqD26wLXClxY
 J/Xz3yGr626Ep4AirP9/AHVsCg92vbQ=
X-Proofpoint-GUID: JCiUylJoGVDuZ6llElFQ_9li_zpmRNub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

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

