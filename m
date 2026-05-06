Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344892F28FC
	for <linux-remoteproc@vger.kernel.org>; Wed,  6 May 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043694; cv=none; b=KHIsavpGQqkGFoG02oAK2Fkf/I6Ktusk7hyknd2Qu76JlLldwyqFEcs7GADsvJeBGMl81h5DpTnHW7slc2g9+GBIi6nV+rqPR+ykyCryWtAvRB0gJk4NSbcNZp1WBGWmsmnL8vI7iXhuQ6r47r5OIKaXlFs+PB+GQaR33jyH7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043694; c=relaxed/simple;
	bh=M5rRC01HPhlQM6fuxNgD03mFH22vVcDQpyAjh2XtkPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcFNKSmFWEFpQDOX1snh53oE+0D9PcW0Rwjwzd6/ik9bLa4/4nzqZ6dNvwkgu5nHkYePn9PDJS2RmovHExawBNZXXuUV8FpgTPasJvYOevR+mniOGxZ269+zIywIrMUb5ikXYwnyl9dFEv9Z5pb+7blkwhscRGNFPkH4Qi3o99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OddCglJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0qDy72p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OddCglJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0qDy72p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645LEpxZ3475613
	for <linux-remoteproc@vger.kernel.org>; Wed, 6 May 2026 05:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/UkEw7Yq3iZ
	ri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=; b=OddCglJ/bbcCSJv+p8v9qfHWT21
	swToN4ZwwNGjRo9RjGSUTFJmSES+uIKQCRtGYfZVKEw+6XHk4/DQL/Xhc023CAtU
	eiBo5HTd1rjS/rfkVj6nEAbUN3UAXEU4tlnp65w5QkYGphwTMc8H5wYXAf14tBSJ
	xy9n1dUL1CJBJAI5DpeGvUVtQv1A7e05qo93bu5eIVNL2RFRLcvWPK23zhRNu+8y
	ihlTCceyalzWFyPHdKc3M4xnFZsEgoUCP7IjZiw65vJAQ77wz5+WWNODjFT92Zul
	Xkvygb9Cm6YJgDGK24AAak0nTS/iuolX6/jVg7pp46JKeEiYRRPHFrFh1mA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgu51g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 06 May 2026 05:01:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-836d0184333so2863453b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778043689; x=1778648489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UkEw7Yq3iZri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=;
        b=Y0qDy72pifYOXSSokXjDu5shbESIlWOOR/Ci0PCTyNu/rXTwNfduMzmfmyXd9w2psb
         gXMgGGH/Eh3CygzIHgVcTUK0sN78EBhQpnNUJWvJ5ibe9Sb88oHc553lUWiWl/NXHmiK
         zPAErIpOhsvkZ0MH5UVHYP1KzD8dVSy8i+la5vRurvoi1PU2Vx3y0RANmRQ0u8Ne6zja
         W/OFUhYr1Wd2SYlgpsuBzHnj5laFcQOti+tktdcm1anw1HNWiUoPaeBi9G7/2EWH+hsQ
         6THustwtrRiAvB65Tzww3V0lAZtBVJ5speNnDkAnYqBQWXoXNXQUrPDl+rfSuTIDK2uD
         SFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043689; x=1778648489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UkEw7Yq3iZri2eJcOzLGwWjXD8rv0IhaRuy5ZE9IUs=;
        b=kbdYya14igsZHShXdbRKgTb+WcryfzKDk4i9eskLVp1qHigGLyHCAa/nGxaJNEXsr8
         OemFlCTlOdYdYQzCYFM1lSIen1ZC3reaVpz1z0dEMGZK1dde6c7An/784fgnWHFH8LKz
         I4km+r/DdZtlxYZ1w95aWo/O0zuAsoTYNttUixAaQyGN0zuj4Y0avlE6hoTyiHbCrkr4
         OJtTssm12RckPC3Jk6MXFgAMeVQP4t/jtM7qPq3HkRIHFp+8LwwJGz93m45JMxQPExgY
         CV2WfBtkQpTBxAR0prkQng3hcQXmYsOtedTbtOYC2orlW0oZJP542sirQS2PzeXdcaAJ
         zaRg==
