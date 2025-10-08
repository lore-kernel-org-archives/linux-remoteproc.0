Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A012BE638
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941607; cv=none; b=K4N1C0giIQMPQB3pBq2TYLwsAqlnfvbwmQq7W19hw2F/Q17dwXbXh+YWLEvBI7q5MgoWHGUQylg/Ga9UyaMObfH8+N61TQOdxujyQtwYiL0+kVzRlHNLeWb8l0/iXyFx0cXIvsEVowy++b/AEN8MAdyzV1iLTAdhFc587QMhu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941607; c=relaxed/simple;
	bh=+PfLy+PaRN1TJ1rm8PW6ichyFtD1//8glxnN3oAJ2ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2T+Y2u+cveOHrPhZFE4mvxCnuMGqws4RvVgNm27VtJ9e6YuMf3gK4w0GFhMqHEPD38YYuFEX7U6i3glZLVRWCDzLZesO8iUiOMQtQ2Fxs1PLrjIkyxHGnoU7UCQs7ppzqEYay/sNjyjomCuD7SeJ1TfjxV8b0Htd8N67aVFEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dEn6JKK0; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dEn6JKK0"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso37277137.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 09:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941604; x=1760546404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx31lKioNXTd656SFk60BU+Dyp2fe1w4rAJW/22lkGo=;
        b=HXTl9dvzNGFLVBw3QQrOabv+aKOHG1FFpRkewjpGe1TMfFLWVfAMltFV6U58D0D0iD
         5cCoBmuFKf3Yh/Tk24gzYOpW8Toii2kn4CnD1eEyGnnrH3hLfStSraZqhWytMUB7e5ac
         Xo6Urk01ph+hY0QpVrrGM7LBMXk0Yy2M4d1FycPUhMg77eXQ6r57eTf0+ifhRzucWM7A
         V7ynifxWKU9ToPybZaTxdUgwzWt057621SGXPZR1YAUJxsKC/AwpOVZJSupqcvyXgz1g
         5yVXejf2b8boQmacQ9sNUJPUYwh4JDZUHST78uZPl5hW7stPzdJUUxpLV16QB4SBoERX
         M4bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSoYWTgwFCElrpiAnnI3X3Idqjzde1cDM/yrvYpmv8oamRjCuc034jgC7u93xl4zBkv0+PQGrmLm3f5UD/geLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMKnH+QdJwUKLS8abdeO5gcHnf1SnluuupVB0E7ceoPAmFTNwa
	jYM8cqWsAvxjLvpIviozoZkkHPqbI0ynJZCVcLh5itY6FU0J0iaQ42EWP84Q/KCYKlQQscgaWSZ
	nJ0/lwjzGd+y5ttZL3upmbg/RyZSnnqjpAYr3x6sNpDogdjynwQ9AvY9SDEDnXfANC2l45Nt2bP
	8z0C6+nCgsYikQMrBfGXwaPOZ6KZd6SIXgWZ7sVXCK7BU6BGNrjeV1XJ+m1lbR76ggP2qT1tHWK
	T08tvsUJ8WleCnzHFjpdhKky3hwtw==
X-Gm-Gg: ASbGnctkAe48WPIbw9vaz5EiBBhl6P7iVjhi+2I3Gf5uxWwvSUZZVn5CgDZgsMaKqbn
	PR8tBJv6Wc2YEySLcO/B+aq9pe/xyKdy2aP33hFpOV6DccE7U/qG7AED1+iKAIg8Jv5WmmRtHo2
	eDdW1F08C46I9rdAytRnKqm6MA2smxf1huFsMUwULO0PYbjUZRRscJx1u93n/JZ4kh8x84oLjoX
	CDESlpuZY0Cxz8JWTCrAITuM0vygsgWK0+omayDHiDVvWzGFwuAEpHzsiRX2akREgQk7FTrnx+G
	BQvRg4cQc+aeG1SZhOzaM6Q7dURTe9fKkAhgEQp2wTutdTWFQlgxno7LJW9msMtnUN5x4S18cXQ
	KOw9f5QU4oC9Ai2kZ2Ctq+sf98YfzxNznMQ1Pdxw44AA644lOoRySweByOsVi7CN87fyyoG0R+G
	OEtLklqWnK8bb5
