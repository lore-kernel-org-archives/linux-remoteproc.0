Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6D185B67
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759259348; cv=none; b=O17y1iRNpGtzp+Eu8Qg9ICHVmEZTA0J/8b5vwJrhmVfI40BZwgrLdVw0eoQX7OB/L4xR54HzbHVgXUYjnLL0GTIwVDjNH31Z4mFYvtZvxyn/Fth0Ld5q4EwVSrgnquHude/6T1z2DWYDUrGPb4bw2WC6LACMAMcIxo30Qg3BA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759259348; c=relaxed/simple;
	bh=8byBzfuARLecV6jM7Fyl8z6QyeFuZed5n+JikteZAf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZ3c79prkOwvnEVlP8TFBET7DzxKXSZS8OWvU6+7ZehC5xYdlt0SZnYgLHjvX+GY+Wtp1x7wFGB3cbj5tS29BM7DiEwPwzv5Et1TNEeGFFftrMVqfw68Fh5J3dIfmMA7LSCWtxUvpEIATq43nKhTPaTl6h+2w/5SFkDBUPvAY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OQRbvaoQ; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OQRbvaoQ"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-b55562f3130so4431944a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 12:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259346; x=1759864146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEfsyBIOLNFZekIuKmhiFVgQSrwSDxg84Ts1cNcrGIY=;
        b=ZK4SzByqg3CJspphsaoYTLS2+CB2FaMwsiBsQukbAmu99t7Rpv5s6p2nYKCLr/ekDO
         hZp6gfJOjQ+ExFQZ55wnCWt8XBTxaERBDGmyaUFbptCE0XTB/Mjs8WtBwD7c4jNxnfv/
         RsJS7eOFV7lJrNm8RJjLWNor4ei5TTeuweH6WnX3TSU9pgLLdqxmEl5JG3LfisI8GZME
         wcjYhYi6A6LdoA06RVpPmv27r9+x3pj1O0AJGE4jno3Aj7DgyrmUVFoGhKM5uPRdJsQ+
         CLIy2O1I+kA3hCdjOtJSRwn/gll6h+KNoOTAnmx1FRualfFAnA9FQlzV2PSzh6M4ohgn
         3asg==
X-Forwarded-Encrypted: i=1; AJvYcCX7TKRqZ1ikUPEY6S+8yW66VWvyYTBbLvbiRT8qYHnl+xe2ZFdaAkGmFtoX4Y9k+oD1U67JIzXiYjLcUf1OnW8R@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3Q54xfg/MgP9eRazjBiNX8/eNmaxFPIzFRKxlAQwj4EHFapk
	akYxiNEHwR0opOGdDiD1Vvj1P8QI0DUqxpmAO7E0tk5PnGXF3m7OvGd43IZEjAYA8C62aKrgOrK
	5c64wvUAP1teHeSYkwnbf3tk+wb54yuEHQ3aSyeTjOieOl7Z1f0o7MV7wNAq0E27ERhA5LK91R8
	+x2r8cj0Q8XEE/744vWdVBtVghEVnsctbJyPzC8XGJH/Ur82GXsN0sNVxaCKsZQjn+hTccj5x4Q
	d3tF4YD/mdkS2t9CR0uq/KQAPLKKw==
X-Gm-Gg: ASbGncut6q0cc5kHq53nWvB3nu5c1OIK+xp0Un83zVSDOy4sbaKfoS8u6/47W75ZojE
	Lr4l7DEOkMISP0yqCOfKE28KamMx6xxLo6f+Rj3q0RhYzR3I7pngGRHuh0+ztr8xDCSfawKbXJP
	tm+k6OetcM0iwrxl9H9822JI8d8CPkGklE9JVslaU8a91c+qrHqek48N4Qv2mivU1R1J/ECvqNq
	tL+HmfT/+eEFez2aqvftgJ+ejHLyOkAFR0Cmphq6BZICMs3lGEMUpyam5LC/qZ7E6dmR2JNlres
	rVbTjeNhzastG13Wd5rB04z8dy0t+KbdqgQsxz9gWLWkOrTYohxm3chSEStI9RsDTA0DMcX7R5s
	ccHTv0j+habOY5l8uJrzHPb6nXCsdlIkiX5kLd/LgJ+UUCPyGe84Kx0EaSczTpp3VU3jmDvq6hD
	exe6bYFv+awQ==
X-Google-Smtp-Source: AGHT+IEVwY0/wkLozoi9BsomrRlbgM6hmJ2/bcmc7CMK4hcODbV+Rkvcel2sNVybUJlKeUtDZ58iI40XLSGZ
X-Received: by 2002:a17:90b:33ce:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-339a6e9d33fmr666787a91.12.1759259346214;
        Tue, 30 Sep 2025 12:09:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3399cc7de8dsm42487a91.1.2025.09.30.12.09.05
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:09:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3305c08d975so6339971a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Sep 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759259344; x=1759864144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mEfsyBIOLNFZekIuKmhiFVgQSrwSDxg84Ts1cNcrGIY=;
        b=OQRbvaoQsJvxfH38ClbS6SmZ4WVMbXa17LQoRRvb6ro9EAqJiEIAlDlaInUIUHHq8a
         xDb0clGurBmQtBR8MWFBCDk1DEh12pYbu4qIGS8dNUextYJ7s0uRc+WcLad7W+LAt3Vi
         kHrLHJfCtEazLIaBAenRr1u26LrAZ6cklWKpc=
X-Forwarded-Encrypted: i=1; AJvYcCWdSNM4fGSuFVILUVEyiRHfrgwf11MXfFMV1Z1fBZ2IUikiMKcEA2/WaO8As7Z+lHAzDfZ2LLDd4cQDBd4fnADL@vger.kernel.org
X-Received: by 2002:a17:90b:3a92:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-339a6f36cbamr634144a91.21.1759259344350;
        Tue, 30 Sep 2025 12:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3a92:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-339a6f36cbamr634109a91.21.1759259343918;
        Tue, 30 Sep 2025 12:09:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebe5f2sm297610a91.11.2025.09.30.12.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:09:02 -0700 (PDT)
Message-ID: <1bb0f2f9-d3fa-42af-aa55-e9f0771ed5be@broadcom.com>
Date: Tue, 30 Sep 2025 12:09:01 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Conor Dooley <conor@kernel.org>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20250930-slapstick-volatile-60ad540f4b66@spud>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20250930-slapstick-volatile-60ad540f4b66@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/30/25 12:03, Conor Dooley wrote:
> On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
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
> Is "brcmstb" actually the name of a single platform?
> Looking at the "brcmstb" pci binding, it looks like there's a whole load
> of different devices there and none use "brcmstb":
>            - brcm,bcm2711-pcie # The Raspberry Pi 4
>            - brcm,bcm2712-pcie # Raspberry Pi 5
>            - brcm,bcm4908-pcie
>            - brcm,bcm7211-pcie # Broadcom STB version of RPi4
>            - brcm,bcm7216-pcie # Broadcom 7216 Arm
>            - brcm,bcm7278-pcie # Broadcom 7278 Arm
>            - brcm,bcm7425-pcie # Broadcom 7425 MIPs
>            - brcm,bcm7435-pcie # Broadcom 7435 MIPs
>            - brcm,bcm7445-pcie # Broadcom 7445 Arm
>            - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
> 
> If "stb" means "set top box", it sounds like a catchall for disparate
> devices, which isn't permitted.

Unlike PCIe, the HW spinlock hardware has been stable across all Set-top 
box chips ever since it was added, which is why the catch all is IMHO 
adequate here.
-- 
Florian
