Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3386398FAF
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784079; cv=none; b=qGnSaYsHjRG2U3wLpPd3XCm8x+rXQxFkT9P+apiQxBn1+8A8DmM8hub32gNFVCgOOzBg3DdwMPoj7iisfeimG6x65JgTJDcIrbmmNo3Pc5HmAfcqUXBUvN+bX+lw2x26XRmlzlKdSi3mO5uFpHNlUc07fxuh1kuLqAiUwiIh5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784079; c=relaxed/simple;
	bh=Phw0q0twGxbuE9D7QLZ8DkAenjCRLiKcNqFCJZDP0NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHPLrUl318Hg0DO+YXUYQPQ7hIndJDpw7odiKDSzN8S2b9S0C3NnJ8hfRoJUWw6twQGm9dpqsMHPNC+h3LlhWIma1AB7jdQNcOi5cOe51PYAz/T1vjCWxTeCyE20j00BanV4KW5ST/kfxvnvPeu+zvocq30tnspYQFYlzLVwSRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H11iJcM9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H11iJcM9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so7182886b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764784077; x=1765388877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBzdnOPhODqt/3CBHXHo5pklFGjbEbTbq6nvpEEv6+0=;
        b=H11iJcM9dcTqHe7UrwGAJ+kXEzI7UscccdNXfNgbH5fG2okYD956IXxeeW2pWsR0ET
         Pt1hU8lp1R8LKMK+7Kyw1OHLTKoeJEUYLRJei9R2gKl9K46yQSiv697jkf6bRPZcO1lR
         KArs3OM9kSNeigw3J8uEs4G4SSbMM9DI8phsnHE+RL8XTXqUlSl7haihCkmYn434hkDM
         qCHfYBTPxPbFjbGAe+0GrqUQm7atKNh7NR9sk/3OQlsEoy+Q9J9XKW8Jb6LxZsM5emmt
         +hXQknxLJZcpWqqhRpXsbMZi+C/S0m3tbMGL7KPFpYk98lYR+ruimAScF5J/xc1i7XQ5
         NkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784077; x=1765388877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBzdnOPhODqt/3CBHXHo5pklFGjbEbTbq6nvpEEv6+0=;
        b=oHYVqlAmnjzzFqUpd9a2K5f5fBDmvbUDhUKPoG8Jof+LSKMqxgXT7Hdul6zjJOGhw5
         9Iga/9sZ3LNcwBYFA+djjTXibsLyKql3EGnIBiOJdrawjzQye+5yxLG5AqOqRfHu+s7Z
         CPd3t+CB0Gg9jax+s9W7oVnUGkX4ppZwlRomPJZgVM1JqY9NmFR+EasdZiuif63uRGe+
         kY3WgHiZRDIsoHg8pLxItjgWjusW8Z/ANfhGFF/TDdiJ27ww1g+RdggI4AQVLn2Hyq/p
         00e2015OOk+jdRcXiHdhbShCPCYesvlRLvkz9/N3jsamGcUfaDN7WbQz5CHSJ7No40Rd
         o0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd8VlhuzQekEKJAiCdvbRvshFYXgmZAPhryWtzf46heh4y1Gov60GBLV60v0g8rJy7Y5FU4N8nT/6IRyr+P8B2@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkVhHsW0Q/zA1FhtH5qHWGVte0lFfVrHoJ+9m8Yf33brXhEDr
	hYo3QjCKfmSBVszrYqCScH3vWm0r6YjMKtYJvo1emQnqZGHuWWdU8rKE
X-Gm-Gg: ASbGncvyNJRbfOQuZU2R/5+0qkfDDwAGnlYwbKfczBQ4BjprT9sHcDI7qXi8QSTjT0W
	MLU5SdJ3/kSSnolVYETCnkHR5Jo8eeH2dQNBhNiVpAjGLlnElOgQzcEEf2VwOG4wrk4Z4qYhd+x
	ISW21VU2906yepuETA/1v4KA2uVMF1sYnbyO7YMVKKguapbvOln/kOXOzwWc3801Ys39HPa47Hs
	Crjuy3kgEDaPxWJ7ebPyRj/EqmoBe+9bG4KzqCJQ9sbVWRIJra6Uzxf0qioob9JkN66Bv1oc0ND
	tXuM7wAY5wUrmz7oVQeVpO/25OZCyX//jvRxEShqenctuuuqjCJOrwghG12I391iw3ztd6cVSx2
	IEk02Z7EBOenVMYOshuKu/u91/jT+XcVMaVaoDdlyzMJZTKaG/LxKADFMl40ymiCPGqOXF63Olp
	FiIghrarWwllBpftwfqm8+CBSuN1AVWA==
X-Google-Smtp-Source: AGHT+IFwpP/3+4ac2SEDcubLgdKIyeiFbIP3ZQbgFHHqgjtz4rW82S5SSXuTgFw2d61EF8uH5ImmAQ==
X-Received: by 2002:a05:6a20:e291:b0:361:2fe5:51a3 with SMTP id adf61e73a8af0-363f5e25412mr4193674637.39.1764784077159;
        Wed, 03 Dec 2025 09:47:57 -0800 (PST)
Received: from [192.168.7.10] ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1520a48b2sm20835782b3a.28.2025.12.03.09.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 09:47:56 -0800 (PST)
Message-ID: <91b0a95d-f4eb-4d68-b41d-d46abcfbe714@gmail.com>
Date: Wed, 3 Dec 2025 23:17:51 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: remoteproc: fix deadlink
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203170702.42769-1-sohammetha01@gmail.com>
 <a0ae7bfa-9924-45b0-9d10-96b91eb17d0c@kernel.org>
 <a04e7622-e9a3-4088-89d4-285157321080@kernel.org>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <a04e7622-e9a3-4088-89d4-285157321080@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/25 22:51, Krzysztof Kozlowski wrote:
> On 03/12/2025 18:21, Krzysztof Kozlowski wrote:
>> On 03/12/2025 18:07, Soham Metha wrote:
>>> The binding file 'gpio-dsp-keystone.txt' has been converted to a DT schema.
>>> The current binding is located at:
>>>
>>>     Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
>>>
>>> This change was made in https://lore.kernel.org/all/20250714202850.3011952-1-robh@kernel.org/
>>> and merged in aff0a1701b020c8e6b172f28828fd4f3e6eed41a
>>
>> Drop this sentence and instead please use 'commit sha' syntax, see
>> checkpatch and submitting patches docs for details.
>>
>>>
>>> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
>>> ---
>>>  .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
> 
> And:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> 
> Best regards,
> Krzysztof


Thanks for the review.
I'll switch to the proper syntax and resend the patch.

--
Soham Metha

