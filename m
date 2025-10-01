Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E41D88B4
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332517; cv=none; b=Fvdw8Szuv4YGBqCnGJlt+bn7FIHFeQR2timARnkslXcKuQF/NcoA5coeYJqGk8slxrimC6uAt2uaPhOo4Lz7UxIncmTFfzafVnvzHsfhXFeF3UImtiBLhPfwP9ObR/NSPMBMHKMfU7Dm35UZgZscR61/RjsTh/1GYROXywfH0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332517; c=relaxed/simple;
	bh=xhSeHCLhPIXnD0/zncoEoit4c9dMohXzhwKkUT+AHec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cePo5ehcaREIUkLODxc/vUahGZndhNWtrPza8xiE8mjyl6rAatZrpysnqp958xJmetFccIrazjkePYHyPwU9JWugr0jB03TDZi0+0Y8Oect86owlbY/VpdhotLrWNkKuezAL34rFOx7ZbJWdrRTXu7+HnFNkoTggb8bakRdbUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gVWZAUQi; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gVWZAUQi"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-27d69771e3eso58679715ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 08:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759332515; x=1759937315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REY5MPBUvyw7JEoBE4wqPx+Ebw8YSmQnOCr3RtTwLVM=;
        b=pgIul8dvHsEMQIy+SDEUhlLuk8PQewW63wvTQsN7QnuWmBWgx3YGFpxwasLnzBNMSB
         st0JXuPfKMkoJrez+J0+Il1/sp7FtR2Vxj3q0hyWxztw+ne433NZHqR+i9zbG/8T/18T
         4rRnX48vaIBRihY5d8x1B97m1vwS91BXiCZJEC+jKLhwoXE76FJCbGfkllcypLSjZS/4
         6X572ZKbJ38Qjfp/AU9ssXUobr2wiU6fBE3ApMcVsjfPwVQjlkyXDCbEZMEYZhCQ+1GP
         POkfdcR/wVfbrayTUmSXRkTMb9EvLu7N5kvpR1V2/xNmM4mDM9w1SWDctJ3Wf9CGtBZz
         TFxw==
X-Forwarded-Encrypted: i=1; AJvYcCWi3M/0WWX19mDOY3YPWhU4wX8icawY0vMTI1lNS3mk4v57gk3V5G0imFrezWHR+XX6VEFcmIiJK5LYeHvisJQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwDb5GsBqJS8eYVH6O/8gF/l58J1ozbVdlgwI/j2PmT8ReNXKeG
	60ydbCEYnAm5+SXA71nH/HpOHwWDbP75+hm0AoBe3qj5nNZO/ANvbfcT8tRI8iFY8ZK69Ah43TK
	1v9nnQe5w2N0wgcSuQAYnMewgEEYhBdhCtx41s5iJLt4KXDhXiJlFj+Kk0x7D58B1IGaSGe6AJ2
	PBLg1PsBPjykcMYdYg1XvxqZfAZIsYyf/3ei52HynNW3OpRslaEbTKBKC32roqWdgomjZarFnCg
	i7wTnV1c1LJPJKql0o50SSEy/U45g==
X-Gm-Gg: ASbGnctmFduCzykhjMuy3YuXcp+uunneqaU8feayrjxij+rvj24qqz8fulyqHcSyhME
	C3Y5Q532dI5eAwsFfPMk5VlwbGkMhx9o5GD5VVYjk/fi/EOryjT2o9HmxvT15LA7j/KCX487NH9
	kz0PQKBSNYbuuzaNOR8+AJbCwFoQJrjSZHEFrXVXLz2+L4mNfMtfhC02Dlz3YqDCac+P7A32KcG
	LDU9TuD6ODSw9Q8/E1NWGeDl3brr/ETHvuF4OPQlZl0HQS66DUmekLc9BKvvAyeHvBeSjsiYeE4
	+OzQ+qgMA1QRY+ZV3aI4VmGatNwKhL56UjgE9DjekJOw79pnc0otchlfGAI1hpYTr/mEmCWNdbV
	L2RQByzfbtikmC13NtzWhSLAfTQim3cwec9BZLTCRj2ZxYrlpcJ/NUv8HgaNMrlbrCAVbLI1brY
	gUO/xdaPs/tDpf
X-Google-Smtp-Source: AGHT+IHSiaMXDQuDOfdQjfe99ONw2jgS1Yh3MyKyFaJmUpaFIxOalgnjKAPyTWXsPLl9ydI3N3d1rapOJo9O
X-Received: by 2002:a17:902:ebc8:b0:267:da75:e0f with SMTP id d9443c01a7336-28e7f276e18mr45607925ad.11.1759332514974;
        Wed, 01 Oct 2025 08:28:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed66bb778sm15159075ad.4.2025.10.01.08.28.34
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:28:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fb254938so41860b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759332513; x=1759937313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=REY5MPBUvyw7JEoBE4wqPx+Ebw8YSmQnOCr3RtTwLVM=;
        b=gVWZAUQiuXLlfA0LQBWUEVxT0Lo4a2ExkAO3egGGX6hteAHojqstiCp5sALMsIe+r3
         y/n0t4/VWnboYpPT7AMSM/OKgBKEN0CdSz1cSC5QXICaBYp358qGbdJPe/i0cVS3Dt3j
         9wt1hzloE6P5lqjZC6WNrMEb6Z/Jd3eQGOT2M=
X-Forwarded-Encrypted: i=1; AJvYcCVpvtuxJZSLE78WjIf4OZUejleUVPzxwRgCcRJ/oJ4wkyx8ZdUaLskrN680Ny7PkA4DajwUoSpC3eprN+SSQmic@vger.kernel.org
X-Received: by 2002:a05:6a00:190c:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-78af4261855mr4611401b3a.32.1759332513152;
        Wed, 01 Oct 2025 08:28:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:190c:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-78af4261855mr4611365b3a.32.1759332512669;
        Wed, 01 Oct 2025 08:28:32 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1902sm53209b3a.31.2025.10.01.08.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:28:31 -0700 (PDT)
Message-ID: <68e10834-0c1a-4cbe-be0b-76e17f8341e0@broadcom.com>
Date: Wed, 1 Oct 2025 08:28:33 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Peng Fan <peng.fan@oss.nxp.com>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
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
In-Reply-To: <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/30/2025 7:58 PM, Peng Fan wrote:
> On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
>>
>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>> ---
>> .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>>
>> +  - |
>> +    hwlock@8404038 {
>> +        compatible = "brcm,brcmstb-hwspinlock";
>> +        reg = <0x8404038 0x40>;
> 
> Just have a question:
> the base is not 64KB aligned, so just want to know is this module part of
> the other ip block?

The alignment is relevant to determine whether this is part of a larger 
IP block or not, though I am not sure why you use 64KB as a criteria. 
Our HW rules are to match the highest OS available page size for the 
systems, for us it used to be 4KB and is now 16KB alignment.

The block is part of a "sundry" IP which has lots of controls that did 
not belong anywhere else, for better or for worse (pin/mux controls, SoC 
identification, drive strength, reset controls, and other misc bits).
-- 
Florian

