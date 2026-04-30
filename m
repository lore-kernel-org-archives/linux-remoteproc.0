Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B893BED43
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584650; cv=none; b=fnFTTkro3BDn2BH7XAckDyl7DnDPkIe3kVowsAdq2olnPlMZ1+a1Eiduj833Y3+sNrbWru1UZDpgV4abhM54WtpkH7l0W6vsHA5McK7+q41yzI/+lVIvDFtXX137/YTbzcG1vY7bHQPYF8H07D+vNiyiJPQQrnKUvMFoFHRPFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584650; c=relaxed/simple;
	bh=RHeNGzFsaO5OU7c8ibFy6bhq1ZsmwbrnW3uotbi3WGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0CdXukW4J2559u46o6A1+mMEYnQ7exgXzFCDn4R7JKrOTBrSCaxOf5Mf2jB7v3zmYa9EZ8Rv0iAKOgbYFz9LkU1M/fKW8P7pvSZfN0Jpz0T+B0rCWVceUSQpI4Nnhvb5EhCwZ2rQ9HxwGjp5pkuGPS6qAOxkWcnlPZ/s/CXJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpcxtflH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1x+/Cgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpcxtflH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1x+/Cgv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UGIYXo2121566
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4sc59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so2033328eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584647; x=1778189447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=F1x+/CgvbuigcRrplRbmbEJIg6c611fq+OseVIgBfKVozMYSmaZhn0hgW/MWIU4feA
         vmuR4GT0uzF9TqI+XnUFCovQPKwzXcI/YIkClRrxQCo/wYhcJzYNLE0QlfiKps84tLED
         z9IibCZEG5wfPXlySB9HWF1u3DMOWptRxNXsW8b8p0Wqs2P1odIMuwcSQblAhtu8KHEO
         TqlQMf8Rxz4H8RvIeLGqkeo39HGlwMJAxRpdzo2Xtl0rbZIZd353FeLaHE/0VcxB3n/B
         uggNaCEg/19/bqo7F9iofpvs7/u7KL4OJGaQcmEFroXFqG6wKM5Pgsj6XtYjbmNHJ3z2
         UL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584647; x=1778189447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=kD+tzh+kAo0MJw+SpkUhH8ct4X2vy8dpR5552UAxmAMvpHkVXlB8J5J6i1StjldVnZ
         nJ+B6YNv2diJ4jxADdXGy6ePoAUCOYsjoIUoblNub+DTidw/ZH+S72WsvWSE8t59MNx4
         XpfXoSCimho7bNNw79w7aK8P4RnEyqjFOungZk2ktloVo976o9XeB6iZ/zwhubWO/eGo
         WIeV+gTuhLkeB9JccWlz08y3JluKYP1+7XW8uhUfDDRwxLZ1fzoYhWY6OMMUkr1iRYy+
         xwLKIDp3Id+1VAFKPDh+l9i6i43FGH9FhyP6ko0WUth6Qt9eC/qBZBaupKEYU21uinQt
         oC0g==
X-Forwarded-Encrypted: i=1; AFNElJ+0pTiKywwT39IzJMIsYNiQ/WSePUm0F5q5+kZCEokCGyvImtWfym4FJ3KIAiTYcYVfiCBFGjZPMgkBS3WOqHeu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw5hscH0pMiMEpGZHq7ZiGwS3vQ+o8Jc9DyHfKn9XumaTUhSgk
	K014tiI7JESuBY1fMa+HOargbAC3PKYukfpatIbWc3/DIA1lPpQzlyhPSZIBOBaHc8rb3pMJG51
	lXLn8BfFvVZ4bmkf+7gPYNgFuwMszen3QnwONGKi8r8WdhQWthZRrclmQ2ElfexiPQ3QBaoHo
X-Gm-Gg: AeBDieuMUgD3a03iw/jvJha1Ri8vHKLllupHRfT1Prfjn2U55nfm/HoEz+STzxzj++d
	ZU5vRx9bqyKWsZj8wJKalmEOqBda1L4tRmoRkZMnN1aMFZtw+OFUgiK5oNh5NxR1Mz9I05/JXI0
	/hs3AfMhhZ79+I/2bQdFbUzxMfQGL6UXbR5z+VhpwRlHYkHShLVksz6rbhsXI72u80OJw8jEqb+
	pLSRVeOV8o1n7qGrdIEjYG5H1nDcIl/JV4WgrDd6yyvhTjbAc03SI6O/XpKqOQXNW+IBezN6q29
	z3mZtCEIcKCOigKRfmyNnQcDa7ii0s4DYyjA8SPsEdwVn08VpIgoGIh7X83hMx1Ge2x+LdG5Awh
	1UXgypSC7ZMGC1ex6BCufOziM6RfHoy7aAxav8Ydbh8qsbuaqLBdv0bPGckxcCRmDBZzNhJVyTU
	pFLdbMk5AlgSI=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181036eec.8.1777584647391;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZqxgVOS7asdH-xXl3SrQPHY2ZZW-ol_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfXy+yOun+6qMw0
 a5wGPbNjLe7+UCPNNzt6tt2o+AkRJ9n4rvGm0Y+8sRzNF6t7wcC+9teVyY3LhGaeaVlqmQ41Y/0
 yd5nuf/PyGQtcxfM4oBYGKJ18oWAYSBIwHCPSbW4YdzX2NJKljmL5/iapWDr5KaeCu0WfFK6yTX
 e2qZBtuTnGzikkcxOvc4Dw/4xruU7Abhg7fY2UHT9iYiA7Uv3dUwmJJQ3hjA0iT28kKeTEwyb/L
 1sVxhmShMVy6Pa8+pVFhONbRkt/rNhm4SvgsvfUwcNVh18Eaz02GtZDAiwt4MGPBlKBzEV8TCQR
 ja/GEKEgGh3X8Ey4v87SyDwh7hfVvP0cBCJm4TgYlmQhTf0wD7OvoBEnwGsTkSxijuhrzfitTNl
 U9afSYJomTdxXKtiDFUwT4h3KKTftFPi1gq6QtXo1GMGMz2cPgxS0uX37BuBm9uFZmytClannEu
 8T+GE26DJbGfiCu23og==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f3ca08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ZqxgVOS7asdH-xXl3SrQPHY2ZZW-ol_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

