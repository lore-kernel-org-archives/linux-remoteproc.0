Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45311CEEBD
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630554; cv=none; b=ke4cKipRQaWZPlPGiOiU3nqFUDBjzYRxTz4yOqcXmsxoNgfZHGe1v7+gvsZb+KXkU3lEYvGcSkU+975n8MmSIDwAqbnAXeKO9isvPoUw/daf7r9xlo9ce4gyhlxD4NGEXjBqwA88dqXUMJQURAXc4wG3NtG+tBk87RI3Nefowu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630554; c=relaxed/simple;
	bh=2A65zBED6m7/tv7dEnM2xI5q/QQ/d92NPxOCazeH/RM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SFt/WpctV0SDuevTDhDyxSlysmpOSpkULE2lQZd3MQNUn+xqESLQCKEvrOWeY/W+1SO7cNMbPL4YcLFm/H2qaqg8m5koY9ZNaSOjlS+aTbnUWg2HJ3eQ4hPYitOL56ska/59WZL9G3Q9E9NxA1iFaiYX87mBPH6A8jkB1ojQ+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=az36noLT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="az36noLT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-430f6bc9ca6so13106385e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 00:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630551; x=1729235351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJa3rMD3454OOFSPGWQ0hy2u/aS0soy7/AH3kB76Ef4=;
        b=az36noLTuOGO0cnULCbXoN5gYWQh6ZGUCrrubiwgHI6fMcPN+Z7+Af5MLPGdO3enDe
         7w9Lo2WDIb3nJYZ+7i7IUAdo1oM/d3wEBGDNV0x8VtdL7yc8H4gpFOgcwQGEzO8r8BUO
         atKimPxQ9ubzoX4NYCYN1WLAo7MGe+XLCHhwevwXtxeSuHSJNBIvZzSkVqhICnXWP8O5
         R3N5X962riG7pFBjWGha0b4jT/uS4D4q1s3IifeX6zU7leqTlVOpekE8rssWXToF4Amq
         kh1FXrPpiD8I0AbUIUjwgEHPsmU/b9JkvbtFm6mZkyhV2j2TtP0a6K1Z/ofUAu/Rr4Cu
         iIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630551; x=1729235351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pJa3rMD3454OOFSPGWQ0hy2u/aS0soy7/AH3kB76Ef4=;
        b=i/3elDvMvc4ZkqxczGFBrFOne65doQiqMtj/kijc32ezPZkDQ1I845fv0CqnvDpr4L
         UfgBJFbNOyfzgvjNV36Q70Cak9K0O9eQ8cTffZJGUrJbvAUH1gpL69+MfhTeNazkDpdN
         OcaJDp/AwdPWb5NCrS4R5CcOB/JCMr3rMHCIzl1ZpujZyW3wJ4V/pshNxf8/xiZMSCbq
         rF2I2aIY0/ntkNO/ZcoXTW/KoANMFTXdzaLAIuW9nxC7PbY0OZ+y00TyTnAo1o2x+wvm
         fhHHKQAsp2vKXL8Mlr5QD8LuRpYxy5O7YJwClJWOXDB8h4jgOes+7Uy4L2OtmcmLCqaS
         5y3A==
X-Forwarded-Encrypted: i=1; AJvYcCVCN6ME7dQpVMNDjv9YVJMJy0VHAjjUd5hEnpoRTyACrbJ6V+g4aS0iKIQCzntj1nlfd2VQmXMbiKBr7DBBa/R5@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6vz63h3oHEB2bzbCJVfleAgT6+r4wKJ4hUTUZSjMUW/7lv9q
	gwnoafLp8gafZgfafgeqTdRQzv1qF1pA0yu9HdEw9u1Z8U7zR2cGz4sK31H+hzw=
