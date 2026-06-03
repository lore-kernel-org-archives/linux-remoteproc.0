Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC818357D08
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 03:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780458003; cv=none; b=k2Dnkup8siWLCDhJ8KDqucBcgjw0kUB2+nrWhmugUHM2d+BNqjHruZ3XLmtJMqig3E4dWmGULcoan3pfFObjG/MtdMEppGrDTExphPGMve/cuV3R7gdslHf5ZryaKlM4vuD0dNj4JFl0lC/yKgWxxG3a22LqOgd90y7Cg9m4py4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780458003; c=relaxed/simple;
	bh=LayMpiGRMeQK20rJ/0tmtlvyB5yYGKIx5W84HZbKAhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWq++U4gJvI1nwdQ3jUZEPkC9kpGsCyjUtOJHkfUAWxMn0EHrjkHklkuzugJsE2WxWb5lfDYfEyQVkXmi7cCjnntHl7APriOtbbFiif8JqMepLDiZtzViRqvJLGndqa9ZzCiDlbksNIfRdBX9zFs+I3FYaKRfeMqTUXrFmSfy0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CbWPv36k; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CbWPv36k"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so2425530e0c.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jun 2026 20:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780458001; x=1781062801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=l1mD4KRYmOUJZGAVB18ATzh/UKfPIZbCyhC8FSVWCIl022ebFI5giv+L1TKcrsQ0vS
         BykOq6RjJX1yOxPERmLPe/us97OCMhziq6YQY1g/4uWziCc9rbDeJloO0Te0dF3H4fAk
         Afg5+xgUoJWOYQV0DASvuoGtwaJEPAiIppr3EGyFG+R30XvA/hVUa0ZtUpm3ovwnzRJZ
         /BC29tBaSd50goejXxmTOapEx3wJyj1PEjP55yIPWOBFWe+P5XyV3QIViZYFRSSCrhb2
         DbOjv5QgwBN2OREufxIuRu95Ku4NUeEp9LxE4NWXVPna45WvnAlydJI25UVtmTmokMLn
         wqlA==
X-Forwarded-Encrypted: i=1; AFNElJ+3tCX7SEx19bPkCwmhvnoPOsNAusFxK4ObWXUXenrXzB/p/7mgAO1IYAnIZQdy/67bL78RYbT9eY/dGEeKuiXp@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMOOc0hDYU+80K+8qtjbKRmq8UkbeMvW3j2iaIKmtoDoHRj/5
	yMBjs5wQ4WKrZb6FbNBN7PPwHuKyh9Ts0ILfRRKnsXbk9Q5kcGkyJVR3TNHPuhUQtLtfE2N6gAY
	+8IgxpqSR+Uv21/endjYPM9JXsbfL+i68DV8d//stjr9IRINz7hpvZefUjd/8LyF6ZQM5xNOBs6
	WKNOfR3ZBFyRh7sZtS30G/T+EINt4vP+5rWysmE2IefAia5TpT63hw4n8kczmHs1UUxMOzY2/hc
	DhpRYBedVwhDGNLvdgMs8RCMzolNw==
X-Gm-Gg: Acq92OFAqTQ1phaYgQoIayNo7JISJSUFVYhIyg/CEkR7Lyzj+zfIWL3zAAKZ2EXDhUN
	bbSgnFbzrjUgqaSmSHU+LFt7L7jvfnjRLiMz1GlvsFCSwJnbOSeWwGafTepdnI3QKdhOpNjI867
	MXwZ3Nccfm2A7G06oPG0dEmPHY2ozzZLsQeAWqCSDuQo5JGGTWdJyuyCaQ6VsBTGYl6S974Xwg3
	0CB/cfBxaP0uSnml3h4TrO012+Uu2OA8BrG5QB4kd1it/xX/cjd27Y912cpwX5K+V4YPXR0vm2D
	LMIvAwK4m+WPknOIsWoDAyI+Kx4VyOZNrcVT7RImfmA40hO0FPKDf3PCpKK/QmV+8X3NLjixy2q
	UJQEdGxmUZ9OB6TvZzp8PwzOrDmNQmxom6/s5IG/GcuJ0fui/t/qkZ2eB9G9MMcEf005G5LrY5a
	taJJ1NDkYDGQTeQwxOpjbQKEmlr05QBE4QOzm0+nGe8Yrbp9p9YI1X7wNSyssBAsk4LhYOHC9qn
	NQ=
X-Received: by 2002:a05:6122:786:b0:5a4:6b77:2d79 with SMTP id 71dfb90a1353d-5a6e5416bb8mr1116682e0c.6.1780458000690;
        Tue, 02 Jun 2026 20:40:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5a6dca43662sm107179e0c.7.2026.06.02.20.40.00
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:40:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso6656011eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jun 2026 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780457999; x=1781062799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=CbWPv36ktMUCUl2wny02UhA4YWevDbCbROU0nWQuxCS2mR9vCVVDQWduicvpuL0g6e
         dY30TJkSb8WCZc1qVPLSd02mG63NWyML3j+MP4EnjG/+SdjxTTxpExUwgXI0jNIIvR8W
         ViBfeJ/FHfJgNi5qRCzhTJLGBuhVA899r/FuQ=
X-Forwarded-Encrypted: i=1; AFNElJ8CLPxuzlAyDdHykEvgv/BTJhpYYdHBtu6WKENygAeFN2k/zv/9qWlrD5JiEIPjWviJEPQ8B4l0ERWicuGojLWa@vger.kernel.org
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883762eec.2.1780457999572;
        Tue, 02 Jun 2026 20:39:59 -0700 (PDT)
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883739eec.2.1780457998957;
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm1109950eec.25.2026.06.02.20.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Message-ID: <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
Date: Tue, 2 Jun 2026 20:39:56 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, baolin.wang@linux.alibaba.com
Cc: krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Bjorn, Baolin,

On 4/27/2026 1:12 PM, Kamal Dasu wrote:
> This series adds hardware semaphore support for Broadcom set-top SoCs
> via the generic hwspinlock framework.
> 
> The semaphore registers live in the sundry block; the DT binding
> describes only the semaphore register range. The compatible is
> brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
> appeared on set-top chips).
> 
> The driver has been tested built-in and as a module.

Is there anything else you would want to see being done differently here 
or is this ready for being merged into your tree?

Thanks!
-- 
Florian

