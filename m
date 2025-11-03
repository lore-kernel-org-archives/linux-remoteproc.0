Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB943164BC
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Nov 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183792; cv=none; b=PUHQpQQLYY75boh7eeUAxMaDECiErg4kBTF/uFlMVS3Of/QT0MT2JPJ2Z3w2hunA8eCPLyDFWw0DAZinhtXU7SPnCY80JOxis/y+qaY2DoANrbjc0/wlAX83GBCIXu04hkKaibdY7MAkuGmbcbzmzwq/27Jueeof5NPstgKKM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183792; c=relaxed/simple;
	bh=Qu4o+5vdG4guuxWL13xICD+nDkAgjCx0T8HQXjzGPZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D7HyRb5MB6OGJd9BQk5Z+9xxohDWkfqEiyOe1/f8A+remlpl3BX19EqeIFDnqILFrl2085mN8yMRKiJrY+47KDkaE6AY7MvQ/A2Q4zm/oCbQPuRvrK9sXdxwcz0gVWgVFBwLQODblcP/UPKO5vIONb+arneaSGfMocxeQXyqe6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BkutaiGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu2ewWuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BkutaiGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu2ewWuU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38jKCs1211300
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Nov 2025 15:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFs
	xCM/VYy0=; b=BkutaiGvu9FDIxWl/+NFZuQGHNvm6/SwZmaRUkVGMiwJ++zuspL
	qzwLX1/D2mI31HoBm9ReqWQoUI/5pNef99vPZ22uxl9+tIqFfAr64XhLlBnYQ7yx
	Zs4wBx7fm+AucLRcwm32p6wGGcqjfo52osdLyDgvxIaonvO2lRHbZCbDV/ek8BAC
	8aDmgnlyVcQ+eKd2yn1xC/4Ets5M5HFLnOCVnYfKpmf151PaNsaivol6lkglQ/F3
	HIZsdkF8QJEbzD5Yd9WHKDJ0MqH/0ml7RhDFOw+fXdnqkkQdXBaqLmdzDx7g0FJJ
	pGwun54Hh9CezSEG5PR2MsJtYzTx0UNKGUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm50ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 15:29:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so4554700a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183789; x=1762788589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFsxCM/VYy0=;
        b=Bu2ewWuUChgjxu9VwTa+tcghF4cmT/BLKT0ewI5gZLsx8w2TK3d0rE9eQuSnpAMje0
         Tac86dPMUynFy3N71UTKS49fk+y6/6ByFhtAL36xgtq++tLT6oDfPPMNVjzrZ8lNCMRw
         CGIisqliW6Je4tKP/ybxL3iwmKlmaV1ZCMQsrq7I/tWjwZbPC0oryj8owJL4WwbIruuU
         fJVkaDDZ4JkeBJEyfoY+UcTJCg8DXEbjYc1UO1f6VDWENfUhohlx7ipsCCwUsuIZDvbc
         scXzwMypX4AHEVZSRkbzULHcdAL2Y3K5uCPrmcrEh4NQPGSNBFYdKOokESC+LMD/TY2A
         5tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183789; x=1762788589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuUp7Twb1AkLQGRdG3T6gdiruxN1hkGWsFsxCM/VYy0=;
        b=S4Q0chrNlsbRft7R3KRNmi6t80rfTImR2xvCiD7g0OgtaEa47d10NTK3jxmAlCQzOd
         W2wwCeMTE737svEEvYjY8ZQ/66VMQpi6XS7gXpCQkKFS/iGbDIcPnKqrtWTfnTGObR6V
         +/e1AiA5rTmh5fWtcBZAIQca7mrvAt5ktQEoRyIRGQDh2sACi33YUS068etXkOpodWX4
         jXZwsmVr7ubzKHbXv8ftNdlEWaj611iUDIq7vGxVv6QqD4snO8XHv/lNCvU8R0dnrDsq
         T1gqWnodWCQwmg6swC+YmwF0OPMG6FabE17VlpBBNaiyclKskRmekD6BnvDXaMJHbb2/
         dQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUKgbjZYEl5ri63ZSUqZyHjazyjhw7cfrKVQ1vZMqGyOi9H2G2/+fuO4EGnyqlS8QfekFXwfTq3QZH1MsWrqBsh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SSpuIWylok8liRxV/AERcAT4fkDPpz6srN6n4X46/0v1f/4L
	JiveCNWG+/uKr1B9XOoiNAv7wS/zcrCvDF6sURcv3881ziRBoK5592U+4r5vqj1vi2B1Hb4a/ow
	u63/IsbpPaCHO2lSHKrO0XiW24KGNBZLvz8tMPKHy2fvO8jPjoiDpQziURhOG4gVEdw2cWdMW
