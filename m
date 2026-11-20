Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180899;
	b=m6Cg5W/ULf9feQt4zawLjD5f/dPrUvYzk8wnemHU6UIDLhDDoXlDJ+L5qygNx4fIyg5k
	 O00DfGbPGbknhglhKKlR5nv1LalhuuNCwzSFm7Z8TnW/HtuKcj1Kjfj/mt7rhbp+5hCTI
	 aVv3O0FZF654ntSYuJz+RK8V9yF4AfQUWD53g7jL6Ay6eSiF0N+rOC7lEqSyASAX/cwzD
	 M51DYrcUa6UvtqAtb0VHRHua+M8N4Y993l5oUzGJ0LEbKYz7rxqlqQKDdrpvG8xv5w5ig
	 KSf/4fz47BwyyX0tnH8rqupjCSVo9dshU8ALnf7TjUYIWR3Ak/9lN7fPhkLc7kXevoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=n6k5T1TKaG4GyQ/HoLIS0RPkUMj5kQTGH82Zvoz/ZTNcPTrq1HG2tQfM2pFlbVEKBO+6
	 fh/ZH7CnOC4k62+uJ2O2uxpMfE5BZxQG07XcUp6GRoUU1EWqAhdDFDrljnzMAH0wmEsXj
	 t0+JhZ4TjdqLGllAZUDQv6eforiPMDWGmeSY4AHV4RC7K8aPSZiGusIjrBT7/4uiXjDIv
	 6febUTrUBqYfxOE+W/FWGyqKWgd4Ow0qBb/gG61Yei+LuTo+zxtq4b5qUsJUA8PBsQY9D
	 Tnqf82b0PolhuUPk5ynVVt1d/MGu5jmXk4VziNQ5NDdJ+YW19KLeg71KWRhVtBhaYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1HK4ojh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F606A325
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0727F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1HK4ojh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk7bg3987240
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=lfsTI96NcRfym0qx
	Ewn7J8yRv5lN+EMvbcDSaMPlD79smUlb0JsvejSWU1cxZGYZQPkWo65wAkzIs1D1
	xKoVsjFE4le4RADHwA6KvZ9Zb/eGPtAel9CyvR1mwphr7PuY66NzKNVnDEwyrQ2S
	lEtSxeUyZpFvI/DtpzNWlhmEiSh0KfnOu//G1F/BLE/qvJR5muNFYssKvoFQ1d4+
	PXu7QiKN2so0hiNvMU385u/AXqfI5D/HkqRebioYUcHbZ70qxGSumvfyNMwfaJD0
	ZkiU8vh7xPRgagQLFyGWJB4MFcC2dydhwRvBJ7qCtq89EVlydFDuKAFblwbwKwlA
	tOk2gA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81mpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so906030c88.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180898; x=1795785698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=L1HK4ojhsg801SsbqEhFDzfKS8YiVJSqtLWWQfd4Yfyb/cGGsOfhOnozIdkPWg4xlo
         UKtMUPp+wmS91v2j6iPFTHbd2L4q+fIQposGAQAJSp65aXt6bxee3ufv8gxCzGsXwfn0
         p7iVdwDldkrLz484wrvXC0sBTZW8bLOoc1SZgYBY/4AydoqbXBQI7Hb0xwIDFGXnneJX
         Tb0MAGGjInfr2qZ8svzNTsEtWMbCD2qUwpR2vfL0BXtc39UHN1S9vyHBC9lwNhPiii1T
         idA4Pllh3OH28FhStqlK6yyiKUrrhGU3B5ovUCk2IGD6YGDjkrKHaMzVWNwlrOmGzfoB
         qlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180898; x=1795785698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=nF6BAifUC7OLyJ8bVV2sFWk7um6Usfxk7ezBd6W8rF3GhnnfpoCD17SRtw0ZzwKdY8
         Mc62RUwcJ6mfypEUwmYmZ9vY+4j7gdBk2LrEUvhzaUUGawlycideAQi88ZBWPHIa+Gt2
         mStX5ZMKHZDjqfk8rj39vIW8cCLU4pTenWvuBt0KqKwfniDSogqV2M9J4cbLdTQGQr9x
         FaSFGHf7ClSjDCpI8P+9/y7bKcrzEoM4Q1vMzp3WQPwT7KP2dnwM1eoqlwRlP1HLMwgC
         RqDrNzItOuLBvWdqoLE26ddZGIzMYH6wyX+MVRyVKzFRK3N0dIXAWOa6YThftBaAKGC9
         MKgw==
