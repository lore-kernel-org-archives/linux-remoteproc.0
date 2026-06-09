Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148763F20E9
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000598; cv=none; b=TGSFlWZgmrPqwnW21Q6FKTgo8HO8RSKIOdPDsGiE4VmbjZJzlo9uEnRm/Ksf2necruNAIr8N9Nza0P787z99AhqnMjXL+RJQquOmfLV0VCq4OqKJbJ/F7UaGO0Yd4SYhOm3UxImoIbSa/c/aVqFBKq5iviwE2CJDrPDtAAwWaGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000598; c=relaxed/simple;
	bh=+m+mpXWx0qfpLvIco65ulPyu0TncN6QNo9fHPseAIRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDuZ0/GoC+cb4Nhtg02QxvVoztXzyXhbVtyQ2n7ZAkL2NageE+BzlfoyZ65hlHTagl69fL1PPN2t9AoiTr4IhOkMyKyN9FlXqi2vdN5hMysT9loQVvqBTt0R/ZzTBXpSz8ecqsrMVW20vko9WDGEV7mjuw2Eb4KgGesbAHi4oXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeRapUd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPuRCQsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeRapUd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPuRCQsG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xPS12287598
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhkZeVLQqF+
	ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=; b=OeRapUd9EzSWMLpzlpNY5I36rc4
	aZbI65x6bZGyAyQqODhG4McT2gUUUP5CnNbEY7ylj3Mrftm1kJ8eP8OP/7Dw8eCc
	Qx032MGBwDMFS+bueFpLaz6utnJtuwzaJ/ZvFeGiJaVt2fd29dxBZ5pMIBkdA98i
	fNVUWJQIUc3n/tgWOeb+CBkXkJbezUyy09O2tM2wFAMr2tLibjj94vIh5U4p9rto
	eUEXLn/cPbps1s10YY+/tjKfEtjoKzBoui/iI+nadZQGY26ssBQ5PuWirVwmRO5o
	+X3pDIm88yz/Ob5+mbs8vDHwHIoH4+HT39GkYhdf4adjhkoD/vh4QheKUnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rtr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beff6b6e74so54527375ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000595; x=1781605395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=NPuRCQsG5FtPL4lMGAsOpcehwn/bJsl2+48pUeBufMuT8JY+YdBqmLBWnrvzn/8+p4
         itNmIwKAhi2RTpAjth4bw9v/bUslwK+CiL58jpPyrslLodjnAvPBdM7vGa87JbSsR7ii
         XMYfYJ4KZJrYTvUhQDN4/HQsjh8hexeajGgNJ9MZIeW4NvwySPvWfQvcjvlLk/qKpIvx
         vFrXuSLL9ewxctXw4ggu/SfnrcE8Rmf0vx4x97EL9RJ9o/hlE4X2CqvAmx78c3v29GiK
         m9suj7FArE8ykTkn9CqkTatc29E1A/FioW4xU2dBVwUI2zCZQNjiMePpmuGJH0tcQ3mD
         F+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000595; x=1781605395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhkZeVLQqF+ONSXF+cRa8H02HY1dCnDBy0f3fSDbGfM=;
        b=d2pgmkKAIt3M3hHvcO4kd+netxagzfwKHchVHc6DTmei4hL1r6x1X/8OI6HoENUaxY
         SAVvwjYXlWv+hyMUClEgJd07BOhRLm123Hs7M1bHvzv1VkxCH+5T6YtdNiyBLkBXNKTw
         YaqbOcD5v4s+fGeXeeVEJMun1lQIwUnZINRBd81WoEjP/lU4SYHKwjHwdIqsnKOR3Pcl
         IA1D12GrVvYTD6uEDAUKThMIcTggYfHZ4ZLPDaoiPhlZyi/BdLe/+Ttpd8S14MlsIXHi
         8JzmpCbQFuMtcXwcWdVvnQ2ttQu4B4ITFDzh1xOzRbUdBKLMmgfR51KFTfLsJeZ6+TlK
         l0cg==
