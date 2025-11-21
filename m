Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2F346E7B
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722891; cv=none; b=G28ZayMlVzU3e9AIxt3VksGPqtvOs8I45Y8mZe4DRzHv11Ew5zoA+nsatSXlLns+ixxozvfgXj/mwgT+uNVrl2byfZ80vK4bUhW46oKGEt9EOn3GPfvWCjguKf8zYE5alpbverWRESnPsIiYYHwo/SUNfRXZhg3HdFGsNlQxvx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722891; c=relaxed/simple;
	bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ48K4f+7gG6eGhVit+UvqfoZ8LV0pVih3TKOY1yjqZv8GCc1Dxl3erDGhKD68nxcNYTPpB22S2rWbFylVDhFXC8hKcPjP4sw1MErp0Eyij6XcPTAZSrKM2V7X5TYy3Gv+VP+vsp7z7yhMhnQJrHb0LB90mhP2bfmpYjdFWENP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cv91jIaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eudc4oHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cv91jIaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eudc4oHi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5T7qa2831702
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=; b=cv91jIaPzROzud47
	IMhTx95eBib5nAW1VaBvZNOlW9UZ9h65WL9qUclSoKynp8ShaSJrZmCubBvHOhgd
	z7srWLllQtFj0hazcpBI6qGvHmKnwGHmPLfGkfn7j3o2smruybnFenzUhzSliGV2
	w0xC+f60XBPFR/kcMGZSDxqyifCoDmfQ2vJ8vswLrAgYwtdFnJDPTkIgsxmpSLw7
	mGcqMIT2VjS+e/VR8iCIK1fJjWKbYon6UDkN4pKB85wU2KY/iZCiDMtrF4CW1dir
	UTDJR/JQ8EsyX8trJ//HkTe3VcbwxWPuDtU2d8BDKqe5248j8vR5As5cWG3ac347
	q6LdBA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq148n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295592eb5dbso52572575ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722888; x=1764327688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=eudc4oHioT8/FohRshMuMUy1i3bnceeNvsr+StliyxeI6ofLzNcJtK5Rw03DyC7n44
         Cqs0wGHb/Rdt4lneVCDs09QfqjQWtoQeVwkKl1MlUfYz0cMs8OtDhu/qG0l8oxkB8FWz
         CxC77Kyte1oXdHWxR44lYJiezSOWJ4CfXgtsUWKPihd02SlQtrX6D/bndldDugvIdPhm
         0wvKMeY99s0Ge6+4QSYCAPN/oe9/fTPYZMxwPtsBlB2HZC4S++NdVFgfRQzqiwo+ta/0
         OVllsQNApaXSy0pPyZ/GXcUF/8s0Y4EfyFSLVSIwua3wl9bcmZzPI3ZfcsUaX8SY/6pj
         9c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722888; x=1764327688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=bBunw4RjaEsebfXUC+vZ5DZpDsWEu7FVwQXAyHwX7pK6JdqxN7INd8kMlB79oJ9hmg
         byGxr13qHdFM41dvOfK0UXptY+xiUrD1TDdavdp3JgplJXQinee//eDwhEx+2YYa2FGP
         HJ4KTTzyjizIiucibppBTi1uyeTwO7WFAg2cy+cAZVlNX6cc9EI/PIdbwotvdxXZNEY/
         CQJ6OvHzgwCHac8oyqx0zbpMI29RyzPJ0kZ/uPC7g4ILZ9w6DRO1BJVFH95F/JUTHfW4
         jTOOgkaMadFpaUPOftKk/wBvkeHxfcu8j4yz9ksRS5XcA+OVt/qusgfJToURD8Xv1KIC
         /Jew==
X-Forwarded-Encrypted: i=1; AJvYcCVgKk6M5Im1ykiVFOFTL42PtzSaxYBCXQN8gG38eDtlLLYzyp3mSjUQ0v8HDyj8OvgVyOtfbWTXGggmOii49pnw@vger.kernel.org
X-Gm-Message-State: AOJu0YxFz7vybVgFvHwl6pljBuf16JRrPyiXIxNCvm4klmlwtWTaQGL3
	ZBvkV9AJbLu4cn9eKArI3Zw/c+Br2zqv5UoyuZHvhpR6qsH2pRJjGxjcMye6LsITo5m9sPyk5fV
	/T5S6wfdukTCuIsXpiDiIVy6l7zGM169W9Z+loJ2iVJieXi3l9S2e8MTKJbzaLEQE5lxN/SDs
