Received: from mail-io1-f99.google.com (mail-io1-f99.google.com [209.85.166.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB782E8B86
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479322; cv=none; b=BRAIDLbQil0/qKiKoq0gNb2O73NFXRMmwegR2s+gzm9gCP8d9Jd+ApTSLCNDLEo6caNQ7v5kwFu1R8Ew8OAPK/sXLSPqWq/XoA5o9IYJfouxKwC5bo6y3/i7kSlt2AGHKUw/lSjjt/bp+hp26wxCLko4Sc0krwx3dYSetYq700c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479322; c=relaxed/simple;
	bh=MzT+PPiX2Ns3AvHt7w73ekUQyMyQjohybWezP0SN1m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ho6ML5uFoXfOcPrqIyWpl3VHWdMI9ebh6gu31sMTEgQ4HG7Lp0y2+nYZykO3NQpOoG8cRxK3sqaXfmhyT1RmnfV4ZCJ3uLb07vJeVUR8v0et6/+IqyYX2gNpo3Kozb+imFFPMohRwWulrjFkxPygPwtpkxhmUdXpXeZpXbE4zHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fzBt9EOD; arc=none smtp.client-ip=209.85.166.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fzBt9EOD"
Received: by mail-io1-f99.google.com with SMTP id ca18e2360f4ac-92aee734485so215243739f.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 15:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760479320; x=1761084120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e1fK4ITdfQE4nTPV/5xAA7Q8Q0cuPRv06tROKIa50U=;
        b=JXHRWfqG14s/M187deD4I9KARfcpg0Qc+n5PrHmAm3ms4qn/4TQpgW4j1USy5p0gZd
         t5Nkxgy43XrCJYhgTFeQfjaAxMWOoUGOkgScYdUvXi5Aa3w4TPW7sO5aQbeSwfUYnUsl
         91p4LrK7kovr1XtM5rZOkj8JLdxAU2ZV4pTCqJXeJ3iaXfq1bsK2o8B4m3avWNZl0iaV
         L811S30JiJVuEyCvCsr3tc9thzxgfEfGn+hGTA/FHLMfzQNVOeG0OhjqSStADj8Y205f
         EuLGSZwGhKOobBivHlIpLJo5ZxMxnNOoYHXdaBtzAau4mimH3lqGVzq1rwOLioIRXSxG
         xshQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6cZauqwR98UhdAsTdAWh3kgZhBkffg/G+vNHmrbbyCmQr4I5ddEQR2aKkzuC/njGdtAR8s71uQrky1/iPc6VL@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDSKdYTCwDQJAjE6dwPVWiET2P9fh4HrMmLkodm+FToCUHzj5
	Nra8S5HttlWrj+1zGxMf7KeWPljUDUHtkzAhcbCtldCAxiR+//cz54UgoFT0FqviId8IKsDBnFN
	EzVhoowvgVIZWr26dI3TXNPtmuR65UbrETREzuQbDRj2XIIUbTxnPEY811dtoex6ehBXhLy0GMI
	GZjpnXqwVyYRVwmMydtqCf1zl1JTPX/P4KOlUgkqdOfo0XkTNVwE6V9CH0xLix4N+BFFQ1n7qLO
	ZvPSQDbZnPWQ6eGMGSfTNLfoSCXKw==
X-Gm-Gg: ASbGncvNLe0SX4CjCsnQ9KQEnOv/O3SZPOIf+9bTyuzhIxNL+WFlghjmdPaYX6OFpnV
	eKe5uyNQvHKVvmGAyQvvaVntI+e8/QttLi/mZrC8WWrw0K69PgfP7GPMOeK1xJLQZLW8ViLtUkS
	hYuIhVUMtcO5RCyIexgt81uMbtV98qE91wfZfVdO0b3d3LxKwqg9GMV5hL/55Equ54SWdvpj5FA
	q5OxYGK+JTLULtdt4PzCPtpMU0vwiimdwf27b/l6EChXuNhzxHWaYuI89y19KN5jrxI0nXkUNp/
	JSZMdh3MtWbJS13PH34YuTsASZN54MaCgeyoCVNrhXJFdiK/T52W0Jt9d2CiaqC740FCb5qN4S3
	cp6h11cSuRoa+LtQ0NrqZaUaFuy9Czij4Km61CE29gCfONMy+He2SK8vYVpx8l/87HMkvgQ2NlL
	eZUw==
X-Google-Smtp-Source: AGHT+IHoTR2R4X5QdNEfQWN97nvBYZwpsgi1RW+olM2E6cNcPFC3AZBgyvO8gbCg3IWACdYjh8xShCcg6o/t
X-Received: by 2002:a05:6602:27c9:b0:8e8:a857:1f89 with SMTP id ca18e2360f4ac-93bd1780c1cmr3320102339f.3.1760479319740;
        Tue, 14 Oct 2025 15:01:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-93e25a7b781sm81561139f.14.2025.10.14.15.01.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Oct 2025 15:01:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86835654255so5123358385a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 15:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760479318; x=1761084118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2e1fK4ITdfQE4nTPV/5xAA7Q8Q0cuPRv06tROKIa50U=;
        b=fzBt9EODOZQKtj1cSdM9e1VNXC/ueKZPAcRtZrtsFDBM0JGXmjg4R2WmkuNKEdthIT
         Y6woNcGPuoTSUftSM+Q+lAtR2PGvns0s+iH6FOMFR4b6UlNWT6CT5VMmT7yuMT4eKNC0
         n66cYWsOHDRJIoms+U9KQSi3MeGKc/ZRzq35I=
X-Forwarded-Encrypted: i=1; AJvYcCW/E/Jo9M5z0aS5QU+iObmoAYdpfZV9d7Vh0n/tQM0CmtKth9NqMx/o4ZTK16cg2/30wxgmb+pS+pGbMK6iK9DI@vger.kernel.org
X-Received: by 2002:a05:620a:6910:b0:850:6d5e:cbda with SMTP id af79cd13be357-88353177b8bmr2980896885a.79.1760479318464;
        Tue, 14 Oct 2025 15:01:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:850:6d5e:cbda with SMTP id af79cd13be357-88353177b8bmr2980890485a.79.1760479317875;
        Tue, 14 Oct 2025 15:01:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d70easm1299924985a.12.2025.10.14.15.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 15:01:56 -0700 (PDT)
Message-ID: <cd174f01-30f6-4a6c-b55e-a15c088eded1@broadcom.com>
Date: Tue, 14 Oct 2025 15:01:53 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
 <20251009212003.2714447-2-kamal.dasu@broadcom.com>
 <3791aa93-c1c0-4fc9-9706-91f3f62743a3@kernel.org>
 <CAKekbeuDux1oOOOKK8Pq-jYRzScCDOEXw1w=JBodaUQ4PU2=cA@mail.gmail.com>
 <c6b68ec7-9195-4961-86dc-802a7cc55e38@kernel.org>
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
In-Reply-To: <c6b68ec7-9195-4961-86dc-802a7cc55e38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/14/25 14:46, Krzysztof Kozlowski wrote:
> On 14/10/2025 17:40, Kamal Dasu wrote:
>> On Thu, Oct 9, 2025 at 10:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 09/10/2025 23:20, Kamal Dasu wrote:
>>>> The broadcom settop SoCs have hardware semaphores as part of "sundry"
>>>> IP block which has other controls that do not belong anywhere else.
>>>> e.g. pin/mux controls, SoC identification, drive strength, reset controls,
>>>> and other misc bits are part of this block.
>>>
>>> This does not explain why this has to be a separate block. Rob comment
>>> stays valid - this belongs to parent node.
>>>
>>
>> We do not have a separate parent node where this will fit in. We have
> 
> 
> So what is the parent? simple bus?

Ultimately yes, there is a parent node which is a "simple-bus" but what 
we effectively did is break up the "sun-top-ctrl" node into register 
ranges that are on 4 byte boundary, because the functionality offered in 
that aggregate is partitioned on a 4 byte boundary.

Now, we could utilize the fact that the node has been exposed in our 
Device Trees using a syson:

                 sun_top_ctrl: syscon@8404000 {
                         compatible = "brcm,brcmstb-sun-top-ctrl",
                                 "syscon";
                         reg = <0x8404000 0x708>;
                 };


> 
>> the DWORD aligned  register defined here as organized in the SUNDRY
>> block.
> 
> 
> I don't know what SUNDRY is.

https://www.merriam-webster.com/dictionary/sundry
-- 
Florian
