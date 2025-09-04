Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D93A8F7
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Sep 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980936; cv=none; b=qp8Zq4DC6hZLNc1QCj2Vd97rc74BJzrmRGbwrsmqp39UguRDEinO13gzq2AUFdCpJf4CL2s44elmftB1g9mnJvys5q+2KQBR7wr0YoOkaWEvRwKJpkmkFmrx93308NpCWmLcNjaFzNAoSxcopeIdll+BmO3fanhhSjIHtdzO7+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980936; c=relaxed/simple;
	bh=02YS+hRybT7AYqzhQAWsNOqiFU614c1kM6JJq7QCT0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcxlQZBKT16ZDqi4Cag55Is88fwF/f4tXBtaye9UOqIhNSu57wM8XxDL5JDWDkQis2IuUbCn3mh7SuaveccEp7XnxEN2URK6a+unuY1eKZSQauIIE7k9Ng6qr/WZ3jZkUM6oeooYANldBbXaoybiIMZA8VpCPDYYTg/Kmzf4l4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WV+yoPqS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WV+yoPqS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3dad6252eacso428762f8f.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Sep 2025 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756980933; x=1757585733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITTyrcjLlcY8/CcZ1bPQJZjvz7X9rDFNo6l00OOhKdM=;
        b=WV+yoPqS60xk0I/piZS1i+p49G2TEReiEaB/x1gL4RFBqnaDX0opfpvFt5QPecLeEl
         jIqdRyQCaBfHM/jQHLb3Sc4AaJErVNpvGRFu9w0b2OgfimTMOY5gUHB9JCiJwkzeoDdx
         OG6bxAkSbHF2YNlWVYOGRkxNS2+pIZRnZkmXgLCfDBzziqteIqhJ/hsEZsLGFA4VX8qo
         UeBs+c1WhDUXX6rJfESsyFgn4ublXrYm2pwpi+NrX3p91fWuw+Q7pN1r0UGUGvrycTrR
         IduUPP+B709hmBc3Q3QOpFEaapV6RLlHAdyBDqLxAwG1CxUgB5QOVFTmcIEXW9BcZkMy
         MoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756980933; x=1757585733;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITTyrcjLlcY8/CcZ1bPQJZjvz7X9rDFNo6l00OOhKdM=;
        b=uxuGTcICTlPeSPtI8CfA0GzuXXFURTqf+j6wFMNcTrWcMffa4LdbAR3HU61GH8lxpZ
         baHT1Jj5GAmnxnlCV3kG4UmgAU3c9gz/rLwd+GH2o67XLVS+4wmwvUZsuTlCqjbikeG/
         KBjpq1xLZVF3Sxjwce9uWYJ8y3mUfBn1+oykraAVHdUwKEi0MaUOfaG+vp50ZpZU5knk
         WEV20mD2vKNAxv20wdlHRYFBcx5FjEhEYhFgqZOsBeQDePFt5HnBNJX2YXEspH7Ipksv
         onyMeTSdP0X9wXp6iIfLdtPzJrwRHhurDn/dwrKlYM9O862R3aKhle4QCePtDiE11FYS
         8Pjw==
X-Forwarded-Encrypted: i=1; AJvYcCWmfjPNZSUeX9m8cBrMrgYMAGpAZXhbLN2ZhVDG6Dq5Eu/51mkNjSwcDo49UXBHMTbPSNXNzv/GzVlMZOz+onFu@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDwBIfehj7R+QUXHPxDaSFanSRhF63y0utHQGf5gO94RdKl7R
	64UlL1W9qx9TZBKLpQocHTl9r+eto5BQnr5LZl4HDqJ45lRFxZg073QeTxnR5dVCg44=
X-Gm-Gg: ASbGncsZpc6nSvZJGEtoGshqnHeppSZdS4vq4+NReEA4B4ZfBCNspbs1LyOzfWrmgpN
	BZNEL1YLHdC9BF4vjmZLwXTr+J1pjYML+qQdbOHnDwc3F33FtOZWSgp76rzm4Ez1Ei/JzszmLw7
	Wa9AFM75P19S2c72wdKCQoN+Z00kDzYKhGpFSWwbyylGmTe/RwJNN2RQ4BN4MqkR2mK4eruVLEY
	JksV7doIE3JHcgIKkabeOjTLU8Dx3FOnU8c8EERODQhF6ywz/9N7p9c17qdNWlNUS4vTWIni8GM
	lQG1JF6Pu4sQuuFvdQhazCZ1Zhuton6Y4JgohLzcBfwo6OuxfO14KjxK9jcpEfAAJd7gj5dcymH
	IHbAc0EUqVfevo9bRMMVSx+Tr4uoN5TXd87AMhDrxcD5sUptGxk0tRGEjcTyjgwE6S5F/FZf3Sx
	7nK9CKO2NozrKw3iwzh3k=
X-Google-Smtp-Source: AGHT+IHN3+S37G8tZIj+/ejyO1j55iGkRMCn39gBM1gwQQqKT5FKmj84TFJBcgmeeHOEkPQvZICy+g==
X-Received: by 2002:a05:6000:1449:b0:3df:c5e3:560e with SMTP id ffacd0b85a97d-3dfc5e36062mr2281362f8f.7.1756980932655;
        Thu, 04 Sep 2025 03:15:32 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d21a32dbc5sm24323510f8f.11.2025.09.04.03.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 03:15:32 -0700 (PDT)
Message-ID: <a793c2ff-3f06-4ed4-90f4-4b2a11e714e0@linaro.org>
Date: Thu, 4 Sep 2025 11:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
 <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
 <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 10:52, Mukesh Ojha wrote:
>> So is it really the intention of this patch to change the callsites where
>> qcom_mdt_pas_load() away from the init version to the no_init version ?
>>
>> Maybe its a symptom of patch collision but hmm, having a hard time
>> cherry-picking this to test.
> My intention is to unify all subsystems whether it's remoteproc, video,
> or others using Secure PIL, so that they all use the same set of APIs
> via context (cxt).
> 
> Like, we first initialize the context, and then use it for other PIL-related
> SMC calls such as pas_init, mem_setup, auth_and_reset, or even for the
> new rsc_table SMC call. This way, everything is connected, and it
> becomes clear which functions need to be called and it will also be
> extensible via a small handling for SHMbridge on gunyah absence. Similar
> changes would also apply to the MDT loader APIs.
> 
> That's why I asked here after "---" in this patch if this approach is
> preferred, I will apply it consistently and eliminate redundant APIs.
> 
> Let me know your thought.

For me its a question of digesting the change.

Your series says "Add context aware qcom_mdt_pas_load()" but, it does 
more than add - it changes logic.

At a minimum I'd suggest splitting the addition of the function from the 
changing of the existing logic so that the two could be disambiguated.

The other comment I have is, is this change really required to enable 
pil loading @ EL2 ?

You could for example structure this series to implement the changes you 
need for EL2 - and then have a last patch at the end to make the code 
"more beautiful" or even a second series to do that.

So I'd suggest one of

1. Splitting the addition of the new helper and its use into
    separate patches in the same series.

or

2. Doing the full EL2 conversion and then applying the
    "make the code look nice" patch last.
    So that we could for example take 11 of 13 patches

or

3. Making the EL2 conversion and the posting a second series
    with your proposed tidy up

Either way for me splicing both the addition and the usage here is a bit 
hard to parse, especially since I can't seem to find a public SHA where 
this series cleanly applies.

---
bod
