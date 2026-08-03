Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85833909BF
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754033; cv=none; b=YvwkXdQhd+otblbjNb7gjNAbW0KuUieahcKiSOXkMLuEdGW/O2C9D4+YEbwtDASlBwP0D0HRaNQceEit1pjDBzurpreLISEjFN1DrBS2OwIfsHPx+B8RBYht7/cbhHcuQ9WdGOe+unigwuHDLy+65L39DRauqvjs7EKz93j06sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754033; c=relaxed/simple;
	bh=bloAeWS97IJ5qqPAdt7nsKjEyYSGak2VI2PPUR8dBeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhjWu80jhMbMRJapIr9dInmiwcDbWe//fp3uaPqYbU9ZdPAKTcfv+dbXMk4Kg3yexKm69nynXpTXkD+CJOwkUEkNmUhyGIrmirtwIKRiNxj64+zcmnOem83+/kmL31nr1kyrTI/7nqNWKsO37Rqykv0exhVPU8kqpuobNTRlm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSGHcJqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7qJWFzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSGHcJqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7qJWFzJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736ksII4123780
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 10:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=; b=TSGHcJqoBkHM8Hle
	SLWqnE+KCrjMNHYsoybUFK4xFnfXcwb/kSzLpeOLr6VhEb1un9KmumJ6Ij2QDN3T
	n3uPlzKLii2S0vrnXpbGwVBllZZRm6xjXFf0gld3be37t1MUB7ASjtrGVEvkk+3f
	BLgqoLrBRc0lXJhiKvfO2ifAdYJo697EqWH4CyBWT3MEw2fiTCh+e0c0GRpleNF7
	CLge17pzUWU4P7fQa3R59fOZkVQe8P+xD6llkWiQT+IiSlsSNfUAgi7VZ8uUP7OJ
	4aF1aepeEPpQw477EvYbfUfLUA/SamggBSPMMwTTqF9vez+1y2vUUF3nfFiM6M8Q
	Lq45Yw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp16913t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 10:47:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5003253a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754030; x=1786358830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=Q7qJWFzJpuf64PHfRSZqdifIdujX5ZVAXsUs9d3385qsXT/PE9TeeCQUf9uBBAoey+
         qZtPEqyofiTfcUikQhsv/C7byIeK6remxO4g2Z6erTw2+lCojv6Xee4nEX84bWz4hAXN
         N/oUV33r7OD3anJ1YMAqjXLn+Nox7x0g+0LjccXcQS3WGyApZqVHtk/CEUH12nmvnDNm
         oP9nJ2IuIMdnbUB+TwbkrhNAZHZyLbsEGFzCVqPvcNhRj+hTI/2LkG3Uit4sW8mQYCgw
         vuz1FXcppf7s3k1PFMVoYGH1kvABVQigGJVH3DFgWkQxoZ7uIFdXMnIx02RIc1eyylbc
         20Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754030; x=1786358830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=OH3atodB81po9H+VDCItauWt7qsVnXuOItkeEZoFJ3F7n0eeNLl/akv/gzfiIM/gJ7
         pXquDKktXEURhFnRqwVaFya2lHCwq3MyMqKAL1Ur+JN+iv9EDKXXoo/Pnl3u9ddQ7B30
         /u6ryyoMAtHmK/w3Hs7i+9zBj0l7sSdo228cHkCtw7mZbhnW0N5TyqO6KPtnleohwhfh
         F15JuXUNOGRG3oVXD5k+uPmtTrxWQCub4ShvG8TFqiSBTWblFxZRDNszRTLFxiSaLK37
         J/71kRo0GjUWHs3zyJsYAA0ynsQnH0PjOarP2H+x0KQjVQhFPlu7QPTL2mznUGjGzzxX
         o9sA==
