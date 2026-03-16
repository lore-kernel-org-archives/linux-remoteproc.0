Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29926B77D
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773702157; cv=none; b=bg27ZhfWZNrZJ0wMKsP8MVBx3ReKLZyBiv9g29eGwDh0c+rqktyjQ0QFBCDlUR7DjNvhCZO8Gof3YIZ6O1CphHwUZp/MlXABTg5AJde8Tt5QIW1PIEGFv/Fbzg+Umc1R02fWAGS8HXF10r76+hsgdc3Vgzdk8Af5pKp8kojevPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773702157; c=relaxed/simple;
	bh=mfzcGstDrFyFY2Sl2/fGkhRvhr57tmO4LPQdDoY0lXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcL4eeOOsnBsdxvxofJsQaGPkAZMtHwrj8UMnh4c3RCgVr3vR8fYpejyNP9FQhBsSoEn3gcVQIBaQ9N/1H5WABOShR4zeN8AeU87shfqRMuCXZfLYLRnH6n4OxPEyR2wUPJqlDvU6D/RmZ3jRMVnIuYjX/3wyBjQxdjpjJ2fcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9KT9F9e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqvaL92/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9KT9F9e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqvaL92/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GIlJXW1428820
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 23:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlchTDxr3z3qRdgb94yGA2QNfyjLI6qsy4bLeJPkpzo=; b=M9KT9F9ewLJ/9dch
	etaL+nfEl6Ie44a0dNC5UrgWkq/vzzUcnI2g7lXs6rShD5R8IQMxzZIfgk8RY0DT
	IPjTjn8inkoF61vGENpB/n08ate0ITMtWwRGjjsUS/0qKseDdwum2Cg8BYLjGM/F
	Nq6y2sJoXlA1OwPyS1HbRgUmhl8SOUSVtJSAzMjCGjdBRJmax5gnLMMtC2XYytuM
	7zc+F6Tby7aAbkJ6vPNWLYM59K4rvn69Q31Fxcxa+fYKyaqLoOSsOPb4rDDTG73V
	zZVM3UBFpN8WgSxgNn5x9QhdoxcV3wMfgLSk+RfM/vGGCMe+TDKykn47Yq7tgSMP
	gIH4jA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99a93x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 23:02:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so4216060eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773702155; x=1774306955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlchTDxr3z3qRdgb94yGA2QNfyjLI6qsy4bLeJPkpzo=;
        b=MqvaL92/EhWQiuQUo4VMDUYa9jHMJrtemrtwcFjpAGHq+ZUZcPdSKWtCaGmwjLoDZb
         KFh2X04MxlFd2X3QGlRS/yBzbfmg7XWabkNtzvRBQRXLE7/8Pm5OXwIe9baLsPzoWTJW
         879HyfphWEwwEyN0QP8XtMp4DSEWnPn2z+vb5psoHg7u3SxRyiEwCU5z+dgcANy61rrn
         ZAmKY8DZmSdFGjq2dfjHfv0U0k6aKz79R81qOgY204gpbdIgCoLpz3Cp2jy1o9bLwo5Z
         /dFA9iyRUy3TtofyMxvJGTnDzV+/ug9dQFd/lY4eRwPrSPw14JtBvWpdDq51oeCvoHs5
         xhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773702155; x=1774306955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlchTDxr3z3qRdgb94yGA2QNfyjLI6qsy4bLeJPkpzo=;
        b=UbR9H+XwfqqLGpOaOJFtJRmc5u3ZOYZ+EwcAWu2Rg71R1FieVib8QDv3P83Gi33p4O
         2doz5tYWk3wGKDugXAMU4fzLUAiJv9CbmGIxPc4l4pKUJwFXPW+0/L7ocfYZIsARZF5O
         /DIs86gocWGARjdyo6WMFF/bKBkKMSNHzjypz14gwDxWuO3Lp4CbPIDTz81k9AqdfDCH
         jnN2iIsMEUJJl3yAJhja+Iinr9AOreqxbdc/BKcGF2NVKm8Eq7REEiUaebIahK75L0KK
         zngVucyTwST+IR4BQ8tJKSG/o8QOOCCo+6q7mKH+UI00Wa4U3Ssk2ggqEoFNuM8uY4st
         GNqg==
X-Forwarded-Encrypted: i=1; AJvYcCWqmzdpgOJty2NJWDLATsM9W/C9GaiWTHfsV7iuqWR6a7droqGuOPiI22d+5U82rjv2S1dF+hrBTFdADDuTavJj@vger.kernel.org
X-Gm-Message-State: AOJu0YzvySIQofh3y8vVTgO2xDxzTdg44y7j2FwWlGNVO7zJGTFN72BY
	Nk4qGPCVp3oosWBYS7qczOy7WX5SpIgLeoy6bD369fQZgwch+NK0u//2QNOwZrianP9eb2MINJn
	rDshC5NJgf4vJjWiTM95/1ddrFozkJ0PpdhsJLepyIcAJuXVp/Wlxs+JxtFTSI7lZ93Ih4Lvm
X-Gm-Gg: ATEYQzyUZc2wz+NcvtVnmI3eggFKOloTvSGdyHNBciUGLRh/Olz/wfnzliwyraoJDDT
	C/EgNwnuJIzLDMVtNZzltlL8R8bTgGgqR4UclT/HYgDFYcTWpEpWSFhyhRRctzRCRf0jqNYJ1rR
	h9BuopGgg+h0ob7tBg4BjANUG0v3s1ayPMVP4esSkybeSzMq0n3MWt9Zu4RsV6fxHuesJB17evb
	waMuRJTNRfaqssxmzNgprXMLAKeJ5RnxGklp1QmUAIwrpF3gMyNTGiAk94fZrEI+abzxEHGp38G
	Xu0V8e5t9w/4J/wWUiZac20GSW0RnwlcoWw6dJ/+mmpElCJLLVFoD20xGxZn6RRa3SmI5oJTEkJ
	bsXBJa1KXCv6MMcyNl/2CgZ34sjBKBVrDMjfthJOupwT2JCyze5m/hGH8OgPykZAWqyYu94ixL8
	Anp9gp
