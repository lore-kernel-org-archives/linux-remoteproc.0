Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE6441C301;
	Tue, 28 Apr 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382935; cv=none; b=dkZaHGGKBQN35EM9OUaPqZpHRgEm9HRcRUrkd4qe/ohcTxiznfkTJ0p0Bc+5cxPZZCnES2kKPfKXJImeeCocY2Y9bv50IR7Iai2dCD68XppjhlUlg41y6dXGgT69xSUhhgaPM+r1Rq1YFVcBdBLhmJrigvEXYwzBSZBnbt3+N2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382935; c=relaxed/simple;
	bh=S1UnlINMq5PbX42veAN/jFJ8Q9sWwkb9dbjfLlQLLZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEYz+CnFVFRAzIHybb/B5AGHea8hiylbVyWcCHoxVsSC84oTiX2EjSA9he+tEn6ZR1jvX1gprWAwi7oThFDR7v52LH8s2XsOkJXXDYX/MgcpXJxMTFfaRNKC9KQZE0E5A7WhKM0EOmzZJ0Pl3DADIXQomHx0rgj/R3f7FyAvA2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0HtDSTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0HtDSTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E81C2BCAF;
	Tue, 28 Apr 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777382934;
	bh=S1UnlINMq5PbX42veAN/jFJ8Q9sWwkb9dbjfLlQLLZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C0HtDSTTd2USl9zhTg3uy5vGh9EVtFGPEU1OiIuExH9zlceQ9qe4Eeb4gUBJQR/3s
	 Ivm0yIPlAZj+fA0ZORWSDRjZJCYB8BumUmFN22PHs+OjmLsL/qOsaDhLcCpqUJDhqD
	 78qnzPkAG30TdKJ1JCq2FK/1dI/PNcmq/DwvJzOTz65jQYUhVkeY2ymgc1m/Izolyg
	 wKw31dcaExJ6PT+lIgYKrz2sMczHNMcMuvHeIAgdnXsSIXdlaH5c8Q8Tcm+0VJqrnX
	 668QpRZRV7dxzUJLbcHDhrdYBdtg50e5fEmtEuxXUlh1hDMI9uAIBRpxi262FWf/P5
	 kib7WYoNb0ORQ==
Message-ID: <b29fc356-0c5e-4418-9d3f-c04a2c0f7957@kernel.org>
Date: Tue, 28 Apr 2026 15:28:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
To: Michal Simek <michal.simek@amd.com>, Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
 <20260427162703.1644103-2-ben.levinsky@amd.com>
 <20260428-curly-hyena-of-triumph-fc1f4c@quoll>
 <68cf4479-c6f5-4947-bc75-df9be73644d3@amd.com>
 <998b67ff-192a-478f-a9c6-ddcd7773e27c@kernel.org>
 <86e464f2-974b-441d-9459-dd957c16993d@amd.com>
 <5ded8bbd-11b2-4552-80f5-972df15dc6e0@kernel.org>
 <c2ee8499-2ba2-42b2-bacc-18166135abbb@amd.com>
 <b8193657-65ba-422b-b207-a75de419cd65@kernel.org>
 <a6a231e5-ee87-4045-ab16-8acdd4937f42@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a6a231e5-ee87-4045-ab16-8acdd4937f42@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2026 15:18, Michal Simek wrote:
>>>
>>>     properties:
>>>       compatible:
>>>         items:
>>>           - enum:
>>>               - xlnx,zynqmp-bram-rproc
>>>               - xlnx,versal-bram-rproc
>>>               - xlnx,versal-net-bram-rproc
>>>               - amd,versal2-bram-rproc
>>>           - const: amd,bram-rproc
>>>
>>>     The example should also be updated:
>>
>> Yes, except what I wrote earlier and is mentioned in the writing
>> bindings doc - the specific compatible should be also the fallback.
> 
>    properties:
>      compatible:
>        oneOf:
>          - const: xlnx,zynqmp-bram-rproc
>          - items:
>              - enum:
>                  - xlnx,versal-bram-rproc
>                  - xlnx,versal-net-bram-rproc
>                  - amd,versal2-bram-rproc
>              - const: xlnx,zynqmp-bram-rproc
> 
> Good now?

Yes, looks good to me!

Best regards,
Krzysztof
