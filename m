Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6F1A3178;
	Fri, 18 Apr 2025 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965821; cv=none; b=dONAOuiLzOyW1cxwesnJ5XG/oh8dmh0g5owMv5IiBwUkwVPOw8YxEwQaN71IfEEKCfHKaJe7ed4rcxNWapPKqHHQsEdb5vbb7ur3kkUFJjuh0mAXfx2PTR5Q0zOKgXHHcGZPqM5zCqibXSYEzYSOmC34VETDOQTq4LE0prWvRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965821; c=relaxed/simple;
	bh=rM5eZAwM+lkgkoP5sejzA3v4JK1mhsyQHalBXqeI3fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrVgL2YSvWYUxTS1a+3QdnkK6ovVaxRcri67JtWNBl7e1D75PwkkscfkASfT+ofe0g7JP0856plQxYckBZFm8x8fPGfQK3U0g43Y2c25tbghtB5Ff0DO6AwDMs4KE/FK4J9oEAXDYc5dDA0U9Zm6EBFOPTRGq9lkEbJzMBRswCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bv68wFqy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bv68wFqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744965817;
	bh=rM5eZAwM+lkgkoP5sejzA3v4JK1mhsyQHalBXqeI3fQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bv68wFqySxgo/O774W4jNvf7YUlx0ykynSscT4gIZ1ZthGNwIorfkkTgWRyJ1mNqC
	 EmUt1SJUT1zNQ1B7i1KAWNnBsx2l6LwpasSop2nEWLwoSGsebuSjaP7wgeB5U/Xb9l
	 uEy8jVOpj2OhBWnlRg5ufQqWdHpo0nzKqFS3jVUVETATfoahWg419LtagdN7bckgD5
	 2BJr/6zDJFtm22ukPDVuZ9Bqe8vk2LvrKixWCH+UEdNr82sQUb+Y0nbqVj5Ztn2fV4
	 85/F/zyHkK3lMvcSTcIbI0cS1vj0ZSZs4y50KEV7DzSL+RhzYXkAa6xIWr9pxw2hh0
	 VDbZtFhagJJcw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25C6517E08E3;
	Fri, 18 Apr 2025 10:43:37 +0200 (CEST)
Message-ID: <e783eced-114f-4fae-8ec4-fd665b40f837@collabora.com>
Date: Fri, 18 Apr 2025 10:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
 <3fa1573d-e3b4-434c-867d-38fa69ad3a8e@linaro.org>
 <7ab084b8-e77a-4881-a6a6-057b89613fb4@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7ab084b8-e77a-4881-a6a6-057b89613fb4@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 19/03/25 15:25, Nícolas F. R. A. Prado ha scritto:
> On Wed, Mar 19, 2025 at 08:16:37AM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2025 23:22, Nícolas F. R. A. Prado wrote:
>>> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
>>> in reg, and therefore reg's minItems should be 3, as is already implicit
>>> by reg-names. Override minItems to 3 for MT8192 and MT8195.
>>
>> I think that was the original intention already, because reg-names are
>> expecting min 3 items. Basically you just correct the missing lower
>> constraint.
> 
> Yes, exactly, that's what I meant by "is already implicit by reg-names".
> 

Nicolas, any way you can respin this patch so that we can get SCP for MT8188
in this merge window, please?

If you cannot do that, I can respin it on my own, no problem.

Thanks,
Angelo

>>
>>>
>>> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> @@ -185,6 +185,7 @@ allOf:
>>>       then:
>>>         properties:
>>>           reg:
>>> +          minItems: 3
>>>             maxItems: 3
>>
>> maxItems can be dropped.
> 
> Sure, I can send a patch for that in the next version.
> 
> Thanks,
> Nícolas