X-Gm-Gg: ASbGncu1h35KSOaD+BZy80HO8Ucna2HV1PIEe+H3GFPk2SXqAlhF7n2tU30Iq2Z5kfv
	jCcjcbYKpwBHQ8QqQ2fsn4SyfRBeGcg9D05JutPt5XycdM6e2CQniodySoEgjkVZBpOftgOvm0t
	6SJtB0g0/wJC15TfHw3J6odaASrC3aCejhPjKwEkX3g7AkDjpCQkRSSsGp+KeD1sLR/bntinIHM
	GHcTQP6K8g2bJO6zv+4S8/gbYijPzFR7Ym8ObDnVQVlIv/EFxHBV+K6NiBr+0oC0/b1meegE2U2
	Wu6hiaIvjYDpDL1VXtEMG/Bh4QP9nogAXVrDsTbK4vm1rvxsfvDRzMKERrHCj5cffReVsD+UP+k
	kqb+kW7GB9tHYGwX0PCIeKesWpoVT
X-Received: by 2002:a17:902:c40a:b0:295:54cd:d2dc with SMTP id d9443c01a7336-29554cdd5eamr137298325ad.16.1762183788598;
        Mon, 03 Nov 2025 07:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeFoMWtVRbtUqyET77Erx4bRvUg7ngB/KYLbL8h2qmcG5sVT+8D18sM053N+dGTqJqIll3iA==
X-Received: by 2002:a17:902:c40a:b0:295:54cd:d2dc with SMTP id d9443c01a7336-29554cdd5eamr137297895ad.16.1762183788062;
        Mon, 03 Nov 2025 07:29:48 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm126087675ad.84.2025.11.03.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:29:47 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
To: andersson@kernel.org, chris.lew@oss.qualcomm.com, konradybcio@kernel.org
Cc: jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH V2 0/2] soc: qcom: smp2p: Add support for remoteproc early attach
Date: Mon,  3 Nov 2025 20:59:27 +0530
Message-Id: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfXxBhF+cSJBCio
 HHNPHADM3J7O85Ac6YA0Fddw5vhuhh/LwFFnHAGWdErhAWIraD8+cZbIW3iOarwrzZeVUNjjo7F
 fKkinJcVvPCMyNvLj2j/SzB5wCzsP7WhLT+hgkd68UTDgkShKBGqPJ2t+dTBUM0lES+pEbWUZE2
 CaBl8OPhHWtPZBfQMlaP0XSCmxMrOK9b0gEOyW4fvwtnebJIY3W+cZekEe9emk+ttmHCqVrPJzQ
 I5Za7wZ87ipTLhKdNUMu+U2Ch5krNHUE3VnmL6XfdASE/o2+E+ecBYHBnFkXnKeJw+xLCrx+HKk
 2hWCG3dOQgCleSxoDYuE5k3DrejV42Wt6IITLg037q0WXtvaJ0M8nL93VXWdr0TteiP6nsgS7l5
 92hNT3hEfG/77ba/qpeHZwSKjJrxCA==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=6908ca6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yQkoZ8-9xyiC3PRw88EA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: BtO9lwIfHMLj_0qCrBozq1LxzESyiZi7
X-Proofpoint-ORIG-GUID: BtO9lwIfHMLj_0qCrBozq1LxzESyiZi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139

Changes from v1:
[PATCH 1/2]
Update condition to check version 2 in qcom_smp2p_start_in().
Add more comment to describe above condition.
[PATCH 2/2]
Add description for version v1 and v2 of smp2p.
Check validity of in_version.

Chris Lew (2):
  soc: qcom: smp2p: Add irqchip state support
  soc: qcom: smp2p: Add support for smp2p v2

 drivers/soc/qcom/smp2p.c | 102 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

-- 
2.34.1

