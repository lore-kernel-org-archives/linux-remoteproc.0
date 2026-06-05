Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC11A3154
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 04:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633181; cv=none; b=SpI0nlrGDgPuslUCtsKOkfVpjhrOmjARUjkXWXMDQfe7rExtxR+07Cuva795ocdOO9Gf9pdvydB2VxBg/tfkc8dUIYLzLTWlHwJyFiOdenph2LEST1cUkHsdNpAMp8iXwlEVJ4SlgiUHf07DJHTmjcLfEuvkpw8e8cidynoo4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633181; c=relaxed/simple;
	bh=P0k3sjK1cy2s+oAAkkB7A+jj3/4HX1PN8oxb5Y7vg4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6SGL1R4nkSba4885YlTra6LVWb1T2B+pQLc0jc9F8p6h6yvqBcupmzQB5g2DS++BIAw/Rdst1PAPd2SNlJm9o9PxP+/Naek6R/9VOVFVZZw/YKb6nfQfhloR9DFMxMXApfYfK4LNzIumuzUQ82kBW189EpbpSDwh8E6nf5UUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhjLCCft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdNY4aiY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhjLCCft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdNY4aiY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6550KBNu528667
	for <linux-remoteproc@vger.kernel.org>; Fri, 5 Jun 2026 04:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=; b=mhjLCCftqmNzP3xN
	plYV/tWVes2Whw70oXGGJOOTbQFPUn95wRQuZJE6e1V0bSOGVKDyTSpEb2UccgEw
	DIcCYBtYuNQSrEJ9Zz6XLWZjJWBynUw2lR1yxIptXbI9Bqkn4rNhyPWltfDwTYK6
	GM1b5Orykfi2pgexWYwhSYxhUGDcCPOG6v7j97IcQylhtL8coJig/cctaleJT27w
	/OCUT9weFSmitBXKbRI+1tHjUBPkp76hvmsd08P2rxQYeBaNtU+gj+EGul9xHKa7
	R7VqwxxUmpQ8qnGXZtTK4VHUNzOOql1m03SqdIFH+HjzILHBdpuZ8CLBjbtyAcZ+
	PJAmwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdu5ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:19:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1044927b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780633178; x=1781237978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=;
        b=NdNY4aiYwx2bfVjtqD5JfrUzwBf4vH4r04EWJG0DKp+lmXti0tQ1vQVUdHkERJN1R5
         cbluqnnEOR1SYYoKeiz/LFBz+Hz0b8ejiyBzsmwugZ3b2vZu+4ge/YnLQ+xKz3fiPxEL
         0H592cD654aJgX3ePMlIxbWHSJMDhOhsKF+Z3kiOYD5+NvZbCzknreHiRcmWvdPKSIUl
         iHgW3GpkDUPbgC86AtWA9wCg+pyaSZGf0SHSRRGHczh8Xhvpfbr452iTxO7QrE95IHZ4
         607KHPjhz0OwAOf+aEXH10v9xuxcufGeGZa4A8cHEcoQ3fofHOS8eHmDOIPzzDysCV0K
         6v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780633178; x=1781237978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vRZHUtGWFFmC5/cs/BfJ9BpSx9TWoNBXHZpysMZMUw=;
        b=La3oBFGSFAd3G0mmErXYsw3cmkVeVRqcGRe2G6LeaaHe/4EvxDyNjBsKqXqAX+2FQ+
         7TH7o03WP3p11xtCT6WnzXfxcX62MxICH4c85+cL5RO4jclBX5MpZ0u+GHpX1U70vGfU
         9+YGv/S3Hg9ay4qj+Xwm68W/bHzANCjho7Hjt95gppEkKCsGfMnBrfz28Ug+JBH9kzmt
         dyBOmgcHBzccpRoS2GLhPjZaFiB3+rwfNMB9DQDGkmFCHU3LVk0CDZUEKk4B3ty+QMq8
         jeh7NxD4MnCMqL9v0L+1KXKKaoQyA9hd3RfnouB0CApb26oIfFS0nlEdF3ZcSfQ25eRs
         rdYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mz35ZYVg7tgzd/yXVMIirYb86AIJ99s9SgFaM0kuPV3yvRWm/zpuLUjeGzvfG3nmw3OqsKPU4mhY8LD839GW9@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUczW43slsnD+sjXES7tFOvZfTBcT7qMmWcIUJOI2ajsaqXK4
	yUwubYUGxRY2969OfqxbLx1PiOtUvmBOmSw6Z+mBA5sTE7BHySADRH0gX+5YE0+TdqJiNVuXudd
	+lVNw29AaVpUClTike/cwInl4oGajgYpO7gzlpd5/Gpq6Wo7dssTsmJGJTaxadgqObrpBGrZP
