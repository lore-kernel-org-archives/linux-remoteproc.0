Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB52E8B6C
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855764; cv=none; b=ueG7aTz2NIto+unv/rL1ZAZtiYw978VrJ5ml3s88nSwPOiNmYRapuJHpbb4R6dON2n0e8bCPFnD1l6BPRt0SbU7E+XJBMKVE8Jzqk1m1b+RRV5it17BtE0zSKBx8M2eUjwsibQT+8mY0LHrJFRTFhf4cQhJXjh6BtE4ozuGiAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855764; c=relaxed/simple;
	bh=yQcmBzzoF9DWalLjee8gEifniSD8YVltfiDi807djjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0n57POKpX4cdghlZyvlabUqYn5SOHxl7xN6EHpdmB5q9Hztqk0veUkuevbzfl/LrccwNgIEUBlKD5BXv1BFFJphhv1RuYrKVCdWe9ocbfJO4ojttpfVMAvvuPQSEqp+xI4Z86PZxir6OLm8unnqHbixRTuUT46zI9oPJL4/EZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GELZehE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GELZehE2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETM9W022541
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64fVTnFFfZEl5jGpLIwHf1DYoSU0yN7CegjL03AoTgI=; b=GELZehE2ShGlnKQv
	C22iyDTQdnd++qArj5K4i/pJNOxfiMc72Funw1edh3X/rboFvFCRmroeZUwe2+y/
	ARfiuKqDiLb7ZaKtRFZPScvf62cov5SZc5hMzuR0blXfJ+HFtNsIL8iYnhzr7nEb
	pYGkycI4v3H2u65ojadcQwnt0ILKyX+HQ7uEnTKs4RrJckIwnmMQZOSu82nKj5Vw
	wNWnDWU1Lpf4e6rUB1fDLxbjkaXvadsP/KNI0vGG7EecblolS1Cndr1FP8eGZ2MI
	UURa5c+PEIbZQUhvbTv4qza+jK0XAjz6tko/b9iGsXlf1mQtFYxXY1+W1FB+zWdH
	EKqCbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu7y60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269a2b255aaso127602225ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855759; x=1760460559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64fVTnFFfZEl5jGpLIwHf1DYoSU0yN7CegjL03AoTgI=;
        b=iBEsL/IpfGBIL+/lfTLNLc/SySnRefVC5QP1j+SVuajy3Tk1eY3seB9yd/4Sm6/aYS
         xQqDHQ4o0NKNHNPFr7aAQmlgJVR3i7eQQYi+woBJz1kURS3YnF8iH40nBT4XTpQXuVky
         TZXfwZgA8iBaBmuDqyCDP3IKSaGQILxiaLMTHqU9hZRiWAr+cT8dj6Nbp/mmPZ9OGJCO
         l0FQNpj0bvEnxQKaTa/AVbJNAErDaf0W1p73HegoJLD88XY3ph9vOegTYwi+qdeUMmN4
         K+IDtyWXwxpUE3L+yoArqYJcyXfDhh6hbv83qgAX66Mnbh1Led/NP9zy0+pZq2FkdHSb
         MD8g==
X-Forwarded-Encrypted: i=1; AJvYcCW/viq6dk7U2hzcEF1WIESV7hMcZ/SL0QuDZpR0M6t4sIsuNJy02X/2miua0/nMYn76kfwZ1DOFF5LzCHJJHijU@vger.kernel.org
X-Gm-Message-State: AOJu0YyGFxaDuH4ZT1y3GdBCkEQQ+jBsNTMs5LgkdjJunWGRO5QtshVT
	RJQYRaKMsp1bNIZ5X2r3DAsB31ABU3gGDZ5RbLcUPCI6i34GJ6rbR5i2SMmoFEhNJ5C0KykaIqA
	bSLgXBRmehpoegCi+LD7uxwWRz2LjBtlh+ee4Cqi/8STghuTL4p4ABTA3t1onQUhjxIaUXnFN
X-Gm-Gg: ASbGncuQbGgtjqQvtrgdqC+lCp7Mikmss22l1HBZgLEAQGgCkhCjt1Tylv+PTEs5N9s
	G75V0YnIKj1oyuhiehIga224YOn99L6exoBEHr7RYoYX4Uy5gyOsSj3c3QCuPd9wWA0AWLJ66YY
	MqlTqs3UsuZtuh7u7Wbg8b1U01y0mV12bd4evo2ly/GNK71g254WGiC0IGrmNly+llhkflc9SLi
	o5tBk5FdZ3qxqYKluoCG5eYo/sZl6baZXuBMHQDUVTwmJNrBbUdIQMSGQJ9qY2OP2v58Fw55bUO
	Wfmbfj4D8L0Jit8Yx5QVUhXbYHHWmEfrRjNSHTQfnhs/zmcYXQa0QIRpixPhJ2yiKaYrh/0O
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr5078985ad.40.1759855759224;
        Tue, 07 Oct 2025 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjslecCe61NM3LsrZB6iTB6HGCtdzDllatkqmlEEptEDY1li5Q+TFUuNY5rlkX2+LZYBPuQ==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr5078675ad.40.1759855758625;
        Tue, 07 Oct 2025 09:49:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:46 +0530
Subject: [PATCH v4 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-1-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855750; l=1163;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=yQcmBzzoF9DWalLjee8gEifniSD8YVltfiDi807djjI=;
 b=eNgm6wLt3+Ue42wnQTOpuEaYPRaxtNeiY9CgLvnlGlttjle8kCO0E3SwUGk/4jsz5Fiv9CZK7
 VwQO+7gcziBDRo+DfyiJUIH54HwiUkn2h+mLfm2LqOxBPEflbGLup0V
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: KWlVV7ooAgx50r8qcxmuvwqV6A1lHkTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX6oQIOo1P3t2C
 IryLa3/ivXgIeierbXbfQWJohMbwboEWsxQWSxUJxtoUCOHHIiy5KMcT6EH/n6mzBEjY2zLilYB
 nxjdpBZuWBKdsTe7kWr/F1jWtt+eVt1fM7NLGQiIvAWwXLF8dRzY7XE+sBVMmDYy5/P12udgodl
 DwKi4PPA+HRmlAKkeYu7GF+LELVCi4m4VY3ktOM07LmPCwwMEEu9SVi16i09llkaMiPqXS2eOLm
 5dex0Jqzzjojv9Qk8EHvqLk4vhECbfp2ahB6vq5CNKfCj7tGfWQ1TcauqXY7erSVPu3+q5R5bE/
 9Ysp9PZOVDII79lWM39pDvxwZGKtQtLjn2HIljc/ntHkMLGj+7VsMx4TaPahnw70HIkT8jgjLQd
 r0Yn7ineLYGhRs1raINdHizjXCN4yQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e54490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=yGyP_gyn_XtU8QVV77EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KWlVV7ooAgx50r8qcxmuvwqV6A1lHkTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..8bd7d718be57 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    minItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1

