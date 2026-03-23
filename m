Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D989324B16
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275971; cv=none; b=Nq5oNQmJJZVqsvr5PB6OHWpDv80Hh3vK6U6LBqhUYUTkhTfoB5FJ5bJnvKmuwxBYNbZFXlQP/7TVpjeXrqZppHmpJRm89GSXmgZW5omUyxpyq6vyTsBiYComLewMUtV2sXSdL7ahTnTHDxJnyuNaXXzUxaAAKw+TQD5ug/WTr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275971; c=relaxed/simple;
	bh=pqVgpg17eJHPRS2YVvj9etxBbvKB5WNQ8xPwA2cEbD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpIJGj+swe2iJPtlHSQ3Fciw/VKj3ueeMVy+ULU/GxGApn7oAnkrNTFXCN/QnfZIJnZj5xghJy2Mn3/w+jzBQGuut7lZVyo6MLfZA58jrkJAM2Fx8ChGfifwdxiCUW8xkgpCVUOp6cKDOFG+pXZlGXX3T70tB5GoCOHt7k6W1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCEqIwQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1N5+nde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCEqIwQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1N5+nde"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgD6T122749
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=; b=FCEqIwQUe0G4B+4e
	zycwwl8D0aVorIfQgKi2f+U0Ie1Rsmy8mJcPQv9ta1zUjIRobIXPRX1FB+je6tFy
	lWD6YNGpm4ryD0UGclb1tO9bnvUzmsbC04jtc8zf25QkqKIzZMGBKlIgof23JVU5
	sSpH/Ka9AkItoR6abfTE9BQG/H6Q0/w+x+D1FGGxi7pQIk803hOvATDR/hHCEi9f
	P+qb9sVlsJrjZgOZiR/TEEvqsf79rCjhVZjXMDlHCecg6nKC8iaSqLczdOMn24Xx
	/eyehRrNiyyTuCjELGNSwoRzYFbrrH8hkneo/UREupc1mFc4RoKAp1GjUlNbF9ZO
	HLT3fA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrk38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 14:26:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60274569cf9so513174137.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275968; x=1774880768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=G1N5+ndeJ7JwVVx2VpHJsfJZK0gx9AvL8rU5LbwsrR7m9qUKYDkGFLJ3QIyvaAUzks
         YnIbT7aI9h85AloGbwNau7ScT/gmagkU3sN8MOg2I5XH9tsQSMyntkKQKEe5QGKZgvp2
         3aRh5QtE+kGfZy+nfNCT/73V6nEZA4vc+ulHqVzul0zNk9s4+O7Z38bPVh+YVLcpx0eN
         OptR3ejpMnAdUkFpimO2RJwdYuii/JMwo5svqS6ndQ7rho/KDafm9+AsSm4JsmAQvUP3
         JEhHa9K+UgBHm80QhRte99864Qq6+bNuENMeWxKifiLoZutSff7wSXb2k8McDQ/Bl8KL
         /ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275968; x=1774880768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8MEwGZvZBzKxOvXFYbCiIUql2m67G/KfJewSSa/tAY=;
        b=OdrFy4iOi8KBWh/y4wXvUqkty5VYLWZfrItQs+7PbhM2mb2SJCoH4UGPdb4akH2NDe
         dMyekxyTZf9CrdxplYNm9D5cXfWtgwh2jhF3ddOt2FmDt1ZWVZpSJ1XnJOTHwp2ZI4Dl
         7/F2juR2VU+3Bmwkmis90k7uQVpOZNDZJxV5PCa2TwcrlRvbaEfLpuARnX1MUAlxK8QE
         OGioIHpbExuYP2uMHe3kgDOjaYgtXfE6w9voE2FNV7YEyFa811AvyKfxCAlkE9ihDxOf
         eVFJDmmyTtKp6LUNvDrJSBQjXY1bDpvAXJRPZFBTJlVHOmtV8LxW1f0jmJaRSVko/vN3
         g6uw==