X-Gm-Gg: Acq92OFTqeUPIi9gAdhAbHWHIMqaqeAW3Ymoo2PgMRjrdbK274ix9QGR34069AeGPIa
	ZoknBkuM3McdsvSlJLUvDQ5hshq+/0xWvhRtaGzSFDQloiL/nw7gNJlWcCoepEn5Loehf0cUy2U
	ksWMODSspmbk2SG5ywJ6US8hAaA6tcAbvT2KTLZwCosYCYOSjuhKGf+h+fUiS8bkqeby185kZKj
	JVnkPLKQGaz7yMWAm0NeJNtjhtCnrsEdE1f+KCMOQFHrSCpSDCozo2xCag5Bu023k9jOUxMm8VZ
	OirFm+UocVx9bQfNI6NBz9GrS2Zawv5fXHzwwfdoE3VX2j0E+sXNdj6Okd9yCOByIbgF2Ce0XNw
	pShlLLEwvbeD6/v3tj8Iw56nlmuMDwOUpRbRuwoEF1gCIJBq38PjbCpJAQC8fq/+k1Pp0zg==
X-Received: by 2002:a05:6a00:420c:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-842b0f1ed2emr1678175b3a.7.1780633178126;
        Thu, 04 Jun 2026 21:19:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-842b0f1ed2emr1678114b3a.7.1780633177311;
        Thu, 04 Jun 2026 21:19:37 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm8007058b3a.5.2026.06.04.21.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 21:19:35 -0700 (PDT)
Message-ID: <80fa8c92-e426-4bc7-ad1f-b0be0f405506@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:49:30 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com,
        aaradhana.sahu@oss.qualcomm.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
 <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qlu9sH5VOLvJLEepQdIGNQ4dAlLfzubK
X-Proofpoint-ORIG-GUID: Qlu9sH5VOLvJLEepQdIGNQ4dAlLfzubK
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a224e5b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=rz8_RQ3GBV-xKMBrbdQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAzOCBTYWx0ZWRfX3KyrGA62P2qf
 EPgyLPwRb97mXNtosBB7wZTCaZV9Zj/KV30qqeDhkKhlowdTJo+6ac2Uzev6tRP4CTknTYKCHG3
 PiFUHaJykSFLnjMaST2ruEV9tEM/ThQRMdeN3Yh4OgFv+yA48p8M/KkhiFtdUCEmW9ibjVnZ9Z0
 Ou80Nw6TpD5xeGC7MoFxfvHe1MS/ru+KZGf6XaB8DvuHJRxoi0Zf5g1lYeJec2u81SMH2d36gvx
 hoQm6cy4JDOFu31Bm9W+Ffz5eGPHakTxcNiK5ksebklzMjPyunEEl2IiSJnbRpq8B0p/HeBM04k
 b7H6C5NgTod5Z5UNgdD0fhZ5LgAvQHUVmjII0QnBgJmipVPVQqswgMX4dhssw0RK4T1X/d6WDJj
 kHp4kozZbV3/Q0XMjjvDmR3ploFw9JqQF6yJNeuToEnunnkwGgabmESCE53Si4Jfaw5AbYx4GgQ
 RMdABm8CKc+Xrk+zrEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050038



On 6/5/2026 2:32 AM, Jeff Johnson wrote:
> On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Currently the SSR subdevice notifies the client driver on crash of the
>> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
>> However, the client driver might be interested to know that the device
>> has crashed immediately to pause any further transactions with the
>> rproc. This calls for an event to be sent to the driver in the IRQ
>> context as soon as the rproc crashes.
>>
>> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
> 
> Almost 2 years later and I'm finally seeing the ath12k patch in internal
> review that uses this.
> 
> I was confused when the ath12k code didn't actually have any references to
> "NOTIFY_FATAL" and then I got a build error due to a missing
> QCOM_SSR_NOTIFY_CRASH.
> 
> So all instance of NOTIFY_FATAL in the subject and commit text should be
> changed to NOTIFY_CRASH.
>
> And as was noted by Dmitry, this patch should be packaged with the ath12k
> patch when it leaves internal review.

Agreed Jeff, I'll rebase this patch and change NOTIFY_FATAL to NOTIFY_CRASH
and send out a v2 for internal review.

Thanks,
Vignesh
> 
> 

