Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205EF3A5E67
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=Ia8C6dm9f8m3b9ueNUt1xiQLYyuuZ+4XuNDLXgKaHbMliRVDabOCNnhGQi1/xFzlCGJ1kNhaVJr63d4swF1Um/wM1M9GJ6KofhdZkaHT5teY6sdjRo+6bZs40DsFzfQetaoftCfrVPU248XgkHxgOyLVAQZFtIQ0PtmwB6n1FsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG58Ff4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLn6zhut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZG58Ff4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3tq2325485
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8894570b58so1575779a12.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=IZG58Ff4FSz0xPAqXt1O0zOxFaAtOJZN9IWe92nAwZiPZFjlqg1nbrFbHttEcUNU9h
         6jNoGhV+J/yNfrzUEPILSBDguBszwwFjfNnFc9A2XxM81pxpNopJp3YJAf1MD5JDgCEA
         qc9jZ3IetpNBJ5FteRGNGtBCi7ieYp/p7vcP9Djop8UiiDtew+Pqv+RLVKdAcanrSLVR
         ax8sD6c2p2BPl/cpPFDBJPPaEdKa1ueytlXTK7L3e0Rs0hjwC/qmQzpwmotWY1vX3x27
         L3Y9n969UKSZ9fVEaC9VZjmXEyIueej8S7mRzFuGwKDKJW5BD0apojcOkpFjRLvynm0X
         Hudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=g8p2XhAbNwWcpoG2t7AG9ow2kgJXm3gQkTawBoMrxBOlxo3jxIeKRdv9iBLErJGC5d
         hSDPeXaWZUavWG05S5R5n7d844fegqU0Ncml8ZMrSiw5z59eAQSQjcUH4WKhcrEWdIB+
         sTJoKoieCZ9sRmtXwQHPsB6Z+Gj08y4Q3KT6y1TOCEsjRBq6m2+fygRbFNR844moyeVF
         M2OnBkALS3Dd2TvK1IIVgD3AZixAAggK6NzHR365WjLJgRcxTj0cPhDobCOHZ8H3UNjV
         FAO6dKN0XWment1fIP6TKIEA9mrfzsAaGEdtw3Zllp0GcVG2glS9cfKKfQxHHoI3NbCS
         Z1mA==
X-Forwarded-Encrypted: i=1; AHgh+RrzWWEmhuEcAJjDcpyw8Oi3XyzhW9N4wQExOhDKTTSW4l82Nr0uLvv0VAr47P5xsq4iJu7SAwEtseg5rIni/zRw@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEmDqMhvN05HT6VzXHU4n2sbIio/xDCf3gsGItmng6s4jIQ7e
	iUOPhRHqWt72kL+OS2mZV1J6hzvxbtE6MoZci8WJmSuNzVYa7iIPgUg7x9VxP5WDfIvDysTcXBA
	FDlrYF9QQwxR5qXyY579TT/UuxPWZBqtjtex3srn/al+LnREq6m3Nv31wv93zsu3kYKeC0EVV
X-Gm-Gg: AfdE7cmDCxkvuFem5bfHsjNY2Z3XG5Ku2EcJx2w4x1yfczDQXf3jweQ0mRipqBEOdY/
	V1TeuMkcqjQOzvlMltpdb71/uc5Mm1e4gVK9R9dI0UDl0BIydybPjgxh9rOMNqXu5JF4wT4iLat
	DJ+ERrwdZKUSITCjMFm5N7gs0nXTtL9qfK7cwnthI8DV52ZoS6+8bP5czjRusWJwwWsw8DKpeub
	Mh7N4g9n+R1u/Y26dCpJ7sMBZ8dn5k/KYnFiTm6s9YiVG99DDmNizXbD4JjqqHMJT1aIosxsNnG
	vf1j8s+Mi6Qze97muHW5BK8pTVGQCeptdNStKN5GRJMqNsQf8w0qKHdfKz+fsyT2+lCj/MriDgE
	1aB2iewuWWXidzWc1z8JmNQbDB3dHKb17p4P5yA==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745254637.15.1783280484696;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Dp4dbdsouzMIBuXKkI5kFY0IxNZIBADn
X-Proofpoint-GUID: Dp4dbdsouzMIBuXKkI5kFY0IxNZIBADn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3u1fv53mRKxG
 Ko1O9zcZHhIzoiy2SoYyCX33txtPK88Uu13UOhdNihDcy55UekwHSYz59pZmRT8oveNPf0RGEjE
 h7zpFsYjyCW033KDbi6nefY65wZVqyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9TimUN2jWQAV
 B4mpMvHQKBqjv0HUKpL/8IjaQrz5axBfN5bK6MTXY3M9rbFqrng5U+eUofzxonyYWrJ3ENFrDLR
 KcHNo/UdAbhZU5IOzFXFRDqJbhaVgtbYZTZ/EOpD0jqBW15JFYlfr2kp0vUj7fETk9W0+Czg5Le
 B6Pn4LCE+PF1/pRaWJF0YeMW4wZ0VxnZqIZo95/hOU3IM7a1yUKfe+ZMOoYKhP+DAQgd5I5HFJH
 +eblIapWmTZ2msIxJfBhXOe7xfw/E5xdtUkv6FBexpHKAArt7fvcTwinMfjF4fjIDp2qL3GeD1a
 K7or2VqgqF3WSooc7tWwUn6y0jOgjZJicT3nvDOmvSCFzd13nWd53FUEpUdwoLGLdZrYIwBmRyz
 K3PIp8mxsnLhRFsatvzNRArhwBUz0kgVblwo25yVWF57P+WvRMptCgO0D0nju8SPc5tuRi7XM72
 aAbSwVXZAjO5cf7e3Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0

