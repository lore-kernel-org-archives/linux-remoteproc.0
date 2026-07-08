Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36174433BB5
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509397; cv=none; b=kbyCwKK1icP+uI0RrRsnOyzhw2vN6h48dTjRjzOtTk8d47aTQoDnX+gtaGI5BJUabW5YQxQMshyHFqXbXT1BTrv/G7oQlEvBeT66AMdvhO3fMdMQBykBM0qQqx+Yyvb+yL6qaeicuObcLCtxGvRquk/Dv2Zg1wILWdVfIVi4hhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509397; c=relaxed/simple;
	bh=T30Tq3ggKDbteLsy1U84/TctejsfGDMd3r7y4dsbJKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsHhiO/7smtM6F7/LOMXi21J3Hgi2TI1KkHfxm5fm6PZjOd0b8wzuJR4m0TT8XDataQgOwGiGcjVBvbwKyXqUuTMsWOjPkpDcr8MtqfvWc7kX6r68j/DD05Too23ZFauGg+ETKMph+/gLuKkLZ+CpMh6s3ed0AjJ68qdBVBESW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2/TaqbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOey296V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2/TaqbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOey296V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889EAd2007689
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 11:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=; b=U2/TaqbCIsltRNoG
	6R2vFWQmOOo4nxA9fs0usJFZvVlZKO4NMm6JGrw3EEKYgtCP8XG3EX95u2gSbG9n
	WrGURB0UyME5Y94Xw/x2Iy/f/AbcsekeeHocqX3jaKHxR0NA6x0xVZVzppI8MI+2
	ZYcAbfMPoTm0IplYmOUw1+I/IrHXE4+yEmEy29KnoqBc0fi8M1z+tL4iGalk1THv
	t3GvIhZqrzYAJCIhGKvyTc8bkmGALsjHLHxy4Esrb2MnbMH+evGXHI3rMXEaVD/v
	VHROZSjLlAq20VBV6hFUbrGgtwROuA9qM9uWcTISkYCxFoAdMPfKLGYR1zydD22Q
	uOJFAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u134x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 11:16:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso16890925ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509392; x=1784114192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=;
        b=DOey296V/ke9qu0N091Op5Y3+jnk01kgxFsOvQzmJFRAtn07qmm2zlO4Vx3hskiWbB
         VUgAF4KUEosCO1glrF7Xh8Yw3qSKq5BslBW+Hxd4Ws4jfW3FHgSjn77SJJlBbY2Hxio3
         ATfv9vM6awUVQ4it7pKj2uA1FDf9GaHBZqHScuxB9lSz56XgwR9bj+H84hMr0bqKLdqA
         EevNjDm3uQoSMZjaHOHwDPcI0bVDs9aMij92Lh5zT4YIb3sZdiuh/nk3LmVfKMG/MZn/
         2xZ+QXhV4KM+A7P5EHTfV9vkxs4bKesFbLUWLpYZXwDD7SCkafZ0RuYWJG5UpHyuYxtv
         fq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509392; x=1784114192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRFbIA+uhZJ1/kqwFGK6iYRh+oIYC00DEy4Rs+x4Vlo=;
        b=azIKJmE3GmdCxIy9+ea7Z0dkz7+MFFwRvWWKCAYS8ZREKQOLkb869lKNT+4eilSFlP
         hdZ5mk/AZdVQ8NBL0wxxTTWPmYk/g5eQMi5p4VhHdLn5AU8geQiPpSPD2pQtDx4PwRM4
         mwytDO3/miB4dFG8yGI0MNVmEdFjC2w2Z3bDJSbrx9erLurKgEg+Jj/kZTl1LkFcIY5Q
         oIKe2EFBAPThSageghsfEE3AG4HmyS7FU66j/4HxQiIoToRLKAhKdQfn5C/YULgK2F1g
         tWoS4ZAXZRUYN1mH6S42k6p51OUtQTfUq1h6QeVpTfHvXpWb8uiAOj5Vt6R2ELjCnPb1
         I1dA==
X-Forwarded-Encrypted: i=1; AHgh+RqjVCkQcq2CP5/NcMzKzHo23cbb/3NJfUHaW4fakkFovmZiJu8q7PC36NDOmn/vOGzgK8udouZcxJ5xZb+IKVB8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3B5kscV/XJzpBieJRzsZviesdmtBmuEnZWV/vsa0TPGBiHmZZ
	DFzRWPDF9KNRY/oJL2CxT0xRwvg8Q/GbuvCoaMbe6loQ2niFgORe4G0VxbfJ+XNVL1BkHGKcSfB
	vZlFbCZnx45vzF9IxlcHuqAWAkxwirUeZ74TYU+ktH1eEZIGRMgTitvQYSMyazERzCsHfPoQo
