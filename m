Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572668;
	b=p7Qv36rjrsrBmV154yiq9nzEm6BN5iMtjqXF0tBnD2CjFiYfkIDTOMEBCvQ1NjcEPb1D
	 6UvH1Obc60czpHoshHiMJc6mR8zcbI4M+zZs47vyv+4p0MNm3YTADOJFVm53A3hqDbgvv
	 lBFExLY8fPCdsxffQUEPSPaSdQB31Nnrv/Q6Q9T52O7agqVMAx+YyowJKFB1JiOtaPM6a
	 GN6u5spvv4RgZGzu5KqVKTo+++kndpKJJ+ql6ZAX9ldiN8QsxaKegJZ+iaBgFG/LvWzGg
	 qH7khKe+CRRo2wau9DLxaDNlFUYYtDZ5KfX8ypV5d4qBQR96YaojaDK2hApqX7q/3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
	b=cneeSt2jB7WZ0P77jApqQO51JAW9Y8vs98mHa54eJxa8S1y2hf6BN5qO3RkC0XFmegjo
	 PZvYYPLa6Rj0PDZq74cnKys5MrIw0i/BFV5o2zL4/+3N7hy9X25a8J7z1z3caVY6zb0wy
	 rb0Q3RRwu1Q/CSBFJ9iNwmRXV2jTerSjK6AnzFaSXVhVzoi1A5ETOQbRVncv3fNotiLWg
	 37+pc2/MtMVcDm3mhfoJ+GZlOn9U3JFFcH6zVRsm723wDiZ8FBNNw263ZU+2ltqHIoFWc
	 TCESaNQZ4mZb6ck45fr+YzXzRF0C1YOkx6nB/+yKV5LNFi3brYAM217fbQ6hfzi+qLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B960A381C
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340B960A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJjqg036581
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=; b=YyQkST7oKc2WT7Pj
	TZoWHWDmlAPaolZcs8yXyqWEYxIkeQx9qbwqhrlAgc4qXogj28cEWjcUT6i8GqoD
	jcpzatO9oCm7ZO9DDVf+Ezti6kjvyHKKLVyUv8qo7KVbxy6Mp3OxGlAYyMSS7h1k
	qzdStdJkcbf1KGWhpPqgKON38xqaEpxzwuEt2EjBiScoNMuqebhjpiEbDVUTYIE5
	v2neLr64JhebMzs0wKepJGPWXnIadC5TR7rBgD9u+2S365F9va86t1TvuDQ5BPJ1
	1qadSl3jpiOZq7qDcHwz24v5LnT00m5i5J2OmWBbzJ79m3DYEEuYgIQ1o4qhb/Me
	KAAXMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9b3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so673807b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572667; x=1795177467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=gzYttcDxpcpUg49YzOiBplA8oG+Or+4U5zT72aGuG/wxcKCz+bRtiBvyly60VBovCt
         TjKa1nQ2Abx2ltQ2/J8ZyVTmYheiP8UFXV/u9yt6fZ+qmP0Wgu+G9sjsDusctQh9MFjh
         nZmzAhQF1UTT/GSW2iYUIsGxOEWREcR9hLM1k+t9UefnT2Vui6uR5e9L3B+7ngJZeCg5
         /tvBBNX0Fkf01tsRWpjLbCZX3vSl+ypqGeLHGyvKtdXFFh1u4E/Yibbm3KBRnZetYI5U
         JCFjOGl6TD0GYTGdOSlDz4rbyoIRDtzqizWE95r9GOakwzDlvifXIw7nGT3nMvMksN31
         Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572667; x=1795177467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=De7pSZv5T/XdYUhr193RYWYhM2+yMQClV4PJhqd7NhMHXEm3Rr5epVoy9hemmC5uH1
         DA58knHfg4dqpvnWZlJeN00NjhddqMkyMBtpx8DHjaa4K4EofTgdWb9O/arsPOM0rjMh
         ElYqZMP4zY5NcFsAGAhk4degBEvI+FaBtwYOU6k0kuS9wOGbfjLEXevJuTJTe12YSiQv
         uTRMLhR+ePAdhK70pjua3+pN9xDYDWoTU8E9zowtW+NYmQAxJUAzXmrXzLJCVmMtPwyh
         S+12ZVAtHZbVfWSBHo1rGxJFWcBWkfL3hPul+TrHn1ps2AvcwGGsPg1AbuUVvZ1h79Z3
         P4dQ==
