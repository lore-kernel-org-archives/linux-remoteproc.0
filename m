Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6F23504D;
	Mon,  4 Aug 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298715; cv=none; b=U63FYwD0QVvLPdxXgkKD/sn4DkMs4ximCr3dAvMcgwBxsA7d2DLNhjx6HfNpSBwkKK3h7nc6B40vo/t8QEjMpyy/Q8L/+nJknpKm9qTkDzqieeXpXcuS/abBQ9gggWroCAQKqhguyYIGZfm/12229a2NrZrRdSm7EaYWrdjFdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298715; c=relaxed/simple;
	bh=YnsMfdLjcDCgGeySl/UQPr+JHC4sH1YnSBxgawRw09Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJyJlHWnGKwjKKzhTcHAXYNEaTiM6wvycjPWjOvhDEurZdXW9QXOb6Ep2iPcwysvReumJsl0NcBuoZTY2pWBZuaVqUMgmPzYvIZ1xsw9uhcF+vUqeo4Iiwg8tdaqcdW5R8xfVVs9tqYXOGbd968/TFpTZAkjyLos2AdD7Ak1XBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gZcp4SPH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gZcp4SPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298712;
	bh=YnsMfdLjcDCgGeySl/UQPr+JHC4sH1YnSBxgawRw09Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gZcp4SPHYouq9Etf4mL7vq3VQgp8dS+SPag7yPgZmr2wQLaHT8qIoLRYzVpSBMWKf
	 T+CwwbHNtpn1U5Ua2rIt4LzHpcg4gbelmhmTmif0lNmHPxPS6R3Eu0J3H3XphS4kno
	 r04/FfzhBOgECelzSDfKAHhvaU80k+3j10qK8EH6Tojd3BX1ZoIU5IjUf72KQ9bfl6
	 TZSmqSHBe2dSEhmI+g4fnmL3oZ/GS5uF0SOuknTXfwLg76zW2pSWQHr6XMpVMUxLnT
	 fIYOx0jRzBsqmXTLhYFiYdXm+UAIJbfKzhL0+PLzWZlMCbKkzP1bDaSAH1o56qHrpJ
	 Hw1q46HbFdE7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E8EB17E048E;
	Mon,  4 Aug 2025 11:11:51 +0200 (CEST)
Message-ID: <b6311035-9699-4f59-a3fd-8e1114ba9e0d@collabora.com>
Date: Mon, 4 Aug 2025 11:11:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
To: =?UTF-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>,
 =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
 <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
 <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 04/08/25 11:10, Huayu Zong (纵华宇) ha scritto:
> On Mon, 2025-08-04 at 10:27 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 29/07/25 04:31, Huayu Zong ha scritto:
>>> Add the compatible for mt8189 SCP to the binding.
>>>
>>> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
>>
>> Is MT8189's SCP really single-core?
>>
>> All of the new SoCs have two SCP cores - it's a bit strange to see
>> that 8189 has
>> only one... hence, please triple check and confirm.
>>
>> Cheers,
>> Angelo
>>
> 
> yes. On the 8189 platform, the architecture design of SCP is a single
> core.
> 

By hardware, or because the firmware uses only one core?

I'm asking again because this happened multiple times - with MT8195 and MT8188.

If this is by hardware:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