X-Forwarded-Encrypted: i=1; AFNElJ/lRxL0/XdcE3/RxtmJYV1DbZXBZEpfQXNHbWKzqXE1d4K+5+VPowM/OJ1uvNZv6FU+m2NZ0odA4oANuJzJ+CwV@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUrJYdUjmyTB34w0GeRzsm6u2VckfEwWoo2z7QSKoNpnjQ458
	9CvVHjb/BTT9y23easlD0YGj3e/OzYvBTFjh+gCYn7blCzezJf1rs93WszthmLp5Sp2EhhwUOk0
	t+dCprAI+0pG/KiIZUwRfVNlu0vTPIo3FXjes0cDk+JSH5o3YropYBsGDbKykmlahEad2Zeyy
X-Gm-Gg: Acq92OGvfN7u+0yym3xshRvlAThsEXxTFxYAEHfnNWO5Dys/vEiRAwjLtCJUGp58zoB
	GhsMh6WD0R4gZX8IYDqF0+eJ8zHpURFKMrb9GSfi10Vq0khhexDnty0f8oP+9ZnW/Q3+5zSJCL1
	eW+uMKQPiHsa1wco2ZI9S91yHeLj4mYydUZKXpY5filQ+WQoCbYxNMFjRKVOqFiqCd+tUS7ThX4
	r3Qy+9gw4aYXFIu5SPZBRh1H95PHbLHPJzqjoSgXTnuZsNdjdouzymPMOtjP4kXAtrphn+YVuU2
	9dNpTM9bDoQZp161hEjGgsE8/vN4d2RwSiLpl75TKOZdUE2T8cfMxdBoyFXuNgFvgvY7lIZUXOm
	pnexeZyLGE2/w15gFbEEUV5RsG5iaABG3II/vShigouCBe5+8GS37FJGutvo=
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911695ad.27.1781000594844;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr173911375ad.27.1781000594271;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown
Date: Tue,  9 Jun 2026 15:52:53 +0530
Message-ID: <20260609102254.2671238-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wqoYdW3TwHjeLjfqlRXdqWqVq6_RO3nJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX8bYfMV/m8mdS
 KiCYjZYkHlpxGKA3nMwOY259Fk2cntzPQNWAPeCy2w35rzVWXj+vA7UFTnZIu44eHQ9KXWH1K8M
 PQ4/p37kuXnVVlXG0JBz1UcEgKknwMvagFURBOCGpLdPVR4vzYLhnRYBXSHACY5yrBitb1ZE5Ai
 BACzKR8jCcotTEdX5/iODxnWHIwue7w3Xzcqn61AqzwH23vUg/KY+kbWUv73DnlQ9z7CGazDoMM
 2NBqrTyzdT4GWNMmogZ095HFKVCuDQv9MS99UqeW+mrSZzE+zG4byazvu/BrN/4eNnhkflX1Neh
 mJeQGcf/PSxeSNal8uN9H6F0aSRaQx6O1YD1OxwBN/aXuw+pLVivZHAn12OebQrWzITd+CfVczp
 mt2EwGu9IIUJKSpSRc59IbkTMaOD892hn1guopsFd/6GQRwtejSXxGT9x2T6cI31eebYc06Zryh
 /UvYXcBjeYfyZyIK2oA==
X-Proofpoint-GUID: wqoYdW3TwHjeLjfqlRXdqWqVq6_RO3nJ
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27e994 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=i5RmczF_S8wiUxY00XQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

When a DSP hangs, if a graceful shutdown is attempted during sysmon stop,
it times out but sysmon_stop() still returns 0. The stop subdevice loop
then continues and tears down the glink and ssr subdevices, which
unregisters and unmaps the memory regions attached to rpmsg device. If the
remote still has DMA in flight against those regions, the result is an
SMMU fault.

Fix sysmon_stop() to return -ETIMEDOUT when a shutdown mechanism was
tried but the remote did not acknowledge it.  With the abort-on-first-
failure behaviour already in rproc_stop_subdevices(), this prevents
glink and ssr from running their stop callbacks against an unresponsive
remote.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 44b905a7e129..a29084cf7145 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -559,6 +559,11 @@ static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+	else
+		return 0;
+
+	if (!sysmon->shutdown_acked)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.53.0