X-Google-Smtp-Source: AGHT+IEW2WF/+1LKHn9bbO3wJSX/6EsyMGwlGtjtBJnwORzjwT86Bp8Nsx+iinPYKPSOQwaTz3NJpOTzLU4u
X-Received: by 2002:a05:6102:c47:b0:4fb:fa84:2e64 with SMTP id ada2fe7eead31-5d5e22065dfmr2001569137.14.1759941604355;
        Wed, 08 Oct 2025 09:40:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5d5d39bb336sm721388137.4.2025.10.08.09.40.03
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:40:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so3196b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759941603; x=1760546403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx31lKioNXTd656SFk60BU+Dyp2fe1w4rAJW/22lkGo=;
        b=dEn6JKK04v+gmZYYLnmSJoUcH0k93cl9ixHpdl4eAd4d7jgqReNTTUuJ5Z1zTBqrje
         lTdQBBf9r3b3Hx5JzNpCFDtUDV/mFXv/YoPzaLI4ZL6DR2SSeUV7pmSxxAE0ZuTJCwGr
         vkH0Z6aOK3Pr+M01YE5vQHUOiFz6/TNxNt7R0=
X-Forwarded-Encrypted: i=1; AJvYcCUXj1dG8oiLMQjqPt/EK+1Xsv8EqA7hoIjvl5eOwK40HaQwZBmQj1oKy6lYWoGcNJSKd7mfcUxCW56II+YvY866@vger.kernel.org
X-Received: by 2002:a05:6a00:92a2:b0:781:1784:6dad with SMTP id d2e1a72fcca58-79387c19ba5mr4718163b3a.24.1759941602386;
        Wed, 08 Oct 2025 09:40:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a2:b0:781:1784:6dad with SMTP id d2e1a72fcca58-79387c19ba5mr4718107b3a.24.1759941601632;
        Wed, 08 Oct 2025 09:40:01 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33f0495sm186997b3a.76.2025.10.08.09.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 09:40:00 -0700 (PDT)
Message-ID: <7d96e604-e485-47c8-a0fe-64201f30eaa1@broadcom.com>
Date: Wed, 8 Oct 2025 09:39:59 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Rob Herring <robh@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
 <20251001181641.1561472-2-kamal.dasu@broadcom.com>
 <20251008155639.GA3512742-robh@kernel.org>
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
In-Reply-To: <20251008155639.GA3512742-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/2025 8:56 AM, Rob Herring wrote:
> On Wed, Oct 01, 2025 at 02:16:39PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
> 
> That's obvious from the diff. Tell us something about the h/w and
> convince me we don't need per SoC compatible which is standard practice.
> 
>>
>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>> ---
>>   .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>> new file mode 100644
>> index 000000000000..f45399b4fe0b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>> @@ -0,0 +1,36 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom settop Hardware Spinlock
>> +
>> +maintainers:
>> +  - Kamal Dasu <kamal.dasu@broadcom.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,brcmstb-hwspinlock
> 
> hwspinlock is the name of the h/w block? Use the name of the h/w, not
> linux subsystem names.
> 
>> +
>> +  "#hwlock-cells":
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#hwlock-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hwlock@8404038 {
>> +        compatible = "brcm,brcmstb-hwspinlock";
>> +        reg = <0x8404038 0x40>;
> 
> h/w blocks rarely start at an offset like that. Is this part of some
> other h/w block? If so, then just add '#hwlock-cells' to *that* node.

We've answered that in the previous review:

The block is part of a "sundry" IP which has lots of controls that did 
not belong anywhere else, for better or for worse (pin/mux controls, SoC 
identification, drive strength, reset controls, and other misc bits).
-- 
Florian

