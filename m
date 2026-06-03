Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C25B44D03E
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481689; cv=none; b=OphtdQIHH/SbwWkpOzDyDzsOHYPKdCkgafp3up/9FwTJ6mgdGFfW0VEjhn/e8cSZhtJbKq8MZyNGrnMh2riEf2mPJlGh8sNtQVQmTfWgSIjWOiV+xNTj38lJfwijTxHyiRqm3KlrbaIANvuUCPjB8+NfKxLxNya1djzRxfuMoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481689; c=relaxed/simple;
	bh=ZmzlMq5l8xv2ijHU4ddQbj2AgHT+1ygitV4sixDeFQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPpSlrJGrbh0e3nxLShiQ+slSxGqqO9Hy6lFdzIAu3FZ2btL02ZFmtkqmEVAY5DhiWMkj+awEF85Oa4MRDwwrrt3vw6SjrzPPkpLiXn2yhtP6rpNs1W6VElI9VsTt1IenxhQEtVPXovD9zB34f0CFCYIs8lo/CBZz3Sksv0Ovek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWfzMXDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuTj/YOr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWfzMXDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuTj/YOr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RMvI1946464
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=; b=XWfzMXDL5IRfHEG6
	GkzILN1/Q0prLEW/596xuUU35At52iSt82ceomQzGsDcxZZ/7oHvbyChWrut7Fuv
	yiVNi3puosxg2Crq19h6FIiUTz5KBrGNdZTHigNJlqQzPeP65bpq+e0PbGrFuyKM
	iD1LGjkyCBFzLA+7iRzVFh4Ny3Iypop08+VG9BgzSk5tYFq0Ob+VnAEUd977ItKD
	ewDYPse1jI2T7LCB/e74WfxA8akYNA+xWHUx1k1o+rZQH+XibHgQxgjf6Ww092n2
	VuPlpIm8aEikZjlnjekR3DJNlcixFX0/9QhDjC5ZVZ8lulbuAAVoo1iWX9lTMDPe
	IxMPsQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabghxdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 10:14:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so2211287a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481686; x=1781086486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=;
        b=iuTj/YOr21QckrBd7R3TUOIO5FwLwW7WX4Nh/QztTuSGJqXtK1Qq1HhFOnfx8WCGda
         b22cLh/G4Mux81d4xI3yeJm4icvgoUkEPdcKnlyQRYM6zaWidNGHSOX1SWSqvEIO7DLN
         53vdybgSWssvW98zDO7K2HyTatHq49scXDalUIzEBsHaqSq9Q3bmoRBFiYlAMMvCKQQO
         ycIcIQncvd5frqtvsfGm06Tn63uJAGo7tlsHmFmA0cGXXjcBpPi0IcXi7NWRHfa+v4V1
         hCh+piTeYDGpBJz3UwqW6frE7OKrN1YguIrUwVD1tJWnQaiwA5PoB+QwN6wldhzXDYoq
         ZbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481686; x=1781086486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MbKYOxYNhOubmMTGU6IUo9PxYH2oVk8G/hA/fqgBHE=;
        b=lBF0pcpvwX8ra3Z1aRevYOjGoIg4zQRJG8AEolhGD29Pw3J9ILR8l+ZzXm3XbdGQkW
         CwLw1aNjXhZXmSXWzZNFA86wF0nXtanB4YknLuD/8PojU1v2oERzNc9egJ0IOcbiwu94
         V7FxqkS74PdvHvQb0KEd8R78pCMjsAPkvJwDPnrziQWeJoKPjeupubgxshd7adJ4eEcL
         v3CmKSvW07bK7pvVgu9rjDzGZhmK7xBDh398O9rue26QNwYVYaKNp+cPYNEHeXPILSy5
         8lDxj8OtUgsgfsB4w+Pbr0C2QmBF8wzG8ncA8zLAd43AoZPuoaUffWobRHs/Q6LNZxN4
         22dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vJ138zqG5de5b1Xl7Fc99+actjZ+8s69JhMQpYoeJ0Yvs1mnKFKYDZZZMbar0NWOs7BDvWSpU/rMTQ2mCmgaK@vger.kernel.org