X-Forwarded-Encrypted: i=1; AL+hErEckuAUwA9YT5W+J5LmJ8Af85TkGHUAeqTFhNhmbw8vLav7/dXbo9u5NVYgzn6c8pYC9HAXE+iqCAAdVD7cqlPz@vger.kernel.org
X-Gm-Message-State: APuU4Z8ot2tdvDhr5NyXxpNrbyhbrpElt8RAktDPXbZgjEbJg9yUBfkj
	Fb1NkVO5DJ1MSot/T+hz1azGtlCAoUu/YlJgPyjrrOsxv1PkIVNq6Jl4LVGjK14aLzzUO8kl83z
	yh1DQjS9l3z7/Bqv+W5DPJbfgfMqURQRKLHyiO3iGmHVhkYgQ8Nr1yWl6QElCt7PSjSopFQGm
X-Gm-Gg: AYBFou0ZGWgeL4lSRBFH5+swfKitWJFqFor7vwRc28iVRerUosRVnh3crvkIj7W7oZt
	wJ46PxQMolBii1fmNAU+Kx+az9eWmQqXlJiy+jgXA3wIjMwm5YnNKBArP+c3LKAcesZsj6nywi3
	GGm8RxOsA6OORklIpGNrPctni+1CA9q0wGqUC63dY5LspU8IvHu7B7hH4LVFNIwDzLqVVuIl1Ie
	RrqNChPsJcTQTuY9PEBfoA2iiKx5USnjxdFJwcC4ZoBfjHRWGPOPfxV4XzFxawj8NhBIO860Rjv
	dgGyp+wKUe7naG1Fpi/Pispg75gbEQ1ihQ+1cp4dlIqer7990SEGChBHEo6gVTeUT2vk0p81QxG
	DYjPdtHWvJuh1974cJmiRFopmj+HWPxZiXYfZX21vTaZtZzUEvLZQH1wBSnlIcBIRaW34PlxdJD
	pHA0jVggG3XA==
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200518637.24.1794572666834;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200484637.24.1794572666380;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:25 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:12 +0530
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Allow 2 IOMMUs for Nord
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
Message-Id: <20261113-nord_embedded_el2-v1-1-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: PxNFA-B8TexhGbg_cGqKVZpqIy4_jGu-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX0F5wZk+a/k1U
 4QH2mYbNh61UYKJ/y0YNRz6v7h7j3hGs0rljJTYbGGlIdxgS46qAAjP+poBX9qa7UVVtcW4PipV
 s4AdMHU7dbN/6g1dB3iujNMm0kwv2Ik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX3FEvM95k/r9K
 d8vNA1cz1yD7yDVFXVaIV31NIeEahtQzdrAupbEVkPHbLtzTh+1CzELjeanrU5sNyyYKkVrsdSK
 sTDl2lIxjbl/ASkozEJWHqUPFyELZfy5sQpEx4IeHOqjB2i4fTs/ovkZR9KPOMFP9/vRPKVvj52
 Jd3iUq4u0hE2FjbY5OK4929PVTWcJA5foCWTJk9WVpc1CJEQ+bZw9TxUqnzbIGJCSad06aR7V9V
 n9K7lWP507u4bL9670AeQnNFpAWDSUp9Mz6WJY/y1HXFvDko5z33wKwOSXcsD136IwlUjsa/sc2
 kbCt5IdKM5TJp7As6vt36d7dQIZfh6/8sXEcUDq0yJx8wxyXFmttf2PPAJ66kxX6UGUJPyQ3Iob
 ybmRQGyWDBeNsetKwgpohH6GhU8LbN8S9/faWJ4n6XPnAf8f82X8vhyxJtTuIL2UoLbZmsaLGYv
 VoAsDoY4M2SCx7MiIXg==
X-Proofpoint-ORIG-GUID: PxNFA-B8TexhGbg_cGqKVZpqIy4_jGu-
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af7017b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=K8mYBIOISTU-6_9uHSoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048

Nord SoCCP needs two IOMMU streams when Linux boots at EL2, but the
iommus limit of one inherited from qcom,pas-common.yaml rejects that.

Drop the pas-common reference, describe the properties locally and allow
two iommus entries for Nord SoCCP and one for the other compatibles.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index c1911124e073..405291c769cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -55,6 +55,10 @@ properties:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
+  iommus:
+    minItems: 1
+    maxItems: 2
+
   memory-region:
     minItems: 1
     items:
@@ -87,15 +91,27 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the SoCCP.
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
   - power-domains
   - power-domain-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
   - if:
       properties:
         compatible:
@@ -111,6 +127,9 @@ allOf:
       properties:
         firmware-name:
           minItems: 2
+        # Only Nord SoCCP needs a second stream (see top-level iommus)
+        iommus:
+          maxItems: 1
         memory-region:
           minItems: 2
 

-- 
2.43.0