X-Received: by 2002:a05:7300:6ca0:b0:2be:1779:3289 with SMTP id 5a478bee46e88-2bea573d146mr6203995eec.35.1773702154740;
        Mon, 16 Mar 2026 16:02:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca0:b0:2be:1779:3289 with SMTP id 5a478bee46e88-2bea573d146mr6203932eec.35.1773702153972;
        Mon, 16 Mar 2026 16:02:33 -0700 (PDT)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0bbe04304sm9795623eec.23.2026.03.16.16.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 16:02:33 -0700 (PDT)
Message-ID: <3934e17f-a2fa-423f-898b-a0d89e69f564@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:02:31 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Garg
 <sumit.garg@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
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
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <28d63822-f191-400a-8005-5185dd480dbb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b88c0b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_eXaltnX1kRmSEBu75cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE5MSBTYWx0ZWRfX8+bDqCwYyfiq
 3Rvw/I/KKVzAW9ZcLXO6NxvgM0+sROiU8DOhIrGesMjZqpI5f3+bXZzc/1ZfGYjhyJIOzHTWA96
 oI8YnwxttRX1+cRu1jkxZHOxMcp+MPU03pqCIp0AEDUNVHF1ceQmErYq60fnSbb33O0mY+FAMGS
 JhBYj3jifDRiHRGrA4Hdy+VghLvefCIiATwfxSqKAB4JFJ9LJm9SYfu3sRyLlF21jX5ddMGrCi9
 /7nXzsmM/BZG715sKs5E2I+aylww4Xph2X2wdTjDivgg0p6G3VqJ/TqI2C9RkCFT4yvzytZkPc4
 m3+PDv71/iJV3DgWpn+Z/WM8NNOmPYF9XEh5Zm+nUqXFO9Fd8VgEXt4Arywl386LOC0cZYrCzvs
 gL/sJok7hzmTiEF76VuBbOucV/MxvS0b2W33BJAzP8CQacgmTWz2Eg8Qx95iYDSogfKOMenRV0t
 +zKiDoF9lm4dAFFk7WA==
X-Proofpoint-ORIG-GUID: 86oDjYQrG4XKticZ0XECpqsTwSR_4flG
X-Proofpoint-GUID: 86oDjYQrG4XKticZ0XECpqsTwSR_4flG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160191

On 3/16/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 12/03/2026 07:27, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Qcom platforms has the legacy of using non-standard SCM calls
>> splintered over the various kernel drivers. These SCM calls aren't
>> compliant with the standard SMC calling conventions which is a
>> prerequisite to enable migration to the FF-A specifications from Arm.
>>
>> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
>> support these non-standard SCM calls. And even for newer architectures
>> with S-EL2 and Hafnium support, QTEE won't be able to support SCM
>> calls either with FF-A requirements coming in. And with both OP-TEE
>> and QTEE drivers well integrated in the TEE subsystem, it makes further
>> sense to reuse the TEE bus client drivers infrastructure.
>>
>> The added benefit of TEE bus infrastructure is that there is support
>> for discoverable/enumerable services. With that client drivers don't
>> have to manually invoke a special SCM call to know the service status.
>>
>> So enable the generic Peripheral Authentication Service (PAS) provided
>> by the firmware. It acts as the common layer with different TZ
>> backends plugged in whether it's an SCM implementation or a proper
>> TEE bus based PAS service implementation.
>>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/Kconfig          |   8 +
>>  drivers/firmware/qcom/Makefile         |   1 +
>>  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
>>  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
>>  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
>>  5 files changed, 401 insertions(+)
>>  create mode 100644 drivers/firmware/qcom/qcom_pas.c
>>  create mode 100644 drivers/firmware/qcom/qcom_pas.h
>>  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
>>
>> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
>> index b477d54b495a..8653639d06db 100644
>> --- a/drivers/firmware/qcom/Kconfig
>> +++ b/drivers/firmware/qcom/Kconfig
>> @@ -6,6 +6,14 @@
>>  
>>  menu "Qualcomm firmware drivers"
>>  
>> +config QCOM_PAS
>> +	tristate
>> +	help
>> +	  Enable the generic Peripheral Authentication Service (PAS) provided
>> +	  by the firmware. It acts as the common layer with different TZ
>> +	  backends plugged in whether it's an SCM implementation or a proper
>> +	  TEE bus based PAS service implementation.
>> +
>>  config QCOM_SCM
>>  	select QCOM_TZMEM
>>  	tristate
>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>> index 0be40a1abc13..dc5ab45f906a 100644
>> --- a/drivers/firmware/qcom/Makefile
>> +++ b/drivers/firmware/qcom/Makefile
>> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
>> +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>> new file mode 100644
>> index 000000000000..beb1bae55546
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_pas.c
>> @@ -0,0 +1,298 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/device/devres.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +
>> +#include "qcom_pas.h"
>> +
>> +struct qcom_pas_ops *ops_ptr;
> 
> Same comment as before. Don't create singletons. And for sure not global
> ones.

I agree, no globals here please. 

> 
> Best regards,
> Krzysztof