X-Gm-Gg: ASbGnct2y/j5fS0bkHhztU6tWFMlWNssVsPqyNuEi5zAtSQHn8EUTrLMzfq3uv9/Qlx
	9cP2iIuTmswe4e1rXiElXgEqVJNe47xI6yHNi7F/gy9dtbzcf24/5qOtzCboCVHus7+WQDelV5K
	2JNp5JFh1RJn0oKbZGR6TQ9ZwRzl13lsGsIf8SF5rN7/ijqifHhQ5kWLPHvZ/D0qrA1NlvfuLgk
	WscAZ2d9kb7gFN+I5p2HNVjXEJX++ux5AEKaO7txLWEiCshPlok4qJkoD3mNQYWqVmyrRi3M8pg
	jzLmX7nDehQyWOpyKobu9XdIl+Vcpo1h5jIn3cuqz7/wIRGmcAp68pAglBH/v6qRWn6qo47eiGx
	U031feO1I66g2BQzcMLWhDKOP2ivVAkx+Qi9r
X-Received: by 2002:a17:903:2ad0:b0:295:4d97:84dd with SMTP id d9443c01a7336-29b6c6b87d3mr24634545ad.51.1763722888014;
        Fri, 21 Nov 2025 03:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEl5BDq+JwLlgnwGD8sLOEYzV73S2Wo1shOKcjpoBNg05GK5vt2WVysz/arNBau/dJyD11vw==
X-Received: by 2002:a17:903:2ad0:b0:295:4d97:84dd with SMTP id d9443c01a7336-29b6c6b87d3mr24633985ad.51.1763722887332;
        Fri, 21 Nov 2025 03:01:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:27 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:03 +0530
Subject: [PATCH v8 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-1-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=1346;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
 b=nics4Afx9r45d10kQzixveh/IFAL08pfx/B9GvoJmwVM/e1/qB5k04yXPGDKghA3/buLMSV4a
 ACl6ra/514fBwS5DwSBGivRMTqTmzi04h+IRNpfB23Qz6LVLlQ/x7tR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: HdoMIoCq_VpxZ7KDSJnJOyw-rXXhnMC6
X-Proofpoint-ORIG-GUID: HdoMIoCq_VpxZ7KDSJnJOyw-rXXhnMC6
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=69204688 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nDsJnkO8JLPJ0mjf3QIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX1Wck79j9rUCw
 RgeWAxsD+GofHRKsS/hNaulx6Y5odpnPgY0H2unSJSEIUk/0QxgNPrmiU78azKfp9JqZ4kBGQL3
 RPD7RRe/b8CP1jhrWORfj9/ADgWzGyAq6HMMkQee7NiOJQYdwtPxbyV1kXphbzBhReMZkymynlk
 XdjbbVc18uHSmneOQkWfuFirBZDqBCarn87dVEIUfBuo3htnNCcVP9sszxEGtxyNlrtioNAnxKO
 pkOJW8CXJ2ECjGIHJLJ8zCoC5YnZw6LaiNLgRTgVgExrFm0EPxOyxIU5ahspRHwZ6iNxVFyQwad
 i7H4t75FE77MPIR8kDnfH8U1eiuNWbZ/puv+kqAh1yQYP1MUfy8/QAS8FZswvyEfzPjs2F2xWXn
 C2Gj3PxQmNt+JbYWwsDbFr7MY7JAYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

On most Qualcomm platforms, the Qualcomm Hypervisor Execution
Environment (QHEE) is either used as a standalone hypervisor or
co-exists as a module with the Gunyah hypervisor. When QHEE is
present, it configures firmware streams for remote processors.
If QHEE is not available, the operating system must perform
these configurations instead and for that remote processor
firmware stream should be presented to the operating system.
To support this, add the iommus property as an optional property
for PAS-supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1

