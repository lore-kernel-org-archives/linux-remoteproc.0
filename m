Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD14313279
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626594; cv=none; b=FdpVWrFQgow0DCsDNROhRZzuJqX4y2AYmapWyPLvdufe/DnlojxWWqXGPX1/7IkidOkiL6f8NCijk+QTuhXlfmkpRywGwdSi0ktdEy/TL5d0pUyXZ90U5ORAPsKnLDoczMtdpludUdCGXSwIt16kbgMGp8vV4lJgFs/h3K9vaSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626594; c=relaxed/simple;
	bh=rfmM0oHlriEWS2KwQfEnAdbuaeGQ7LHz+vEupFI4Xa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5dFOakWnO00EeNWs56qvMsy+Wv9pl614rO1UX9+9tbepYPmQ68dBIVk/dvmP04dYZcCUKrioLnCZDxBNCYG055nAxT5JSyiPSpGMGOk3z8dh79/2puoGWEGk/s2h1Lg1nghN0oxz9tW6deedsiiLyCpi1FXpM7Ej3rJdWBCS+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9CHjaOV; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9CHjaOV"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c75178c05fso32708a34.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767626592; x=1768231392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuBj4V4tanBoMRJVAMOCXf92ggYa0XV5YWXJxw2KNiU=;
        b=e9CHjaOVMPT3x70LJi28DKO7dAYLIl13zrImoj8uElp74aZTVMqZfAqzRMdo+7JO3+
         FBXg41SF6whMPyljzpHeHmRx8GFf783RclSbEL7sg/UV9XXv9BM9SsRLCFOwAZNlPIOM
         M1ouKKwtaz3rnMqqxVSv6ctYjnWEChq67HEN3J6KLbF43oS7sO+KUSWwO/kw4YJLgkdC
         KeYO9OX4ZnGkqbZTXzqngR9TULQ911d4C87DqtU7034PNraDeR9zn45Tkr5p51ao9d62
         hCK98/8GnjErA/j7E+viRZK915DTm+mzV/FhIWQmYZgBV0X95ZO33QMDFGRvbgIt9aN4
         RG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626592; x=1768231392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuBj4V4tanBoMRJVAMOCXf92ggYa0XV5YWXJxw2KNiU=;
        b=fs+HLgBqtKQmZWxAfccyBqNdYK60SpwTWFMeQgSG2jpM1Tt5qDpov3INxLGE1MWnJ7
         Buh8E92PqBdlVf/azemOwOBHlXEyJQTDhPLKxhom1ESbKriTSZeMWROX9etBfBSfsfpL
         lPK5XXiO3kuwPu+4IGcxpA+JcPbEkdCFpZSeg/+p0dTzxJKxlM669xfkojekeNfGfFY5
         CaDD04YPIMiLcxEXe+A0FZnEp6biLEHV2mF9Pf1l2msh8ZGv6ZEy1Tbp9ZlR8+gujwdH
         7wnv44g/X7gF1VlRsidgX7fF1qDyGc7OWHmDrGS1aTNhkcDsCcDcX/TkpE1l214E1mQX
         OnJg==
X-Forwarded-Encrypted: i=1; AJvYcCX/+CREBnQNxQ/tr0kf6QFlGCAnR9xvCOJVXJQ/JZXWsMNWAxnWJVlplIDAKyEiYvqqFXEmiaPk+8nxGJ5T/OVP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/whdAUthdjBzzXE8oTNzcLh8ZWOr70lOUsRj7O9eHnQMbWqIl
	+yCbXurPtWshoud3c3+BWOdwLP5FfJKpwVsAaoJu+55vXapTQRmWRswo
X-Gm-Gg: AY/fxX4QbAqMdYwE7ZPvvStGXXwyzL2baXcINqFvGNBYcCY1MdZSeY42AkOGJIkyViZ
	6aiU6FC9i3ckq6yistW0A4QIvr5yW+gsNCVz65wgqll5oglBlG2apPEGT7MVMj3EfOddacHr4d9
	mxYbQ0jeWaJllwpCDPXL+j7gv4frxqRtHKeLVhwHJ1tI94KLQB/WQP/vlvkqmSlycdshwPREGMZ
	VulStlAmY1TYtkTfMhwl+SuxS8anhKG1CsAlRH5FBWuPPtd+neDUfJRRxQF8ID8gfY1iOOf+BNN
	s38GN/Xl1WDIcMn64DIqRui917OEcdVOjt9YYB/eV322E8QGfuqVWhrjg0d27bqO4kR4SzIZzs0
	/Pi5rdWEXdkXQMWKnUNFKtKGCFrIj9zwf91SN2eOIURUBPtVAnZ7RE11WvzIfFnfjosL00UNC8P
	Nj41sspht5SZprSfbd4S2SpDUYPtAlog+R8LjcwXVvDqcZ/gK2ZjCcMVMxCotr95KRQZy54LP7b
	X4M7iPvDEdZ0d4g5xpcVdMRRoTCLXlU0A==
X-Google-Smtp-Source: AGHT+IHC0T34oUBbEa5lhbSB8wM+95jVMHVncLiRRnQsCbvUgDbHbtOBPFwou8Zv2vRl7ztJFMdTPg==
X-Received: by 2002:a05:6830:43a3:b0:756:a322:311 with SMTP id 46e09a7af769-7cc669001a2mr37442477a34.10.1767626591751;
        Mon, 05 Jan 2026 07:23:11 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce45ffb5fesm27703a34.25.2026.01.05.07.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:23:11 -0800 (PST)
Message-ID: <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Date: Mon, 5 Jan 2026 09:23:10 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
 <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 6:37 AM, Konrad Dybcio wrote:
> On 12/23/25 9:35 PM, Alex G. wrote:
>> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>>
>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>> ---
> 
> [...]
> 
>>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>>> *fw_name)
>>>> +{
>>>> +	const struct firmware *extra_fw;
>>>> +	int ret;
>>>> +
>>>> +	dev_info(wcss->dev, "loading additional firmware image %s\n",
>> fw_name);
> 
> Your email client is messing up the reply context - if it happens to
> be Thunderbird, set:
> 
> mailnews.wraplength = 0
> mailnews.send_plaintext_flowed = false
> 
> in the config

Oops.
>>>
>>> I don't think this log line is useful beyond development
>>
>> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be
>> prudent to print the names of any additional firmwares:
>>
>>      remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
>>
>>>> +
>>>> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>>> +	if (ret)
>>>> +		return 0;
>>>
>>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>>> is missing, particularly not to impose any new requirements on existing
>>> setups". But you haven't spelt that out explicitly.
>>
>> I intended to not abort when aux firmware is missing. Maybe the better way to
>> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
>>
>>> You also haven't provided an explanation as to why the firmware should be
>>> loaded. Is it necessary for some functionality? Is it that case on the
>>> newly-supported IPQ9574?
>>
>> I don't have a good answer. I reasoned that since the qcom provides it [1],
>> the M3 firmware would need to be loaded. I haven't done much testing without
>> it.
> 
> Well, could you please try?
> 
> IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
> to be a necessity here as well

I tried this without the M3 firmware, and I don't see a measurable 
difference in normal operation. I only tested AP mode briefly. How can I 
know for sure if the M3 firmware is needed or not?

Alex