X-Forwarded-Encrypted: i=1; AJvYcCUQlaO8h3EsWtM+lVWjRj1njzyzgMp+tHfP0v4hOE65Mv0w1zz6eqDMuWbArnr5rv3xukWmQM9dqOENCmHs+fct@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pypO7wN8lKD/6vYcM+cBdITNXsQ6EFv4x02r8XdXsgtV7OtK
	qBD/SaUBCXhEzE226/C9vacCot7ttn48rTdHWzhuVaGwq86wHqsQCrllzq7liF7S0hfslkME0YH
	RGa2sjt7iy/nvtlkH3fvML5uatk4m4l2gOJRmZ/IPUDud2PQJc3PWkEAVtgg7PJUv1DL8+qbf
X-Gm-Gg: ATEYQzwzF6k/OVkozMW+5rUZdvSJ7mkJjc0v3j+CNc4daOf7GRRpGXB1DXdAHgGTZ7k
	ChP7ewJlFqdy9g4eZs01DvxnVqah/sK0pdasJRlIYUkEiRkrxVOBnK43f8GnFy/6l1t/OAEx4a8
	4U7oeCN8COy0sKTY8Yzp5ndUvnyHQ/BEGSwlUL5jHwlp4UyrVe63iXm5Kkm6rxuqHtW4tA4OlNO
	XQNmTcdAGiSUHV12+atTQyZx6+eB/wKW9+zGsvH6NDk6xHrRL6rrbfSmXrGAPYB7GslNT9ff+wt
	STN2u6/DRPH5dyITFNBqVF3vpf16lJV4ekwywcFWHXpzmNoYdlz4+LSAWjTgmBu2q0CsoSTAw3Z
	c9gSZYNH7YEVVnciR3+ahl0dFnX876C9I7yMZvmmCOgEQ7RWTkxRIgDbwxGyZwKiZa2iSTqMTYp
	snKxU=
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933692137.3.1774275968518;
        Mon, 23 Mar 2026 07:26:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3910:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-602aec08323mr2933671137.3.1774275967928;
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm398492366b.31.2026.03.23.07.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:26:07 -0700 (PDT)
Message-ID: <2e55bdc3-54a1-4f18-b9ad-fe03f21fc4da@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:26:01 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <28d63822-f191-400a-8005-5185dd480dbb@kernel.org>
 <acE-kAi2tkPh2qie@sumit-xelite>
 <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c5b49aa-7819-44c6-b5f7-19ec780d73fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMSBTYWx0ZWRfX7jiGjXVxcmqE
 PdiiuVDAQQ7GqlSCIH/F1mYzJAVsyVqE67wVn0tj5Z2ou6dkqnOBkhjBB5JRLEoslLgXcSfZJVy
 U2rE38CChDE0Gjr2OdXnhH7qzxY/18MOuj8LlwVYxra3hlD/JHPIC4sPUTF5SA4fZ+1C6S2dFxX
 E8Iq2rTSi/2LcFLc0SCLG2Np0wzA/YMTKqqAxCEZFaM1kd917DvBr2MyiU9rWgNOrQQYYcxQEUo
 MTTMQ2E061wSzKOqkahP8UbywgTdkh/7GLiueqd9gZA9QIpFOEnav5cWRFFX9wIXRzIh4RDVrob
 IpjF7+OeESQu+Hr/RyEdY9yySIxZtE/wguu/hBL5Igzs8o/GDjPDqNaoFk8UjXgsVu45awBohbW
 89skKmSN+EPM8RezIrQwyxJLJAVDM+yLZXnmoDLVP0sf9p3r75K7k9DUy4UwmmRY7KviemExLFW
 7mOSLfLODpW/g7PlBeQ==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c14d81 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RZWjG5IIt-miciyuqOEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 81qsmkboC_aN2bsj4VHTZnawaxoN_tCZ
X-Proofpoint-ORIG-GUID: 81qsmkboC_aN2bsj4VHTZnawaxoN_tCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230111

