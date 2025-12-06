Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191422F755
	for <linux-remoteproc@vger.kernel.org>; Sat,  6 Dec 2025 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987604; cv=none; b=vCNL07G0jQuGiTN91tLFETvP4MyiYGkX1cpmiTgI2oJJsw5DQ6kQ4ENHkaIkAaD7E11lEw/luxSyDTm+EmAirP7P7zaZz3SKzup4AARe105NWFpICt+nWBwlxaexioY8R8h1FQ93AgfBEhDUS1ks2Z9GNuur1CyHNEy53PA8tpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987604; c=relaxed/simple;
	bh=ucRnLknwryHZfMGiNt/y+Eq0A74SbtM3SP6W65Y7ZRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBhxvcwaXlMuNfMXaCXYE2Leh3aE1gpU9fSBsJCDarTIenYhbDLLE7Gi5f+OBh9ZO8hNoCxv+Gpq3BGmSLvJGjmciV46oMtESMq4KOAF4Rzq6UuVbA60ji9PHa/0Fd9zRMiOMDeJoC61Z7w+tAyLS83ibVM2wjIi7qTngfeh0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLuia54g; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLuia54g"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-65791c35134so1383336eaf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Dec 2025 18:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764987602; x=1765592402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JahXlNGOzmOtepmb3hjjXqZtJUWdt6w28IBWBns70o=;
        b=JLuia54gDaPXRjdsk/zHNPMat/FacIEaDiKICE4IOPhuXO2dyvE3A7HGOqK9gyE+T1
         S1sw8bHQmVJqmBKeyhOH4d+M0xPwP54F3QUDWz4s35kgI7KT7Ikud3aRLTfXXLjo54nk
         nwfzO+SRdCWg8EMITJ/Ky3j85s0KFvgZk5V1FvcYaCj4CyODq/OGHhm7ZYiSSE3cVzAX
         62bxA89u7UZcq2cTQ5Y2i3lXIoCjmwewDTgAHJEeI0y6Nso0A8M1+5mZLiVwmSedFlTB
         +Yrct6Z6hqlm9SVh0o2RXt8KKucyobUhFSY7kLb/2W70bfi6lvImjGyzjRG4FVNxsFDs
         C6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987602; x=1765592402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JahXlNGOzmOtepmb3hjjXqZtJUWdt6w28IBWBns70o=;
        b=mx8hqZyrEKdTI3N4SXzYIKAEUuVO6q+bSGWpAwReb4ugFj2oMePoMYYHlqkrrHhWDR
         aWuVlYqMGaMRzRE2d88RnNx9FLrSjE1RpmUC8MsDUouIT/ol4aXBLc3p38sMhz7pJW+W
         mXEFnmF4/PhgR7ZPYwGq2KPtbm6jJvXAngUfUVZr7wgo6zD3Ng/sXAg67/HPXvN1d1kz
         pAz9LiRzyqy/yZYRstfJrm3b/j/1mgBQnP5vDsP4XoZiMR7KeFI4uLpSReK+yCSqhIBN
         iyzqxV2C3qXfX5nigaxSqxQs+hn7XxXc+68j1jrNuC45X6eDo9kLwjue3usvNZqt7E66
         C1wg==
X-Forwarded-Encrypted: i=1; AJvYcCUOSGftibv4X/cINUSSoXtMhEQlhvJCLiVk/tlNH+LN0e5g5jd6cuJ1bGXkkIWkDoehyIBptVTXeL7CItrCfrY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxUYMzviBlWC8yZJ3QGBZJEVlvDgQ6uYcjYz+fVkB0nVfUmb+
	h7+TrbhHBNL41bDrMeds8Z6LCOYLkFNwNhiy4n1R50pOTPZ22kHXkmEF