X-Gm-Message-State: AOJu0YyVkvYxsUxeI54fFqfEcBMJRmO6i6mM47+pVG90nZ+MBo3SwsNN
	1Wyh7pF6IA0VGCTnLi1iG+shFn3z8vCHFaZO/D4qkGJ0X6ebMKiqn4GqSdle05oTPUQFz2YBi6y
	QmjZQMVt1IjlpcHy4t1YRZq2XItYq3ITJPV03NJAs2XRX4et50yoTNdBgkKf8KOD8+g1DCtUL
X-Gm-Gg: Acq92OGqZp262vNw3GLfEri/ZWm1tThh0uAd87S1NRDQAtO3/wWF8AETeuL24qQb1xv
	InRuMiO0CpAVth26pqQ26HN2Z9qSogkqIqzv0dU9r5Bh//0Bqc3EqtD308fCFNB3dDBY4A8+7fD
	F/S/M0HNz/iUItX4LCiS22uqz7mZhCvDnu3Vynmu/0PEMta+5m/TNgDktYGX5wH6uLh8gHP9Ovi
	lVEJGj/YKq8/sVmzvViwhtPEeZ3xJMJRK+TZTql/XbU+bU9K/Fz3EIF1FZls2ZRMv6HeV3gVENB
	J/eBMmUqFynOT11syU30mm1dzMr0kFl3fIWtEQUAGy/pPVuw+dSqBIOBOJxMjnbv3nLTU4o7/5G
	Qmdoy1Pof3+f1DvenFFj0Ail7iAqRD6mKhCnxXbhIb0UDlfz7ZSL61B4u1Uo=
X-Received: by 2002:a05:6a00:9094:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-84284df0098mr3089136b3a.4.1780481685947;
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:9094:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-84284df0098mr3089109b3a.4.1780481685472;
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:45 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:28 +0800
Subject: [PATCH 1/3] rpmsg: glink: smem: Use device name as IRQ name
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1293;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=ZmzlMq5l8xv2ijHU4ddQbj2AgHT+1ygitV4sixDeFQk=;
 b=uODXbFl41lOh88Hpx+APw1QDYwaKlhfh0Zxa8Zu0thp6bpBSwbTNh+yBhAa4VTVKYxTtIA/w6
 KDrirX4yQsLCSa/3A6hTTvo+6kc0BU6AlQLCKqeQPWK0iQDRjnC9ljA
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1ffe96 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Nqvb9vKcIXZEg_ORUGMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bMMThrguHpDOtjC82Aq78k56VpZEOaWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX2sz0XXiHpZg/
 yQdbUn3qdUTGKP1+Ri//vOnJZ5zgqIN9Yul9D+3WLYku+Zt3O5rkxx+7KbIb0Lc+DcWylHjO1bz
 +48UAMVjuBxEx3JQoodP3W4+Una1+nl4CLfPY/oKWLON/fHMOZVSsUIEDXmFfJxvcbKBO5TXHb3
 qhUt8WLf2BxHf+l+vLxHUHPnw5L+GKC12xWOgvAMEd6AFZvLkofhSf88dxzYyuxrazF1LgCYNVO
 Iu0UUFA5c+UlQ2aB3tEt63oftFVGdG6uVrZI0fjeyWJx901rs/ZeERuhrl6B1T/S+0L9YIzO0mE
 HZTmpqfGfAWTrsyXH57z2k67PHRY0Hjim0L0WkGtTIps+0jkMlRvpgZFsSLVeDv3e+s9rUQqrVa
 hYVL3DJqCmvPVwhjjHzPdNR+6RCinxdK5I4tiWVxP1hJQtp+L9OSBK+ghhfzCAcd0akiD7TisD8
 FXHf0k1uVT8qf6mZFlQ==
X-Proofpoint-ORIG-GUID: bMMThrguHpDOtjC82Aq78k56VpZEOaWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
registering its own SMEM GLINK instance. With the static name "glink-smem"
all instances appear identically in /proc/interrupts, making it impossible
to associate an IRQ with a specific remote processor.

Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
is already set to "<parent>:<edge-node>" which uniquely identifies each
instance without requiring an additional field in the driver struct.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..edab912557ac 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -307,7 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	smem->irq = of_irq_get(smem->dev.of_node, 0);
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
-			       "glink-smem", smem);
+			       dev_name(&smem->dev), smem);
 	if (ret) {
 		dev_err(&smem->dev, "failed to request IRQ\n");
 		goto err_put_dev;

-- 
2.34.1