X-Forwarded-Encrypted: i=1; AL+hErFGSoq8EJ64i6lI86jUicSy9BQRypfQhPiaXNr8dzo/Py81k3v6/CUJrJaBfKOEQqCQh/cSjMMSveXR2WI0k7eq@vger.kernel.org
X-Gm-Message-State: APuU4Z9gJMLY6GGuaOwKdIkYuRuFi6D0UFewKcnP5KQVKB/bCE0Ndiid
	xVyuSok/6Q0/J9CFcr6qmDt2V301L1j4gmJkF/5p7ARWVRLj/ya5KptdfMkFeb8oD8KjfbpmICX
	jWqfZ+UBMN8+/p2+YOfbRrzCtI+qlXvFP72APDsfQqygEmDtY8JF9aCmxWWEuImneNwzVkHmz
X-Gm-Gg: AYBFou0SVmM8EsL6utlh0HM7huI+6K2HTpEOdZWWQb/5kGm/ZZ6wDVRjZij1w5jYlkK
	1xKkOWeWQn7oMJfKOEFdf1myko3a8AH4y1LtSrjSp3BoXmuRlxFWuZpcrHVF+Sr5BNBZ8e2OIqp
	O+Q5adQ0U4jiv8uwM+shWWWe4lmI26V8WVbwExiCT6SNUAqanFXGfiOofhHw/ob9KdzVBSoXEu1
	eFdAf/MaOfhErNtUnsZTE3GQo2Zg0oMxCYmuRXkLlo3l1Ajyl1Q9nUL+v09kUfYipHPq+kON+s3
	yOVuXIaZAM2Xf6ff69KBb6BhtGzapfvt2aTwrRmihgZxOyxFLl1g2+s1z0Nbt6iNMDUzXwfukK5
	RgaCCJ8+krZ7qGh23uqL7qEp6wfrwAwfGrwok/M1Z39IlooKte8s01RKHIDqttJzA
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009485c88.16.1795180897483;
        Fri, 20 Nov 2026 05:21:37 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009452c88.16.1795180896843;
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:50 +0530
Subject: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=mc1Vfk3i7aEY4zzE2pKuvjFl/03FLuO2BqaPMz5KkwZdee5r8qe58VxKx/y12U2T+2v5CtvSx
 Ztss9gKJkR7Ag+5kMMq3xwyHUxHgcALmfGpPFe8NCjeGlTL8ezMb9Ga
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXz8/3Tk9+Uznr
 QMIPrWRQh8hMLvn1OgKkPCeFqIyhhVGjcFtOL/oNY0fO1tv8ngfdgY6dkyYzSk0Nmali19+KaEi
 wt6lqlgIUjc3vNo4ucvF3KqFkYIFKW4b6Y90/h3p4Xvx4mBq3RCSz2NUKZmwDIc0zflmomJU8Xj
 offubjRcfugNz0feUw0f8sQMVopAeD/Dx/7JEfuYkblj0fJ8Ehxz8iqDTB79d8JbHg5zuz7/r2u
 3WIMlDEa54tkuqzs9oOy6QXLPeumtfYwFkA2/08YT8UF8VZLvJ7Eeyv5i4snw7O4QyLIIB/mWQK
 J0Uc81GfrWULodnrxj79EJu8ull/FbuxrzhjRDmtVRdS2oVt0Q5RAaaXxxEEOS4o8P+JC9fIYsU
 Z+MrS4A5FYUEoV7i2XOGSTPx1puY/Lerm4DdDkiV6y9lRGRqk+OYVzpjS6+JRvwuRPbdPN4mY3B
 b3OGdgIYqAWs2AO5xvQ==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004962 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: ycb89uumJrXTOpeboNpVYk4q0_sMC5Vv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX09+i3cQiSSB8
 FIoOMc7oZSCyYzyCNZp+pCEhKwxyxxinOB8XBmHh1SZ9d6OwIrQ6mueI5LWA14B2mpabKDCTd78
 /DMa1qr8HTgS1z0rAauog91lfqF892E=
X-Proofpoint-GUID: ycb89uumJrXTOpeboNpVYk4q0_sMC5Vv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

