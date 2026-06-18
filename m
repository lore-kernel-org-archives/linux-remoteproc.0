Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130F5280A56
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789063; cv=none; b=Fid08Kmc2Bgp6sb3MjRKue4q5I0+o0xvx8Ri6H/8CXc2Vf13JXho+9vfLH032uYYvRPYn7JPgBK1wWNytB6dU18fO5gFpH7p6bvahdU8vq+6kvuODVG+ujy6VQdap08hqERhnZztcEYovZFtfQ4n6oMe7yh9XruHRyriVNHvKg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789063; c=relaxed/simple;
	bh=EjfJ/ixJ35QHyIg50lTriMaQBVhrwn33zrAlbnoCLoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhpvFdRFyZdv3G1JAaGJ8Qz7fV5lRiAA29hYahaygfj8RtZ7/Crmq0ZtFi6gpbdnpAXUJzQR/9whZFSu1sncNkm3clOPiFjfRfxB1ZHx6wcJPUAc+xLXlkwQ4OuN10R/Avv7Im1+no60AuBw4yuEHkJ2Yhg5kuksS81RqRcgP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Di+XqVZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJe8KD2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Di+XqVZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJe8KD2t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICuwGd1780794
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=; b=Di+XqVZ8b8ncmrev
	XmwFtP1sVz6e5zBdLBnGBVuIZV6DNCOAq4vUIhCRQQ58Iy6AtNYyOiIksOVGGHpD
	pV+FXivTZYh936bDt0LwvagaM22T40J25XzE/PK45B/7PgVy1d20oJ2grWxnE0yc
	ZwqpvZoL1A2s5K1kaMN6vt4vdHE2gUAmuge6j4bMkpZrZaHNQisuCIWCWpSjlaSk
	bec0VFW3761AhMd/TstjA74qSSADSvNKj9SMLjuaclwywidXiw77AbhV2cDX55Rk
	F+tNiTJuezsVd4r7sL+x8IzT2LI9ePBe8yzjtKRu0jQg2b1JDgjlivrM7cnEwqCu
	wYLHvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a3gkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 13:24:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7270ec494f6so44001137.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781789060; x=1782393860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=;
        b=KJe8KD2tpD5qchD3cLpa9M0AZGhnGr9mHJbaReuvBFxr31g+wPIaC/AB7G8dn+tKue
         UAt3l7BUNBm/FGKcxytSiWLeadU/+6lxT/6jaNMpqujag7SzYD8aw2ZQpsZIQ2nOjLbR
         pt75/B1RtVPVYySxwHq5DPdPEnp35TdE6z1SIHaKYSeE8Ua1R8x3OmHZsKfhUw9DcQxn
         TiGhQXelAE8X7CmaKYTFDacpZEMHK/V5iEEkJR1mtlZEqOXyVWMmzsdnrXQzHEPuqhnJ
         fdr+9q+b/h4eB9wQDhxUEtWZt/4Fao1VshvXg4Rx49QhDEjqeWHYsI5qDpHVeCekybAW
         KzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789060; x=1782393860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3iEw7Y8XK5/7tKSn+yPX4FO3YXCdVSFl2Te6p2Xagk=;
        b=kGVniEvUHzrq7GsSG1vcgIxNtadTY8jjcdZGJPSaHMyUo3SRAZzibvtHmF+RRQ0vpN
         lRl0DeWC3KPEMvslzNM32PBH4xxYjQXI4Z121w5jsy3DZEPgKjZ83ANUEgjmxI3I4H8C
         CQr3uS57iZNYK9pcqnd3tCctTMFRei4+tvVy+3QgbR9YSo7vFUoDmtMmNspV6bGrb6ge
         eC+z8pcG5Wq7YgzDE067RSer2KSsKae5pJoAgXTw7B+JQnEetH4ScysXhdmxfwPuB73A
         PKILwJFue61QZJyaroQstNjyeFhf7fDo+uSoOc+J69F1ncOB/jEpVdBH6y/5wOw8KUOk
         UtsA==
X-Forwarded-Encrypted: i=1; AFNElJ/O6b/8RxG/j3xg2oULkMj6HeRZZ2xMZA3dMCk1mZThy3a3wlse1yrwIqGyhdDf9cjzfK4+zCGnx0VxuGiwl+AM@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJmAs/fnpJTWvLP+QieZRu7eTl7Css9GjWQnQctSamsGOqQMI
	DFSed71+utgVOman14o4ZE+G5dk8MMyGE79BdkKacFTi8zH3shKwMICT0mXIevBgwlgrlak/Ir4
	zBCW2q9ZuWKgv2iYCzalHZtTvuLk7MxTYXcO5aCDBCTSUGxNS3rfhRxVSKXvCjP2Wdko9rN7Z