X-Gm-Gg: AfdE7ckS/oW0nmk6s/AvEjIcNV1eITIvLl/I3xMk1o4kdFqMfi2F00gjewZ2+fR4+5t
	s8D+/dWwfjcqOWxVomhceai5pG2ls/jbbAyTu1Xb0+gtWw0P9426T0ZygFHlnTYau6MGvOdhpHU
	gngHIawFTG/veerJiMu9AtJriODJhC1vF+4uKJ4T89eDzOxFTmixdwXv2ToCuI78rqedNH2swIk
	K7+CkWyDU5yrQTD8JEkCk3xf9o3g5JMT8IMioczBajkwU79AYu0ncMa7ERgVCqeFs0+TFlB6Hbd
	kM/oyocjpEYNjqehQoZDC65xssWg9ybRvJfutZYSg+7WaPftQyygKYJ9vR+pMBn3AxiotakYgM7
	kEKhk9910/5/8Py/eCZNChw2C2sC+gRqi2cgDz9vv
X-Received: by 2002:a17:903:1b4e:b0:2ca:d151:382d with SMTP id d9443c01a7336-2ccea3a3cc7mr21992445ad.14.1783509392015;
        Wed, 08 Jul 2026 04:16:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b4e:b0:2ca:d151:382d with SMTP id d9443c01a7336-2ccea3a3cc7mr21991985ad.14.1783509391556;
        Wed, 08 Jul 2026 04:16:31 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm26753585ad.0.2026.07.08.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:16:30 -0700 (PDT)
Message-ID: <d0993d41-a770-4104-afc5-5a6ec02f742d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <31d10d03-8730-4735-a83b-957b750b736c@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <31d10d03-8730-4735-a83b-957b750b736c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PzcVL4KW0sqC2U8QgBw0mSf1FZclExkH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX6AGFupKi0mv2
 J596qC/gJqCBTDAP4mzdhDeEDGauk1tPjf2jQu3p4Kq4pbtu6EksuIMolaw3hwVdtyTM5BLieXV
 LyqRwjmqWjcvt9t5ZCvL3mN6ZaNzXh4=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e3190 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=I6ZbpqCI0Cxx4O-sBFcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PzcVL4KW0sqC2U8QgBw0mSf1FZclExkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwOSBTYWx0ZWRfX57X4lwZYzvV3
 Z3i9/Ib8apEIFm5GWLlO2hGpU0cGdTbhjFurjFStFQVS/bR3wyPChKfgnwCZ0DYEjtl6o1Hc27g
 yGzp2cd3ekQtD9QGVobH6OWvTaKANaphvNZwKtv3WhEluusbrOVmqgc7W9sPpljmUqZ0gCkni70
 ovA6oYwqbcY+T25IHKkCzJ+xLJmuxKDzrUmg8SzebxtmWtF1n4wYUMZEL4NAVaCbbrXsRBk6C5O
 2AYb0hTDmCkHdSrd191Nh+t5SZmpTaiS99kkmWzxE76EP2LioRG56AiKkqiPbyAtpW1paH3GzG/
 3uY33W5+l22tk5hN/cvREp19lo1zfxWLeDsF8x+UYQGaMish4Qr9fHvleXb6dSQnBZLQ8nXWCvK
 OgtCSh8SBGnjsljbHILjptVWFCET++Gfl9P9o+XKmy5r8Tj3/Qusiym0/pLxma/92LQ8/9zYBFA
 ArOvo19CsTFxfim0yDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080109



On 7/7/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 06/07/2026 20:11, Daniel Lezcano wrote:
>>>>
>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>> need to add them ? Can we do that incrementally ?
>>>
>>> That's what I am trying to understand: why the implementation uses only
>>> the selected two devices, if the modem on Kodiak supports others. How
>>> can we find out, which TMDs to use on other devices.
>>
>> My understanding is that is an initial thermal setup. Gaurav will add
>> them step by step while setting up all the thermal zones instead of
>> sending a big patchset. And TBH, that will be much easier to review.
> 
> Not sure if I understand correctly, but bindings must be posted complete
> now, not later.

Only TMD endpoints connected with a thermal zone in the DT are 
described, these cover all required kernel-managed TMDs. Others, such as 
battery current limiting (BCL) and cold temperature protection, are not 
controlled from the kernel thermal framework. Will update the cover 
letter with these details.

> 
> Best regards,
> Krzysztof

