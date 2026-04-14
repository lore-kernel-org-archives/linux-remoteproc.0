Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7328B4FA
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142919; cv=none; b=X6sFiSxKtQLaiIxDc93W+St0J2l8XD5f2krbNOiwVkY7F/f+V0u2M/uO9/3Y6Zr5NZ/x8x6Vkn6iGvKu9rXSWLffvGF4SJWVTQTj94t/qfAop+FEdPMOhUgxJn5L5RvnK3S22qGMjzi/BhoPHXN5YqXl3sMvsXcmVDH44JOoZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142919; c=relaxed/simple;
	bh=QJ9fyikOIQofRFgBwc+azDKoVS5bLizCWfPAZ19kgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5VBtSTxjKGqoxaNqh/KUM2jh9h2NDKgi04AvT0u5BTM3WcofIEvtNgoStnfXurKZoR+9WXrM2vHBFbR5X8QcFVFuV1ksW1BzVJJvdcLKQlDqcct7CXvLossGimiFrZbs5ikBlkOmX0ii87BWz5hEmPB744im19PRD/MDNp9W4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkCkilxR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfZvoVvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkCkilxR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfZvoVvQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDFj1395640
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=; b=TkCkilxR6QHwyEM6
	K3Uh8HLjjMrRwi5SDzLobn0l0ks7SUkP9b/Y0pm/FqISlhJQMlNylKJ+i+fx7OZB
	jRdYzX3LwzTY6mhbfS1kypRjDdHF0+p34B8QL/rsAIb5JGqeKoZYnDxDcMGKk7fK
	y5DI9XmBgHLJHhEnI2DEngo+ZZb2Piw1DVN+TJ2X+X/H8bgZUVpFn6EXf6CA8Mza
	awxZnam2jtRlVWnvodimOlJ/KI1EWQkAF3HMKwtUlbFIkkFqIObhW15QaMLl9Vap
	4hWYnI6WhD31SUWyc8/++BUygc83V2SZZwNAITJoqHsFOenv2pW77SxTnIlaWFRL
	1fvCcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870s2pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 05:01:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso10179073a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142915; x=1776747715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=dfZvoVvQ08wR5hmR07NbuAUtYHGbwR0jZaO7rMcMLpomd1kPiFmD49kXYw/CMHVLmI
         Um5mAJ8pdLkybzzUKrHdc5WZgSIetW39HRX6BvMoOWr2NbC3ZOM/Em5Kc78PKhsdhtBB
         Dux3beayfOWgDfz7F+YMSa8uWPnDzXSKRJ1yopSX1PaIkzYtZHE+kMO4YOgi1lkONEby
         Uv442kA1fqfw0URRbPV7cZBvbr7jozuMJb97jiKk3DPRLOAr8rkHDHCuLXlC7BXH2+gY
         QD2OEayJb28IVsb2QHLW2KI7BDqZcMAVNx6v9bHNvVri5eS9inQ3/TC4R2dAB/LVHcbw
         Rg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142915; x=1776747715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=DQY8AyKfPKB3mMswn56w8B7xcpqCNCsPAewepaf/8V2wcs02wUnJjG57yR8bGCtXyI
         ayDoErYoOg/l3yUZ0pHVjtlBUfRZZJL2RU9iEF0l+GY6nLojuzoOdrUcDKd09q0c71Gz
         DSVb0+GHw5emDOMD3cPnVyTcycYBqtS0y7b/sebE1w0KTLXTYlzDKNaH3pAUSAMK9l9l
         5Tozx5tVoml7loAg2F7kNWuWs1BmwQzN81sL+abXtCgeIGA+cWgO0VbTlbvSyaezCNCu
         BVT1dX+0Utq4IcDQb7Y0d5bsl8dZGQfR+039crWOPmJEx3m07dIJjnkWuC8xDilWFsHE
         d2IA==
