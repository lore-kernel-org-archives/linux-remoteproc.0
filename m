Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5A224258;
	Thu, 20 Mar 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466830; cv=none; b=QwqdYNbvaUF2rwkx1h9Mzy9maQ7hPIhHtXVEj9VOf0+COQg6SvlUBxBO3ehuqzfTz+QoSHMP1o8KGqxLSdHYDH7aDTc3XJvQXVy5DGd+c8y2/BFSm1IOLvgLQXDeeq45jTQwZDjko4m1cD/DPb2r9SBjNYl/T1tFUANjH/NSY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466830; c=relaxed/simple;
	bh=B9Ki//9iYq86oCfYqOWVMz9KXkrveoc2XfDUrCHNllQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EohmotPBIVRtpLA7yY2PQpZqxOPsZU+lZo1MVN2PUVTy8ByH348SSwJ+XVqXMgIXorg5WSMmtDGjqj6kTGdIWWY7EmPcqLNKBGXCbmXM8OgOaRXQvezebgY6Jd4mx2ybOfp2cbZB+meeQWs12vO8bgZYCkbpdkaPjTUMkrX3mys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ldQ15eiJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ldQ15eiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742466826;
	bh=B9Ki//9iYq86oCfYqOWVMz9KXkrveoc2XfDUrCHNllQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldQ15eiJXcEsRMalSLnsahQv69s8e8pN3qsq9WHFWXn19xqHqaQ3fCQTdDdFoz737
	 qMRwdWerbkjoOoE40e9hXTQ3K1+Uzl65qR4VnM4E7HSyn5aDWa5yp650QohTGcWdLe
	 u8bt0u7X01Etjfy4J9PHJRNMjcMJjqhcET0tiJ+BOMm3RLKoFXm52ZiDZ28v61OdY9
	 FnHShgeoRUWg0hK1jLLhSqL0CqNbmzf+zTsOqMfjpevqI2NAbHlNmRMG1PQpPzhnPe
	 i1j/ApT8t8C5Vs5ScJMi2chBF85OW5PBtr7VvOdjuQZ0kw7d6X7zZ936PoTJddgQxL
	 YuPJig8zspprA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 011D917E0D66;
	Thu, 20 Mar 2025 11:33:45 +0100 (CET)
Message-ID: <be4af783-3b98-439b-be3d-30d6ff520d2e@collabora.com>
Date: Thu, 20 Mar 2025 11:33:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 =?UTF-8?B?T2xpdmlhIFdlbiAo5rip5YCp6IuTKQ==?= <Olivia.Wen@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
 <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
 <b0872ee008c3c6a2731f949d8c2be77aa49341f7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b0872ee008c3c6a2731f949d8c2be77aa49341f7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 20/03/25 02:28, Moudy Ho (何宗原) ha scritto:
> On Wed, 2025-03-19 at 10:34 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
>>> The SCP present on MT8188 does not have an L1TCM memory region, but
>>> the
>>> binding incorrectly requires one for the dual-core description of
>>> the
>>> MT8188 SCP. Remove that requirement. Also update the minimum number
>>> of
>>> reg and reg-names to 1, since as this is a multi-core SCP with no
>>> L1TCM memory, only the CFG memory region is present in the parent
>>> node.
>>>
>>> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support
>>> MT8188 dual-core SCP")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> As far as I know, the L1TCM is present on MT8188, and it's at
>> 0x1070000 len 0x8000
>> exactly like MT8195.
>>
>> Moudy, are you able to please confirm or deny that?
>>
>> Cheers,
>> Angelo
>>
>>
> 
> Hi Angelo,
> 
> Unfortunately, during the transition from MT8195 to MT8188, the SCP
> removed the L1TCM, retaining only the SRAM and config register.
> For detailed hardware changes, you can refer to Tinghan's previous
> description at the following link.
> 
> ref:
> https://lore.kernel.org/all/20220715051821.30707-3-tinghan.shen@mediatek.com/
> 
Thanks Moudy!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