X-Forwarded-Encrypted: i=1; AFNElJ+00Y1jtAKwO43jOgmGVQBpvh5H1AOQ606DVMDo/156cErrmscScSSmhQkGPSDTzbcXxQ+/n5KHD97Bud2khjLk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BRRLfEDLZZKqPNSsS730L2HuM40wl0msX3Ze6Jd8yCp4QZLA
	8cC2v+N9JdXJqW+ASL97ET871dciUS81uX3RXEQPL9p331BFQR81zy+vrHnV9w8hBNo863QmSYC
	vVzCYzqfWb0zducgLU+zhM/OJ3TXeLybK9VG4D+w42Sj4llzDsQZGB4FO+4htpOKFI5BkOh69
X-Gm-Gg: AeBDieuPEkpasZAVhmP3cRfgMUCC1783JAqAmDtiJAIFGoEZUqZ/EA0+HjTWzn9bJSE
	R2CLewI3Dt5xWa7i8VP8cfZdg1sd5Sagylxr0Ca6+41Vgztfq/e+FLNClG/Cz5doKzQlfjKSE2c
	2Y4G8kmZKrMA6LeFS9pLOFi2y547T72FNyKYIz2Q+eHg0FKN4fQa66dQ+LHYGz/HksuuwnPu7fK
	/B2BG4j5qpyLOVsOhmZt5I6MtAySVcmr6bWdYaAvx8PJWZCROCP4RA9WJivr4W13QDc+p4vML31
	mLqv4R5kgj6GxDdRYWzC1sCcES9AgtU0HSU7mu+C9r6QT97BnQQuuQH9Ih/IFjIs0i0eB7M+Pau
	F2p0WczwdXIgEWiKOQq+j+UJTtPiuq6biBlJvcKs2ZBJH5LpfpZ1ev6gN/rg=
X-Received: by 2002:a05:6a00:4293:b0:833:22e9:2cd6 with SMTP id d2e1a72fcca58-83a5bfc4ae9mr1704106b3a.16.1778043688862;
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4293:b0:833:22e9:2cd6 with SMTP id d2e1a72fcca58-83a5bfc4ae9mr1704057b3a.16.1778043688264;
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcfc0sm4891620b3a.42.2026.05.05.22.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 22:01:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/5] MAINTAINERS: add rsc_table.h to remoteproc entry
Date: Wed,  6 May 2026 10:31:07 +0530
Message-ID: <20260506050107.1985033-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZZbTeruovjlkmVtHYbmCTWljbVVrvfhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0NiBTYWx0ZWRfX2qaC4ZLX84qZ
 94BBnu/GBUaPhb46K/X1Gz05UNv9HwbOeBcjz5oMHZgBPvc8ECRvIzPePjbAFqoSK56J7VyVtBT
 C28x5Yoccp+shAniE6emKwfdrBS3YHrgRP8LGfyyV39LmFNKQMi7+CdOjDt8ncOIw3m+amYS50W
 jZQFm97PeBngu/rhOP5xRTdLKc9Hu6hwE3qSj4YpufXQfr6opT9h2WM7NxXdfaNseKy9W23K3x1
 CZY9aECiWSHoTaZ/K5wAF/IkQQAROhPkpI/qpLH6KHg3YdEo1Xbv8kh4NFn+L6uLUdKsgkDrPSJ
 Mceb0CSpvsaKYh5FJICOTBHZhBA+R+FwFLl8nEG1DJHueG6FtsFwRONJsw4z4V9+sQSzs9yBC6D
 oPZYTNCXGPyvx1g+LLNYTm4qSBiBlMkmw6mKB5ZXhY1/ItZzJ860CutWpq0knb89MoByAjn5eJL
 Zm40QmBjS/FOzJxvYww==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69facb29 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ob-EK7KtVxQGSle2nTEA:9 a=ZXulRonScM0A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ZZbTeruovjlkmVtHYbmCTWljbVVrvfhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060046

include/linux/rsc_table.h was split out from include/linux/remoteproc.h
to hold the resource table wire-format definitions. Add it to the
REMOTEPROC entry so it is covered by the same maintainers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179c..b2a6d108c662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22507,6 +22507,7 @@ F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/rsc_table.h
 F:	include/linux/remoteproc/
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-- 
2.53.0