X-Forwarded-Encrypted: i=1; AHgh+RoNptNr0V52H0PHSbLtYsOhiZUHRDTfgSvP361tFcyAgx5dlsgO92bXEFViPB3gil+eaDIr7yY6241FQ0kYmm+X@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/x8s1RmJGY+44WykFTXoCACEPvwKoie+8F9c60NyZ36xepQe
	N36+Z+tZAQqhmCfAPNHxR2zoqdYfwqymyUIwILTnLkNEX6Ugi0bnXPpxVwYxUgsrBviIlCgV0yK
	3mBlD0tJXDzr4fuOmoQ7iOSUdUlKMJV9YqIU35aTKnSSdvWtGj32dVCB1F9E0OBRh6giBG8Zm
X-Gm-Gg: AR+sD10d0M6rz0TmONbAC+6LRyybJM5APHhyCXxgso8mspUX+hHhIWneX4LyAExea8o
	q9HRm9skuA1g3NJmWL/B/oKI2lQddpmGHHlo/24SqNHS061aWyQLWxYcq2f0xEpu6U/gSjkl7h8
	yiBrbbMG4DVpqWFKDJmqv91A5W9USPHfrAfudrrKHLMhB9CsbN3dTR1ACtYw7YId7flSXKzt75h
	0+aXybXw8iVhw/rLpCDcz3VG5+yKVDYmkAL3gandnOVHIzl1Og+dVQ8n7tzfmPBSJN3rAjZIL4G
	qLHZjRNUoFkVMAi8bpHEDMUxAx9omUTK+uGamjvF1IxC2lm+l/Xt2FORV8QNUC81SyvR7VWNiLH
	HqbbNfysLD8EgQEXtuumuBSIUIe9y5CSBpoLE0VNKLZFtKHtKpbbZh496tWcrdNlz2jbLZSdAR6
	N53ud9fJzZDgWjsRLuVrJxZL+7S1udnQ==
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929317637.50.1785754030604;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929304637.50.1785754030211;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:09 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:15 +0530
Subject: [PATCH v14 9/9] arm64: dts: qcom: ipq9574: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-9-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXwlH1FxC0/LBk
 IlUdHvxs7PMRLJhM/UnCrAZmMnmEPzW0JMiPEPceM68Ykp/LG9zCnqxm1o7a5VIbRfAeSwd+hDx
 8hftSJNB8TJvc365Ldye7/FL6UymYd1PwXU+lR3wsRu+JsMrs3pIgnzQc0+kVMC44m7zRZM6wW2
 dqiI+oSNwzpGz5vnKgYMmQqkzSMgmwGJkKppDmoHKcpvRAoux1Y/eEL6iwjJJNX/JSb5BEQyCFp
 Q9PCq0rLjTmG5UvH1VMdag4sayxO8Ek6TlxY3EIv6xhQM0WYz5Ld7X9OPfgz4vt5jzUJQNO0fk9
 rzA4v61XGXfWpORJYTpR60uQajEefEDdioXHE8hP8t3h4Ba69Do6KtE3TTVc/Ohd++rjF47kkkf
 bHsEuePF4JAZjo5oyQnV6hUdyI9rofPCVq68d1+KQopjI/rPW3fMGdeLn8p7Mq9tBzMZgNg91i8
 oTEcbDnRwBKdzkHHcCA==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a7071af cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jH_bmcyh0L3YvPtRZzoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX0JNaWoDMCAWk
 I9K8Ti0AkXBkqEo5aIi6Z3spvkWQk6npgPBnjqKxxqEJf/+7WLcH4bWJHJWVT5TXglmzHBeN2p3
 PXpNs/7UD3KKwGbXPKu2Q7HhplQ/fiA=
X-Proofpoint-ORIG-GUID: pECuyTq1bJ5HRaqm7-8k2OUz2kvK5eXw
X-Proofpoint-GUID: pECuyTq1bJ5HRaqm7-8k2OUz2kvK5eXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..494a150535cf 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -113,6 +113,10 @@ &cpu3 {
 	cpu-supply = <&mp5496_s1>;
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-mp5496-regulators";

-- 
2.34.1

