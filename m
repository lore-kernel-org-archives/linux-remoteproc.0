Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E72374D2
	for <linux-remoteproc@vger.kernel.org>; Sat,  6 Apr 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712428101; cv=none; b=JjchfvupzcaGdToOuPddTRVBxk2DMy8zQBdEPY7SXQcwwB7TSz5epqFYrwBcZmVEj7wavYSxhbwteZVCAKFtEjhwVXaBzXmZKqYuEkZAff31Q6QaGSgeiuEm0FEDdl2hkz/hUNHSQ6FD6uvkhgnQw5MleQ9ncQxtkq44Cm7UDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712428101; c=relaxed/simple;
	bh=AG0FT3QlDl7r9OE6ivmxwjdeoddWrSI1Nu2M6F5/j5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYFfUZ3OFxJY8bAVdtHm+skPtt0W0CaLNaT0SiwcsRiyav0uzt/7R09GrmqxraHjkhjH67hFi5k5K1c4Qs4gflIDB6BQxy8+bd5NZRETUHFH8dQQWCNNfl+JCVUYuGcaZSf804128myD4sH8UHCl9B3jpluUUS6StqN7npdkXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAETtRay; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAETtRay"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51c8274403so12559266b.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 06 Apr 2024 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712428098; x=1713032898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5/leVU/g6TtCF3jERsW6Ittq1/U67NNL8KNVOCFpw=;
        b=NAETtRayePzjANuoqWWKZQIX7nZLLY8osM9TsmgxWbaVZwGVrSl76orsYjkixWILMT
         VxYzbPj2slbJ8616yqwYfqIMW57+vHaK5guzDVAOHX88VeJdiKCutKygls9suMTTF8C0
         htOxyGDHzPV6NLUo7fp0smqkxPjJ5bLFb8UtX9spLN4h624kRQ2feiVbQSHB87CNA03z
         JvEBTaemBPVbaIqetOryCRwIc4/IVF/wgvmy8qxSDUfUhQesfWjdAHYki92GHXvFmNnc
         SEWH9v95h0VzrcYpLUz4sRVC20Ok0jCw6fuzOUa9+kpvzbOAbD6uOXZE0l6dx9cKvcNw
         DL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712428098; x=1713032898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5/leVU/g6TtCF3jERsW6Ittq1/U67NNL8KNVOCFpw=;
        b=HDy61P9GGh0uIUmYFI0TMWSWAhIMoKCImDofZ1NVtaKU8Ya3nf6z0+j4+e8z+P4w2h
         A4a/39JA62qdHH2koPhRrmf8ydoT269g2zrZrpvRmLaeSABGqQ264GJ5xWMVjMeWzbjT
         0AABhYYVLCxzWT9rApFIaPNe7nqnuAjs0nQ/4RC1N7EF80i3vsTwPyo+m4n2gvCFwgCJ
         HDEMRGSjIOdtVmsApYxPfDh7dIrBBdIV/4o4TXGE7lca4KEwdlTYFg40DxcGzHGvZOOC
         v/f5JbqWQ73CLn19hJlQiL5n6z63MmLd/O5Dfy4xg1obPIvq+Uv9x8pJDIXKuVQ8zxQW
         vwZw==
X-Forwarded-Encrypted: i=1; AJvYcCVRANZ1exbBJ8yIz46Eh8R9De/9GGqXYrGeMR3scfIkUgsoVAg62NyJepsD0JCsenNa4OhiyRJBbACSz5xooaWp4NcmE7Ksf9YwI6/WLTwqOw==
X-Gm-Message-State: AOJu0YwOBvOMkIN84D0L8YUTZjDnIQMxndATMCMKJwEFmnYBa0Iq5z1r
	4IjXPWeHPUCGKtoXGiWJomDAS7AglIWPLVq0YQsy2lCfDcDypLqj
X-Google-Smtp-Source: AGHT+IHbTGaXO6EIGCg1/eLWb0inWBoVCd+c9l+hrz4C3GZ0cvdwXG8xVyhaTB6TsMiVfDhIVayO5g==
X-Received: by 2002:a17:906:e255:b0:a51:c976:b3a9 with SMTP id gq21-20020a170906e25500b00a51c976b3a9mr86107ejb.24.1712428097922;
        Sat, 06 Apr 2024 11:28:17 -0700 (PDT)
Received: from ?IPV6:2a04:241e:501:580:a40e:b8a:6234:b1c0? ([2a04:241e:501:580:a40e:b8a:6234:b1c0])
        by smtp.gmail.com with ESMTPSA id kh20-20020a170906f81400b00a46af0fbf5dsm2207686ejb.103.2024.04.06.11.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 11:28:17 -0700 (PDT)
Message-ID: <ad477802-a066-4fd0-bbb1-c2641f04b7c3@gmail.com>
Date: Sat, 6 Apr 2024 21:28:15 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
To: Tanmay Shah <tanmay.shah@amd.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
 <6adf7a7c-c9ad-40ae-9e11-cc722c8049dd@amd.com>
Content-Language: en-US
From: Leonard Crestez <cdleonard@gmail.com>
In-Reply-To: <6adf7a7c-c9ad-40ae-9e11-cc722c8049dd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/24 23:14, Tanmay Shah wrote:
> Hello,
> 
> Thanks for your patch. Patch looks good to me.
> Please find some comments below.
> 
> On 3/16/24 1:16 PM, Leonard Crestez wrote:
>> Supporting remoteproc coredump requires the platform-specific driver to
>> register coredump segments to be dumped. Do this by calling
>> rproc_coredump_add_segment for every carveout.
>>
>> Also call rproc_coredump_set_elf_info when then rproc is created. If the
>> ELFCLASS parameter is not provided then coredump fails with an error.
>> Other drivers seem to pass EM_NONE for the machine argument but for me
>> this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
>>
>> Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
>> ---
>>
>> Tests were done by triggering an deliberate crash using remoteproc
>> debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
>>
>> The R5 cache is not flushed so RAM might be out of date which is
>> actually very bad because information most relevant to determining the
>> cause of a crash is lost. Possible workaround would be to flush caches
>> in some sort of R5 crash handler? I don't think Linux can do anything
>> about this limitation.
>>
> 
> Correct Linux can't. One workaround is that R5 firmware can mark
> required memory regions as non-cachable in MPU setting. This way information
> loss can be avoided.

The solution I ended up with is to add cache flushing in some sort of R5-side
crash handler.

>> The generated coredump doesn't contain registers, this seems to be a
>> limitation shared with other rproc coredumps. It's not clear how the apu
>> could access rpu registers on zynqmp, my only idea would be to use the
>> coresight dap but that sounds difficult.
> 
> Linux doesn't really have access to R5 control registers due to security.
> Instead EEMI calls to platform management controller are used to control R5.
> So R5 control register dump shouldn't needed.
> 
> Mathieu,
> I am okay to merge this patch.

Thanks for the review.
