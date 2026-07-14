Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF31FFC59
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009108; cv=none; b=HWeaia0StyqJ+XYoyKPMWHwfsbnHtnjgpuch+VrCwUwGaGbL4vNPiEVbb781Xvbn0E4Jh+LjEXUQ/vx5TF2l//UPsLQKl1AjkcUOxLu6dXhFeJ04YaDAVgMe5LNxTxzwFC1DYNF44HZBPA3Mv0OPxYyqeP1DMEuhKURMCUigrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009108; c=relaxed/simple;
	bh=cTM7Utma1mPa9YCMZME1aqbleG2xe3Cdxz3itTeROHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBfP0mLy61qzzfx9pSqn2il8XZvzijBKBPeXmxmrLQ5YamgKjUgEcOJnw5Ax87OGqWtMtlX+rL9g+IN1zft0J1GFvDdRfrpzaWyynNv0JVTtEgBgsMjsF76qB5MW8aPjSHUi3Gg8BL+w8vlGBWWEymvZIdp0Ss2t8t5s1AjCtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J28O/RZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evDxUqZF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J28O/RZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evDxUqZF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38WoP3417737
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=; b=J28O/RZgF/YPJQV1
	aglHk98mJ6cpDy24zHGyWrw+k+aLlciKTMYce9Ha87nVLu4UN6XTgWNUr9KdYDjU
	1oIlFkmP6saEFofCayWYt/eGvntl78dmeMEOW6YSawpsAPk8CRcY6SQ0KG8ksqWv
	E9t7yEfTBHrA8qxNgW3CsbgY5rl0d9K9zbvG6qqQNhLk3atpD7NMBLTAb9k4Suh1
	6pEFYsqI6p1wfRfROXQH+aEgtu6Y2r6DjMBLvAGLG8RoA+8s61RC7XITYW4N/ta7
	Pi3QIyB9BITwHWVl4CcOVzMY9VLZmDuumtRv2UlNeLulE7y4Xt+iD45M4tJK1NF9
	RoX1zg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j28b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 06:05:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so75511715ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784009105; x=1784613905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=;
        b=evDxUqZFzkpokTZtD4+xQGn+Db97k7sxREKV8DcJMNL/IufrXPtIApjantBFKXrabV
         184ubEVX2VZ9vOBWN2CwJSwQ0aDmA+BvQLBxdCI0T2BzwFY5w63KJIeHKKpmaNWffFhZ
         mzJNM24+uR/73WAJ2WaysrdK79Jeo+jx9+RfAMYgZgTD2fDLnikyhlyXLuDjqeBayRQh
         YR8ovtc7w4OCKrw2GUO4F8IkFQS4aKntZuHb1pUNca1PH8mbeb5us4MNyd8C9HTcrDQV
         6fjrTtaBQJoQ/bcPADhhvom3Tlgv2piFj6Qy5E1TjqpAGewtaVV5tHTW+lfvVn6dc+b1
         kAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784009105; x=1784613905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px/Dv3kC2JFKbDyK26yHPSuPkeKhCj+WA5l+NtvoHFc=;
        b=hUXgiwJcYthFABrDJ1CanZWYXgz2fH4otyJCsjrMlDqHIa/sN4KZqUF/0bLaLWZ0eS
         mMT+WZT+M9pmoXOAAOHBx5DNL/f9OsFu6GPvdUrJKSF/vAU6jUwqel+XlN2VjsrnxETJ
         0jsZGp1I3Z58fr300YrV4WuJDkr1ftr4qPvutTnypYMQYPJXQbQtAfXqkyDY6eQj1vg4
         WecIc4YtUxLyA3NNcGmn0i6xk0iEcYXbdZ86BxSXf4JhD2AIiiJvNdctKMxU7lUIcIoG
         1YRF2XTxlJD/rsgR9PXPLjUTVnPZJcDyVHrVKR3XO7iTTHqSHzMpuNu0mf7Y1DEytmFr
         5urw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbvv/ZaN/KfsK530UdYiS6pUGIqrkctOLN4OiWrcfbifqXg+86NDfPUHMsWEa7O6G08pn/bxI2xVOyhzRbhM9J@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyMLdtH+/9lQcmpH+UVuAiLbW2r8h2eoxZ8h56fmrBO+ALTYu
	EJfJA6LJqjtDZ4ozMbzRkQbdcfAdqQ5TBhL87dPHIsA/shSIj3rVDqkZB7KQnBYqSeV72PCASQr
	1yRbS/6JDzPwPJbV/oqFM2DS3ui1KjpoSbejjlNm40QFk8NNRg0alk1bLf5RjjpxqU1fmfwv2
X-Gm-Gg: AfdE7ckCPXBT1hTA6LbkFQnbjtAelnVDNNm6pLibVKdJVNjpodcuHIBN9n7eYQJbjK+
	8zHL/29pH29LehDguOTq9TJ3kWtBS3YkVo7zKlD/fV2IwzG3KdL9flOKgM9dNu28Jl7940Ashvs
	aP0FUmuT7P1jCq4+5b2AB4Ns150LuTm5D3F5F7lfbWm1BBBkZ1FFUbUQUSS5ou72Ew0pjUL58PD
	Y36LgRYNJto/s6eyz5nFmcE7SwrGvoPTFrU8Pa+Ikz53ItOqRCQxE2pC7QCsynDCakrt8GioTwU
	JUIjqInzpJSWmQFiLCmO4rdoFThjTYro/eS18q9TPBDVwBHRDzwP4fsbTflEgSByfp4Rh1/8qOx
	63JaLa/BGoga2VnSNlKVfGr+PI/GIEpmJv0Vq5aJO9w==
