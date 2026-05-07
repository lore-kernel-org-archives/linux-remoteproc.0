Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F993F660E
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 May 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159754; cv=none; b=YO79NaLVCfg+qZAEsES5xWwpDjKJDboS/MTbFc18FVWtwY3yDsdrCC4V10RAj/gJ6GHXYcV6f34xyk4rgkw7LrQGb6IBPu+Wuua00lkAHfCmteCuN6xp9gP90BzomarjL3msuVayscigMBIgcfqWHrPH4SLlMGSCUHYcw+ykWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159754; c=relaxed/simple;
	bh=43ZNwjCoR/Xdai8NvV6N12RLoUIGmkzxfRExATYKZ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIQYF9BkzCzzznbTSCV27e3e5fw/WMQt34vqI8PUa4DyHafKiUEUJAjouKSaaKUgvbq7sEkL1G8oYFba2VSfoRjN6VTkveUaOZfumGZKqBZdSfgZn9OuQPpCZfg7uKcRRwKt18Q3u2eczD9eflggRcXKrnzXVpsDpvZqnHQQP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqTgoeQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAdFb3Ku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqTgoeQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fAdFb3Ku"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64795pS03463973
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 May 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=; b=bqTgoeQAwCVNNsGG
	pWUSkhVD0TSIoLcUi2g4m7b3vltI2RLEymnB3+EHowInNh+Bk8lxOR5c5VPgN9cb
	NKc2iZEUfQ/T0b43Onp0MYOqIP4kAaANBjEFIUeBgFbqqGJwU1FtIGYA52c7hFCk
	bEeHOIUqS1sZf/PTTWYhMNl5bMEiO8ZMptbcrFeZtl2yosTYPtHYqgrS1IY10eKD
	gqgqqLQ3gHbLqk1dLzlj6dfnFXmXQzY4d0BIy0Mr4WMGOf6Cp/AQgX7EXkO0vvVv
	u/BpsFiCSgYmqESjxBL09ssAIt21Raf8jsHPh17ySaY8M1mBhd5bhwyoC1WRZ4QE
	WJctuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn27cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 13:15:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so1804943a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159751; x=1778764551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=fAdFb3KuDIX4BgYEFAUGAxYAiXG+YjQrpbCuxaX4VmceF2TGgrKNWYZw2AcuIT1FH/
         G3Si7AJiLHRa6uUMYeGYekPgl7Y9IwlxkFB1HftFV7XWzZsFgML8GScxYJCayeSVUhc3
         aeBGA3ITF5pFM9pPCstvTxtQRAZYpEFtS6P7ljOIthp/+2k9QpLubyoTWaGK5jGyOGcA
         FSeijz7ysKLZJxP0dwyGkFTcd4VLyKqvfrDBwGtCIVDwhuxUaDBbUKl5t4VVcS7eiYHP
         fE6AhWHLA35YqYSdj6vSdO2hzWq451FPcXr3HaFt7Ykoh8x7rtP3jYPHIbNoq/qyergg
         EezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159751; x=1778764551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=Kwf/xGW5fDkiyH6kwIEkhAleGLZt6s+fuoAmKGZOyNAgaFdzzHfBj3VeqRNpg3UUkQ
         KStqtdXnPi8tVgrhJDIRR4qLAqP5cqWvOhI5zo/N7UJVirSrVGdcowTIVfziOCnPqK4A
         +h25JvxXiY/NR1I6aUp35PSLJ4RXuLANWCLf79eBN53LiSsZ1BdWt/aVvLA9n2W6RdVS
         DrAUwGxqlA0bNpdE+lc650zW+FQv4y0U9T9g0mU9yykTVSUAVb5iuQQT0s/S3JR2kQtD
         Glp6oodFlUh5UOyUCol2dnYHTP1C4hdTKR/M+XKCPfwyphpwLOILPF/a4udracBi7J4M
         G8AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nnpPTeEyQy5u1D/Mub440kSM8ugXd2Zq/KwhkqVjeeU1eHcPin1c8qwWJRBBE0eNjj/c08xNuwe56vUVHrjQu@vger.kernel.org