X-Google-Smtp-Source: AGHT+IEDQ1Ig7JgLQtzLMqS4xZTUIvZnCgQdWDESp0qLjh0GO2Q7GxGIJGx4jwt3SbcM50rZQct0kA==
X-Received: by 2002:a05:600c:3588:b0:42c:cd88:d0f7 with SMTP id 5b1f17b1804b1-4311ded50b5mr10261625e9.10.1728630551106;
        Fri, 11 Oct 2024 00:09:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:90b:cc4b:ab4f:ac2a? ([2a01:e0a:982:cbb0:90b:cc4b:ab4f:ac2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748f0a5sm66624815e9.48.2024.10.11.00.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:09:09 -0700 (PDT)
Message-ID: <80113961-1222-4492-80d2-b29ec6db2b66@linaro.org>
Date: Fri, 11 Oct 2024 09:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/6] remoteproc: qcom: Enable map/unmap and SHM bridge
 support
To: Shiraz Hashim <quic_shashim@quicinc.com>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-7-quic_mojha@quicinc.com>
 <9eb910d4-e521-4c14-8e73-8fd3d5ff9573@linaro.org>
 <ZwP1t45ni/gk754B@hu-mojha-hyd.qualcomm.com>
 <ZwTPghV36CSIpkE4@hu-mojha-hyd.qualcomm.com>
 <dfe46653-5243-47c8-8de9-17a38d13da53@linaro.org>
 <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241011050518.GJ1421305@hu-shashim-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 07:05, Shiraz Hashim wrote:
> On Thu, Oct 10, 2024 at 08:57:56AM +0200, neil.armstrong@linaro.org wrote:
>> On 08/10/2024 08:21, Mukesh Ojha wrote:
>>> On Mon, Oct 07, 2024 at 08:22:39PM +0530, Mukesh Ojha wrote:
>>>> On Mon, Oct 07, 2024 at 10:05:08AM +0200, neil.armstrong@linaro.org wrote:
>>>>> On 04/10/2024 23:23, Mukesh Ojha wrote:
>>>>>> For Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
>>>>>> translation for remote processors is managed by QHEE and if the same SoC
>>>>>> run under KVM, remoteproc carveout and devmem region should be IOMMU
>>>>>> mapped from Linux PAS driver before remoteproc is brought up and
>>>>>> unmapped once it is tear down and apart from this, SHM bridge also need
>>>>>> to set up to enable memory protection on both remoteproc meta data
>>>>>> memory as well as for the carveout region.
>>>>>>
>>>>>> Enable the support required to run Qualcomm remoteprocs on non-QHEE
>>>>>> hypervisors.
>>>>>>
>>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>>>> ---
>>>>>>     drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++++++++++++++++++++++++++-
>>>>>>     1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>>>> index ac339145e072..13bd13f1b989 100644
>>>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> 
> <snip>
> 
>>>>>> +		struct of_phandle_args args;
>>>>>> +
>>>>>> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus", "#iommu-cells", 0, &args);
>>>>>> +		if (ret < 0)
>>>>>> +			return ret;
>>>>>> +
>>>>>> +		rproc->has_iommu = true;
>>>>>> +		adsp->sid = args.args[0];
>>>>>> +		of_node_put(args.np);
>>>>>> +		ret = adsp_devmem_init(adsp);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>
>>>>> Why don't you get this table from the firmware like presumably
>>>>> QHEE does ?
>>>>
>>>> Well, AFAIK, QHEE(EL2) has this information statically present
>>>> and does not get it from anywhere., but will confirm this
>>>> twice..
>>>
>>> Double confirmed, device memory region required by remoteproc is
>>> statically present with QHEE.
>>
>> Right, in this case why those tables can't be embedded in the elf
>> .resource_table like it's done with qcom_q6v5_adsp.c by calling
>> rproc_elf_load_rsc_table() and let the remoteproc framework load the
>> resource table and setup the devmem ssmu_map ?
> 
> Mainly for two reasons -
> 
> firmware images on platforms where we like to bring additional no-qhee
> support do not have resource table.
> 
> QCOM PAS implementation for secure remoteproc supports single TZ call
> of auth_and_rest that authenticates and brings remoteproc out of
> reset. And we don't have provision to authenticate resource table
> before it is used for devmem/iommu setup.

Why not authenticate a separate binary containing the resource table ?

Adding the resources to DT is a no go since it's clearly related to what
the firmare will be using at runtime, so either it should go in a
.resource_table section or can be moved in a signed .mbn that can
be authenticated by TZ.

Remoteproc doesn't dictate how to load the resource table, there's helpers
to load it from an elf, but it can be loaded by other means.

Neil

> 
> regards
> Shiraz

