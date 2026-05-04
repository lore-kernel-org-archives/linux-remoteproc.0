Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971B358D32
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895594; cv=none; b=cNlFj9vg6ZCIJUECGeMbDKalY9SrvksFOzzLpXCbE1mMc0PlbUQfHJ/MtOlhM42k7R9zVPburwEAD7i1469fp1UlrJMYTXsH1sQxB8A1mqguVCYxxsPCSPT4OhLc1lKVrrBvut8M7pHA8lKD9sl6fO93TnAhZP40KeJUUxCDAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895594; c=relaxed/simple;
	bh=h+f4WvNTMiPEVbnZUsHfPHPq+L80RhcaNVi5YLbSxL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBY8KZp2mDXURiDLz9dLWCseTGcePUU7jKHavPL14Cek/myorLVXutWXErPlleaLMzKA2CzVUbKkTsngWbe3GTfwbfiCgALQEvta4gcxRgXoPeTj61YFY0edGXxZ19uvimAUa2lb+f2g4zy0iqXAmDOOu2r1fFEQwf77sm86tHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWLzZfQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqvoFhOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWLzZfQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqvoFhOK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4FO84138293
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 May 2026 11:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=; b=NWLzZfQs1QlELHxn
	Y1ouGGR/3tqN8ojHkqnjfLgF1IK/OIqHS5RHdcpzFyKtdwoP5X5r/DCZUZc7krRo
	TrF6mHKpb+/bJSBB9lQ75B6mueu3BTq7z5yc+c0NwZz++6Pg9yjDbFLpXpQ6Lyqf
	r3Kw9FxVBslB7ggKcIkMB5xb+WUTynpy2x7FvKofWwRAWl3/GRlbBxbZe+GgePjT
	Mbt09jiAlfiu3vQQoWVZl7M6t0MRbDk++4xk6Ve2bL7nSUXvzNszozWKA76jxQLc
	4dWBFjc97K98NkzUZTIsO2Gr4ad7xNfm6OJuVZfCAGgLHQ4pp/lKwlVCHumQ9jp0
	40+4dw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3nhv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 11:53:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36531a0f95bso1118718a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777895591; x=1778500391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=;
        b=UqvoFhOKQfwM2AEeQKrZi/oe/GyXoN3E3PpEGufpqmNoqbGMTgPx8sVHrxowrAjVic
         WAx3W+SZe2seGi8KuRB01FivhYqtU7oe2182dAKqWrlp8wLsgjmJ9ERq3G7FHgYU82vA
         NjQmqsTdhc1qLET0HeGW2NyE5YEShNxGdmPToUAOdVdiJORXxu+2/pmOIWRd1VO8vX8R
         QyHohR/19GuhkkWEj7HfJdjhmUWnQIquC+zX8MX/5doOw9/So3VcKelOxQ6afHgqnNKS
         zWdY3NA9DaYvC+WoT/nlSEHegK5tpopELhy4XUcB/LWFHQLixS9fbeDhwcnKqDRZ6cvc
         dwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895591; x=1778500391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=;
        b=VnWztQsD5tGv3unEw7TEQGDtkE3f4BRhpk/EKUj7SpfSAShcxEOrkgfrC/BWnRbJe4
         Gty4AW9DMfXRU3OC3BzbdpZjtyAuNwGyVcstAf+52+RPyDjy3onMegn9oLjoYFoshw2V
         Tv+Z/1fifxBZvdLVNWwd73dkUdy9hOOZL+jOJNXhgbOo0MdgG+8ImrSZqV3/gPz5R3Fm
         zRjpQkgrrjCjLAe/UEPazLyPY4yjrXBSKb4f2MQ1jQeDHI7VBuBvVj4+XP1FHB9Vvzz/
         pbvbH6KWnvwWxv9euAO7mMc9DGffb9dSglQFAjSfYm8wpdU/8g36XyqluER8jQKTBBIN
         epUg==
X-Forwarded-Encrypted: i=1; AFNElJ/7+mm0B93hsZ0cfOJNdSB8l6lVbFBUWh8nbQYlkePeagVk+Hi1UGOgurhEYrQiqEbwhZVlS0YQSSDOB3lAny5q@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIuaoDqrWZwbuKUY55+arvXnjMnaGfEjYfcSCVZsfVlxci/UZ
	oRM0r6SlTB8uJbptN7k1gTcEL8Yxrvzk1D0fP+BxELtRfEfLzPQzII3hXwUmAtyjxhn93agsIkR
	uuw76uy/ecJMNEX9PrXBteNfF3zfn7si5JSRZs8NIlAZMlwEZwTcp0ly4iraci2wimEvvG48V