X-Gm-Gg: ASbGncv5CBoIuPOvei3tylbqzczPXVPecj/n8dj7/ngJnAI0kmkSDpgi8UHyae0fnD1
	CRQM+ZJfAz6kn0wEHpww+Cn10jhtffpw9+iWp+RLavAdba0aZUOBrUUh0MP9JeWZf+1+yzGWJZx
	XAxnGNxaWPhOlg9/MHNU7VNEXQMLr9vGku0elcr+LxiooKX5NgwWupBS/jPVbIIQ2IcI/Myi6Rt
	dgbQdsbuD66U2rBwSOl2sjq9C+MzClAMYRcY9HI3kem1eTk4/thQRxqdONEhXklQPW6k0Ofj2B1
	ztxocClCP/ACffryy1QnmqqxzxbltiJMTbiLTIfyL7G1djx4a7SDDdulC8oq/AHu49vbHeUZNLS
	FW54b0GyYQgvbkuR1VX7x0GXE1ys/GtExCX90gEpm16G2J6mRiNdQFeRWseIlGq/KWtGUjNasoO
	7n6gI/6dh62QhYdjz8osl03TnhGicXyF8pHEECikuqNvlUnI/BKwZ8AsDVTN2+om3RHym+bGo5A
	wOw9A3wJauHI7GzULzyIxICf77wtV6bnGdnZy43JUFs
X-Google-Smtp-Source: AGHT+IEWBhvnN9trUkCXBUglev7/nK9T0ViIWvkFNjwoS8rBmSHJ8DmdMU3UapAV+bEQ6qMMvhOLrg==
X-Received: by 2002:a05:6820:2226:b0:659:9a49:8e87 with SMTP id 006d021491bc7-6599a8a05c6mr548224eaf.11.1764987601877;
        Fri, 05 Dec 2025 18:20:01 -0800 (PST)
Received: from [192.168.7.226] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ef0ca05sm3047121eaf.11.2025.12.05.18.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 18:20:00 -0800 (PST)
Message-ID: <87ba595e-353b-4c8c-b398-9f8245336f05@gmail.com>
Date: Fri, 5 Dec 2025 20:19:57 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of
 qcom,halt-regs
To: Bjorn Andersson <andersson@kernel.org>
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <qszmet2vcmricxze56b5p2jegmqwc4io7fewhhniqskyic636v@lnswyat7577p>
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <qszmet2vcmricxze56b5p2jegmqwc4io7fewhhniqskyic636v@lnswyat7577p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/25 3:18 PM, Bjorn Andersson wrote:
> On Fri, Nov 28, 2025 at 07:32:05PM -0600, Alexandru Gagniuc wrote:
>> The "qcom,halt-regs" consists of a phandle reference followed by th
>> three offsets within syscon for halt registers. Thus, we need to
>> request 4 integers from of_property_read_variable_u32_array(), with
>> the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.
>>
>> With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
>> -EOVERFLOW, causing .probe() to fail.
>>
>> Increase MAX_HALT_REG to 4, and update the indexes accordingly.
>>
> 
> Good catch, thanks
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Hi Bjorn,

I noticed that v1 of this series is included in the pull for v6.19 [1], 
even though there is a v2 [2] with some of your and Konrad's feedback 
included. I wanted to check if this is your intention. I am okay to go 
with v1, and am happy to submit any further improvements after the merge 
window.

Alex

[1] 
https://lore.kernel.org/linux-remoteproc/20251205200342.119676-1-andersson@kernel.org/T/#u
[2] 
lore.kernel.org/linux-remoteproc/20251202162626.1135615-1-mr.nuke.me@gmail.com/#r> 
Regards,
> Bjorn
> 
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_wcss.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index 07c88623f5978..23ec87827d4f8 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -85,7 +85,7 @@
>>   #define TCSR_WCSS_CLK_MASK	0x1F
>>   #define TCSR_WCSS_CLK_ENABLE	0x14
>>   
>> -#define MAX_HALT_REG		3
>> +#define MAX_HALT_REG		4
>>   enum {
>>   	WCSS_IPQ8074,
>>   	WCSS_QCS404,
>> @@ -864,9 +864,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
>>   		return -EINVAL;
>>   	}
>>   
>> -	wcss->halt_q6 = halt_reg[0];
>> -	wcss->halt_wcss = halt_reg[1];
>> -	wcss->halt_nc = halt_reg[2];
>> +	wcss->halt_q6 = halt_reg[1];
>> +	wcss->halt_wcss = halt_reg[2];
>> +	wcss->halt_nc = halt_reg[3];
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.45.1
>>