X-Forwarded-Encrypted: i=1; AFNElJ/175ZYUXI3UwZeKz9scNdDKIQT+y3xS79Ypza06x5AjgjYGc7jKRZxUhlYOPBJ86E9W3txKsJ2KEftEdltjDWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/R9lATEOKGyjpZ27+RGEldQLmCLj7PiCcsEtuwHnjUgE94jhI
	LkiHcuTeHZCsJlQARJNDDFzSmt2uKSYRm+0ASsfX9HArKbdyNNaHzsPAN2505wyCKHyYUo+7tEg
	2RMkOvnWX4XwjaT0fUtLiWBVzMx+jlGWh74D5PHgp54RHbQRoU3YFH9AcKBTWa1Hk2Adyajsi
X-Gm-Gg: AeBDieuo4PLfyJsnxCZbHVn2/HSd5GgBeQo5Yu/KA7FG248tpEH5pRi25xu/9OI2pS0
	uFr5EHWEmSIaNB3keqfK5kdYCM69HKH3fLqJ4ZEvOMb0jnpbZPPUEnjn/tPic7vLbs4xckojRgS
	jGYTdIiXm4fh/dHVlS2skag0H42GMyDVOj0tk2gdhmp0y0dWZcSoPiCucZkKiVkMYXcweyDX6t4
	ML4yDTgqrcdzDjKgbsJfKH0rifr4WW6x1F3uHFjrNp8Si2Pj7pouzWj/hAGwamHSjUi8+/+CtGD
	mlyuD1KBOahqruNEYwPa381962OPtr06XQ1pGb9fOzFsyIWCPqSFsmS9g+7v56UvEYbXZHx4jwq
	9/HqHVYS2jWOqH9cxo6vNqRmvJEgjSXCMBE0M8S0yeJYj0dAPbuqfrSdkBG94zghSTis478MhSZ
	Hd9+AICX4BHEWGATs=
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602778a91.8.1776142915508;
        Mon, 13 Apr 2026 22:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602754a91.8.1776142914976;
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e6070bsm691414a91.7.2026.04.13.22.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Message-ID: <cd47cde2-757f-4b6e-9846-0673798f3093@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:01:49 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm56u_cDoKnuPob@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adm56u_cDoKnuPob@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wCS-AwIfSKFuMGgSoV6ScCJLLE_btr1a
X-Proofpoint-GUID: wCS-AwIfSKFuMGgSoV6ScCJLLE_btr1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX06xFvNpPyJGO
 WMh2EGRXIRoWWL4H2PsYECtCBMpMjHX5PgzKkwRgi239qtfjwD8X3obOEaFNjGcDsMtuggGsNwz
 Qx91cwU1HdQC7Na/RohIx7xmaLfL98CMdq/C4obGY8iUxzw7wvb7uyvAFimzlTkOn2f7NhgLxQS
 2bcmmJLNPxT9S/4j2CIe6T2QfNgtAuJ7vsLH8ey/utz0CQBcUaXPo8Oq9/lIkBuzAxQnL45I2eC
 8jlZvkyhJ+yDr+3gYgWIOb0FKK0MD6glnVq1JRQ/EkIlF35G9n9xJi2DskE3SA6d9iEFlj466N2
 Gq1H5JiqXynJ/UVI96AuBxH3pYUIK3wigEObgF8p1/sXiUE6vc05xBrzN8/yrhL6aydgcRqNOCE
 GafoaB97O577WaowoCkdeMBiu7/jB4oemJH2yn1fZc5hflIbhkusmp32OKYsCdgw+4e+y/2cjD3
 htzEpmSqFZxpnXCXP+g==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69ddca44 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=g4S4wLomyV-OnTC5uXsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045



On 4/11/2026 11:04 AM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> [..]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..34b54cf832d0 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>>   
>>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>   
>> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> -	if (handover)
>> -		qcom_pas_handover(&pas->q6v5);
>> +	/*
>> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
>> +	 * avoid mismatch.
> 
> Can you confirm that no load_state should be sent to AOSS for SoCCP?
> (I.e. from the skipped qcom_q6v5_prepare())
> 
> Regards,
> Bjorn

load_state send qmp to the subsystem, we checked from code level that
current downstream SoCCP do nothing with this now, I will double confirm
it from subsystem side.

Thanks,
Jingyi