X-Received: by 2002:a17:90b:fca:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e1ae26793mr840938a91.12.1784009105280;
        Mon, 13 Jul 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a17:90b:fca:b0:388:1927:fb1d with SMTP id 98e67ed59e1d1-38e1ae26793mr840911a91.12.1784009104777;
        Mon, 13 Jul 2026 23:05:04 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d37sm894492a91.2.2026.07.13.23.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:05:02 -0700 (PDT)
Message-ID: <fe3ac7ae-8aa1-4ec2-8735-423d58eb9fec@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add QMI TMD based cooling support for the Shikra CDSP
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-cdsp-v1-0-8402e060809e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfX5BMtZ0KpAAf0
 +kURfbeB2qYIsb/oojPqQtXldf3VCKNqN7oKzwj9DyoEBzjEvZR40gSXtKu1Grpxp9DHBPp7Met
 pV1C8l1JqfNCjnG081m9ZXqQKvnfJmI=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55d192 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JVEoc1XX2nbpnddg_OYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aZentMVvmbinORQub0r4i5dFNpUHRs1X
X-Proofpoint-ORIG-GUID: aZentMVvmbinORQub0r4i5dFNpUHRs1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MSBTYWx0ZWRfXzKr8devWBLjx
 wCjcR6REYt8/tTX5VKgzzl93cybf2s4PDIAnCPmsbJ9YFKMPoaEhVHi9Rwx3F6nZIYpIOl5Osdn
 vAisxj0L/QPv0OH6qURaBmtuxF1qg2haWAJSOxKs0v9OR5lzGPL7pFtfgz6LxtSAtJ8d7jqPcK0
 ihePxL2LYkydpcuBEayuzxzhnc9V4HHdsN6TPj6d/+ZWwZVW0+X1dW4dakJEskZHU9IR1exzhoi
 5pzfO+Q178l6o0FAPdPqYEMTebv8kOUmD2SEkmx8ThR8arJN6LoZvW5NbbPksXVDwINfLSxWCLI
 Tr9kXS+yQuAt5JWTKcaAVFkeoPRSeN8/bbcEdBAh2PDqDeIP30ENrDziAvqDUPWusQCm6xc+w4B
 fDxpBKB5+9CCTIylDf6rnagGtMTbOiJFsvf52Isgwrb2ggw2QJ1p7DQnX9be3wM3yHrbZPVqKIo
 pyQoc01E+A06sRx9JfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140061



On 7/14/2026 11:30 AM, Dipa Ramesh Mantre wrote:
> Unlike CPUs, the CDSP does not automatically throttle based on thermal
> conditions. Enable CDSP thermal mitigation by adding Shikra CDSP cooling
> data to the Qualcomm PAS remoteproc driver and wiring the Shikra NSP
> thermal zone passive trip to the CDSP QMI TMD cooling device.
> 
> Depends-on: https://lore.kernel.org/all/20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com/

Please wait, we will send v5 version of this series.

> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
> Dipa Ramesh Mantre (2):
>        remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra
>        arm64: dts: qcom: shikra: Enable CDSP cooling
> 
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 21 ++++++++++++++++++++-
>   drivers/remoteproc/qcom_q6v5_pas.c   |  3 +++
>   2 files changed, 23 insertions(+), 1 deletion(-)
> ---
> base-commit: 22f1a2f6953d5cc0a82845a69a23216158325d61
> change-id: 20260714-shikra-cdsp-5ec6ba6c51ce
> prerequisite-change-id: 20260609-qmi-tmd-383d30e1a60a:v4
> prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
> prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
> prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
> prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
> prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
> prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
> prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
> prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
> prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
> prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e
> prerequisite-message-id: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
> prerequisite-patch-id: 465c1f2dcefe2e2ffae3ca69296b6a9ec50ab830
> prerequisite-patch-id: 26c4e460ce1ef4866e140f38dd2c26509272d337
> prerequisite-patch-id: 4e76c812c7b98d649c57f5ace80cd42079cfe754
> prerequisite-patch-id: cbbdcc54de760873e4ba1a7788c14968ace935e2
> prerequisite-patch-id: 94d3ad39536d12a5623b148e15aa27ecf1abb209
> prerequisite-patch-id: bb184f20916f11fde0cb9b8b3fe7cf6344c58ae3
> prerequisite-patch-id: cb215c7070ab425fbe181785b831bc69a23e4078
> prerequisite-patch-id: 4fa886dd7f7c65daf1f22673adc35a527a84d609
> prerequisite-patch-id: b545487026c8f9b853c8b925b9fb097fb9987816
> prerequisite-patch-id: 4fcfdb3d75dd21f93880e70cceef9c883f9cd58e
> 
> Best regards,