On 3/23/26 3:19 PM, Krzysztof Kozlowski wrote:
> On 23/03/2026 14:22, Sumit Garg wrote:
>> On Mon, Mar 16, 2026 at 08:51:16AM +0100, Krzysztof Kozlowski wrote:
>>> On 12/03/2026 07:27, Sumit Garg wrote:
>>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>
>>>> Qcom platforms has the legacy of using non-standard SCM calls
>>>> splintered over the various kernel drivers. These SCM calls aren't
>>>> compliant with the standard SMC calling conventions which is a
>>>> prerequisite to enable migration to the FF-A specifications from Arm.
>>>>
>>>> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
>>>> support these non-standard SCM calls. And even for newer architectures
>>>> with S-EL2 and Hafnium support, QTEE won't be able to support SCM
>>>> calls either with FF-A requirements coming in. And with both OP-TEE
>>>> and QTEE drivers well integrated in the TEE subsystem, it makes further
>>>> sense to reuse the TEE bus client drivers infrastructure.
>>>>
>>>> The added benefit of TEE bus infrastructure is that there is support
>>>> for discoverable/enumerable services. With that client drivers don't
>>>> have to manually invoke a special SCM call to know the service status.
>>>>
>>>> So enable the generic Peripheral Authentication Service (PAS) provided
>>>> by the firmware. It acts as the common layer with different TZ
>>>> backends plugged in whether it's an SCM implementation or a proper
>>>> TEE bus based PAS service implementation.
>>>>
>>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> ---
>>>>  drivers/firmware/qcom/Kconfig          |   8 +
>>>>  drivers/firmware/qcom/Makefile         |   1 +
>>>>  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
>>>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>>>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>>>>  5 files changed, 401 insertions(+)
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>>>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>>>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>>>>
>>>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>>>> index b477d54b495a..8653639d06db 100644
>>>> --- a/drivers/firmware/qcom/Kconfig
>>>> +++ b/drivers/firmware/qcom/Kconfig
>>>> @@ -6,6 +6,14 @@
>>>>  
>>>>  menu "Qualcomm firmware drivers"
>>>>  
>>>> +config QCOM_PAS
>>>> +	tristate
>>>> +	help
>>>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
>>>> +	  by the firmware. It acts as the common layer with different TZ
>>>> +	  backends plugged in whether it's an SCM implementation or a proper
>>>> +	  TEE bus based PAS service implementation.
>>>> +
>>>>  config QCOM_SCM
>>>>  	select QCOM_TZMEM
>>>>  	tristate
>>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>>> index 0be40a1abc13..dc5ab45f906a 100644
>>>> --- a/drivers/firmware/qcom/Makefile
>>>> +++ b/drivers/firmware/qcom/Makefile
>>>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>>>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>>>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>>>> new file mode 100644
>>>> index 000000000000..beb1bae55546
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/qcom/qcom_pas.c
>>>> @@ -0,0 +1,298 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/device/devres.h>
>>>> +#include <linux/firmware/qcom/qcom_pas.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +
>>>> +#include "qcom_pas.h"
>>>> +
>>>> +struct qcom_pas_ops *ops_ptr;
>>>
>>> Same comment as before. Don't create singletons. And for sure not global
>>> ones.
>>
>> This pattern has been carried from the PAS API contract among kernel
>> clients and the SCM PAS service earlier. The clients don't hold a
>> reference to the PAS data like underlying platform or TEE device etc.
>> Hence the need to have a global data pointer to hold reference to the
>> ops data structure registered by drivers having different lifetime of
>> devices. Also, the PAS APIs can be called from very different client
>> driver contexts.
>>
>> Surely, avoiding global data is always better given a better alternative
>> is there. Do you have any better alternative proposal here?
> 
> Why it cannot be part of the context?
> 
> Look at your API, e.g.:
> qcom_pas_init_image(). It takes struct qcom_pas_context which should
> contain the ops.

This would make the client have to select the ops. The whole point is to
avoid that, since the client has no clue (and is supposed not to have any).

What Sumit does is to bind the ops based on the runtime-discovered
mechanism (which needs to only happen once, given we're not replacing the
TZ at runtime)

Konrad