X-Gm-Gg: AfdE7clRd9xldRT0gu9HlXOV5buNN+pOUUcNYoLPqd1lT3GsZeIbfHpOezX/KMrW+nI
	g9MG/51lpPfCYeGaMe5ImOLGza65WeLOeLVNp62DNGdd+nnFB/54sEfeM6ktgvyDu0TOWghOHbA
	QUIQmnzkuaY/X/Lk/4r/tBgrg3y3T7pJrHeTA/4/c141p/86oB59tf5fXaMzChGhX52gslq7sB8
	guQKF+bT58kXYXH4ggcuEpqKONiFD8MUOjmZrWG0oCUOJ45l6hE49g1zuuMRcujwUGchkh4ti5g
	s/bVbfegrQ8t8e4aNree2R+DbUutPcX2KaFLJk55CjyVe6vNGerUDUFMwdK/8X9czitBTp7sQw9
	A0N9X3ba0B0oqXG9JzYSsF/E/CF4pyRGl4Gs=
X-Received: by 2002:a05:6102:334e:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-727d735f873mr567431137.6.1781789060421;
        Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6102:334e:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-727d735f873mr567417137.6.1781789060032;
        Thu, 18 Jun 2026 06:24:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c07a48c7931sm90091466b.21.2026.06.18.06.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:24:19 -0700 (PDT)
Message-ID: <79c1dda2-153e-4b7a-ad18-c72db1cf4a00@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open
 request
To: david.laight.linux@gmail.com, Kees Cook <kees@kernel.org>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260608095523.2606-33-david.laight.linux@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608095523.2606-33-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33f185 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=1-iA5IryhlbGIAVKO8AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyNSBTYWx0ZWRfX7X2pMVz5sZmU
 H76MMVsBFd1OdHsJ1qIh9QbRfP5Q03JFMrJFwNx2Nr5ayVzQkJ4Up02e55MuFhcXAUv/RVnfKg4
 mmqRQPStMdPs+Q/OlP4cv6VS9ixBmYY=
X-Proofpoint-GUID: kjYhhshm9VeCOTC5J9UN6Ee_hNZERA3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyNSBTYWx0ZWRfX468LFmfn6MwF
 I0LSAXG3ed2X6It6wtyFpmqPAN/sElchreHkCiE+o9WIAZ58ZKyuidQuCZ7FtwzNAB7aBBsMuP9
 ekDOjW6gxx5n4TyMPDJfSnU/MLlC6Hpg2P1saPZplktXjrD0SKterAKySjC6UjZ/gXUOTKbwX7W
 RKTYncNRgiwYiSfLMsPVbhHw1oiUfAYh35ICbdjmC2LgD2r+vUvJjWInQVqfOAwwkAbfmh/hFNm
 vVpWTJmvbkgcKrin/0BMIQCFnbm8RNyblUyPe1Vc4sPOKC19eHATdMacmZ9ffSO0do16Z+NGBGw
 LPV1SbItCyd9H6mHCvVRzixmjsgaAMa9AJxGBSyAJeF4MR3+/yG1wNADlOUIS/F0pHSuBXgDzvK
 6c9wY7E6/QuFPKBT+4Ig9kteSLXfassVwKt5CgDmtyWlxxtE/imSCMRYQp2ciBiPiGZeitV9zr5
 p7Q3Xc7JoY1mPxiX3HA==
X-Proofpoint-ORIG-GUID: kjYhhshm9VeCOTC5J9UN6Ee_hNZERA3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180125

On 6/8/26 11:55 AM, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)
						     ^ GLINK_NAME_SIZE


[...]

> @@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  				    struct glink_channel *channel)
>  {
>  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
> -	int name_len = strlen(channel->name) + 1;
> -	int req_len = ALIGN(sizeof(*req) + name_len, 8);
> +	int name_len, req_len;
>  	int ret;
>  	unsigned long flags;
>  
> @@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  
>  	channel->lcid = ret;
>  
> +	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
> +	if (name_len < 0)
> +		name_len = GLINK_NAME_SIZE;
> +	else
> +		name_len++;

Should we perhaps do something along the lines of:

WARN_ON(strlen(name) > GLINK_NAME_SIZE)

to prevent silent clipping?

Konrad