X-Gm-Gg: AeBDietP8gY6CHOry+jYS52L477JE1pLMy2GW9DgTP8iIyS6sjJpdqot0Kg5Bo3jj+j
	xVG17frYFzOzzuVIVyS4FZ/qS+/mKUxIeZde4cE06FC9xDNoHSrXZpb9bu/YcdtqeKrkpRos3/x
	o0NE46xkZ6GqgVEqBkv3iIUg4AaUCL0FSEkodb1VHX0TT0Zd7gu1B1UBOpVrcx9s5CjimNZi79r
	6foOVh7Cink5AFTFPIc7FC4jU1wzQKBpQgwkcl402RxKoi7Rj1803F/BAK7un7bK5isM9bF17dp
	j3UE9f0cciHdzOBlO1ItcdLzn7ZzvCcLnmf92RzB+H17p1mXfzc5Qf+rrAGxxwrkLkKDsM3ptRk
	wdDDQBrtyXAmmyEDVyO+NozMxKGt4TBOuWeMe8IOuTukfpqGim/z8csBGUYy4l3I=
X-Received: by 2002:a17:90b:4b90:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3650ce4793fmr9409786a91.22.1777895591052;
        Mon, 04 May 2026 04:53:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3650ce4793fmr9409732a91.22.1777895590521;
        Mon, 04 May 2026 04:53:10 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.150.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm11431599a91.14.2026.05.04.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 04:53:10 -0700 (PDT)
Message-ID: <6515558f-99c5-43c4-9141-4bd4a2be6317@oss.qualcomm.com>
Date: Mon, 4 May 2026 17:22:53 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
 <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
 <afiCrIYSm8AK9xn9@sumit-xelite>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <afiCrIYSm8AK9xn9@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEyNiBTYWx0ZWRfX/mobb3xw2PP8
 saGERaO4m2WWKLFycdg2nX9Hc5psXinEpwlDzTdhJSwHSRPQGN/yCIa0OcodKf45+MqpaDqAD8S
 hazegaWc+2sgGs/gTtOAKBuN2lc7ALayrJKYPTcu6FAOV/fn5CydjY+3uMgo0hyHgN0ZW9lRc7r
 LQlDh9NjzbPriHxX/NaxFPhoU5O8jA1ti21nJ1nrXr28iNExge08xs09pfNK98yb5CsqY4XFfNt
 fQhOMK8i+wGd9TwqgwpXTKmg12h4y3uL1Tudg8qHp9B7FgeKoxLjD49jg3Y0hAu3ruFqdomAorC
 27xVGZzrytyL/k1zTBswbiI2iuIoC8fASmYwxlUZYLhvRUGeRI5iVToMkBGfmaKyuUIsKFvkLMy
 jImjMjNx7v9FS/3E+WtjzU4cFRZGt0fog3GPMtEpRuBPl1W9BtPYRGgMUiR/jvOjf+Pcu9vfWsS
 Pai4qqwnae3pmBgrtoA==
X-Proofpoint-GUID: 03PFviHL3p0yxkaGclWkztLtmN7hl44M
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f888a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fKl8XJY0368M7tBUixYpxw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=w6fE4RYvq4DoGGcOsJAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 03PFviHL3p0yxkaGclWkztLtmN7hl44M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040126



On 5/4/2026 4:57 PM, Sumit Garg wrote:
> On Mon, May 04, 2026 at 03:33:06PM +0530, Harshal Dev wrote:
>> Hi Sumit,
>>
>> On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Add support for Peripheral Authentication Service (PAS) driver based
>>> on TEE bus with OP-TEE providing the backend PAS service implementation.
>>>
>>> The TEE PAS service ABI is designed to be extensible with additional API
>>> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
>>> extensions of the PAS service needed while still maintaining backwards
>>> compatibility.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/Kconfig        |  10 +
>>>  drivers/firmware/qcom/Makefile       |   1 +
>>>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>>>  3 files changed, 490 insertions(+)
>>>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>>
>> [...]
>>
>>> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
>>
>>> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
>>> +				  phys_addr_t addr, phys_addr_t size)
>>> +{
>>
>> [...]
>>
>>> +
>>> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
>>> +	if (ret < 0 || inv_arg.ret != 0) {
>>> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
>>> +			pas_id, ret, inv_arg.ret);
>>> +		return ret ?: -EINVAL;
>>
>> Following the example from qcom_scm_pas_mem_setup() here:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778
>>
>> I think it should be:
>> return ret ?: inv_arg.ret;
> 
> inv_arg.ret return a GP TEE error code which doesn't map 1:1 to kernel
> error codes. The client drivers won't benefit without having a way to
> decode those errors. So just printing here can help the user to debug
> any issues.
> 
>>
>> This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
>> I can see that is tries to print this error:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286
>>
>> With that,
>> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>
> 
> Thanks, I hope with above I can keep your tag.
> 

Alright sure, makes sense. Please keep the tag.

Regards,
Harshal

> -Sumit