X-Gm-Message-State: AOJu0YwyTvr+U7wpFNMuTyXRrFUimvSSn9Dcesi1aXLqD7xI8zrpWtRw
	baXSBhjnOcmlvt5ZO9VZy94Nrt2qE0xvCOe0V1J1dYUf8yYu+ptz1e9OOfNbizI89miCnxZkFwb
	MBjcYundeLNMNyDI6W+k8HO7RQMG6SZm8NlhqDD6QVLdKRvwS5sFNvbONeYOczXkIifDlLaxntH
	Sqixsj
X-Gm-Gg: AeBDievyVm5DE0zfoGTgElnCs+ocbzJJnKgMPsaZAKu3nDSaGNyc5e+vpI4mn4BjwuE
	2DEG3/2g6Cdopv8wy/Q4FFbpgCS/FIaUVzsIMe4BtaRUP0etBT2rOtL0f/BpMGeuFHeUbygWXo8
	ySScZ2kr7Xowq22jIJUXHXdUXEe6pZtmFQvB3eCFmzco2M48lwEKvZWIF5WxJXRvByuL4BIjjMv
	U+nP1aA7evvR/NaDAErtJPSQ9TJ+eUUyt9BwxFaBTMejuyIJdUhahZUGrlQ6th7xtPnM6CNB64T
	Cs60Mb5UI9GTtuM3BVmj0jvZNdUZGKQK7Vjoqz3XLAm/vlDiRTgD6pspmzi2zWZwBoX0v+NNeN4
	Ed+mWWQob4Rr/YnfGsALVvp++igLQtZMS8oSdgjUznU5C67BpG6YMWf9+OTg=
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626729637.38.1778159750481;
        Thu, 07 May 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626671637.38.1778159749922;
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253790c29sm2220707a12.11.2026.05.07.06.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Message-ID: <63723178-79e6-4339-88cc-c0fc4c4d7b6d@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:45:43 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
 <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMiBTYWx0ZWRfX4wUN/2m+02p7
 zXiAi+eLjlOOdBta6AuvnB0kO2AubXGnLQFju4q9VtehQdrnTS4LZURvdwCxSUpawWDglwiqj0d
 Y6vHSbNO5XySlEf+ba4Yc8/GolWrBKVOf07iDhlcqIQEyIWGwnqNF+WcF8AK7eILtP852RxkkPr
 PjNa0yhnwWOdEzDnsluA5dXzNjMMoukUKzUaL/N/k0b0n9fffs2S/H8OzC5WvbW/aiswDegwob4
 S8JuG7CB+aytzjbyzhxGH7jSwgF/56W3m9QFRzLg1Q8wNyxO6/FeuEXeRiBcdZ9MJjJxosUXx2+
 F0eUhE/ldVw/BHQSb6VLF+keaJE/HOF5kFLp28VdsO4iYO7Gd2t2aVOFrjvH3E3+F3MCpF7EPn9
 EpVpx/XRQxrwAWffgAAC8hLuI9DAxvA0Vyi5NzztPFvW5Q0VM//P4Sz1UsJ4afUNbYlZyOU5HjA
 GkfNvWB+w/eCipLrQnA==
X-Proofpoint-ORIG-GUID: rH9ehFyg5vG5UCI0dWAFrdjyAmGQ3oKr
X-Proofpoint-GUID: rH9ehFyg5vG5UCI0dWAFrdjyAmGQ3oKr
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9087 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-pAn52T9RjbIQf_sGhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070132




On 5/4/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:56PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra rpm-smd device.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Folks, please organize your patches per subsystem, e.g. all SoC patches
> in one patchset. I saw you sent separate firmware, separate cache,
> separate sram and separate SoC ID.
>
> I was already asking this.

I agree with your point and will send patches subsystem-wise in future.
For this time, since some patches have already been reviewed and
don’t need a new version, can we proceed as is?

Thanks
Komal

>
> Best regards,
> Krzysztof
>

