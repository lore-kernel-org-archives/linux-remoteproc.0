Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F60399358;
	Wed, 10 Jun 2026 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082867; cv=none; b=a1dzat8jb+8MgJZtnoNp78eV2scbJg5vPeZ3P6b57hLyNnMapbq4z4g347KYAd4fyxV96cVaf9MGXa0WlCGiPoZIGxLQCl48eQH2Zhmc+eFN8SU8NyIx8CkQvp+OablU3ZiMs1pnnz9ZirtbG1cFzPcuuTQLektc1csQMRxw3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082867; c=relaxed/simple;
	bh=Su2g6xxlmcA0BfDo/FxGGSZUO07XTGxPyGU7YINLNbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0j/CySIs1foSkrrFSeFz1Y3IVQH4QvrDFmFSy+9qEjDGbosiaZ0YsZf6dlwvMn3d0aih45d6eeFV6GUirNJVqHG6girG0A6v7A6c4aHjHMsA1BOKJLaDCSqGLzjQvbZ9mnESqrDtoCLYaHu+MyvmF5laPtZJCwxEqbxEZEelIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cef4/8iq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cef4/8iq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C351F00898;
	Wed, 10 Jun 2026 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082865;
	bh=aN/Cp+ThkwaknSIc3DIlddMyUfF7OTN0+hAp5wJoOIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Cef4/8iq0wTRlqxO6O8ZgCj1XALuP+G8klNrmQ4rsoU6vxVqDrvr43NLhKxxSu+hd
	 +R5enCvIkL7OG7rPfwFEHw5Bqc13YS8Ao3cNQVn76CCIawr+qc+bBkVSKRU7BzajXf
	 qC05/UaVVBj8akrvOImlgXyF9yeVjgdh0UD8v7Pyks98uk56+ux4D5n9vEwyZxD4iG
	 7uoJNLP6Am+vryeKmg9QvBDJxnBELWDcpjamoVUILFc6oWcYjS5IFq++JzoG+QtacL
	 f/0dZAklYOSveyfpqh6INcVKp/1uFGPZHrUkoZx2qNSl3c/zoGRF0uafzDhsnIrxaq
	 4TVog9DsVSMnQ==
Message-ID: <eaa34b4f-4e57-4e5c-878f-4568daad5430@kernel.org>
Date: Wed, 10 Jun 2026 11:14:18 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2026 11:10, Laurentiu Mihalcea wrote:
> 
> 
> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
>> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The names of the carveout regions are derived using the names of the
>>> reserved memory devicetree nodes, which are referenced using the
>>> "memory-region" property. This adds a restriction on the names of said
>>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>>> specification's recommendation, which states that the devicetree node
>>> names should be generic.
>>
>> No, it does not. Names like rsc-table feels exactly like DT spec is
>> asking - for a name matching purpose. Are you sure you read the spec?
> 
> Quoting from the spec:
> 
> "The name of a node should be somewhat generic, reflecting the function of the
> device and not its precise programming model"

And read the rest of the spec, please.

> 
> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
> wouldn't "memory" be a more appropriate choice for the DT node name instead of
> "rsc-table" since it's more generic, while still matching the purpose
> of the device? Or perhaps I'm interpreting this the wrong way?

You just took one piece skipping the rest. Also binding in the dtschema
repeats that.

> 
>>
>>>
>>> Fix this by documenting an additional, optional property:
>>> "memory-region-names". This way, the carveout names can use the values
>>> passed via "memory-region-names", while keeping the devicetree node
>>> names of the reserved memory regions generic.
>>
>> I don't see how anything here is fixed. memory-region-names has nothing
>> to do with node names.
> 
> The idea here is that the names of the carveout regions can now be passed
> via the "memory-region-names" property. Previously, we were using the DT
> node names for that.

memory-region phandles give you that, not names. You need to state why
this is not sufficient.

> 
> Thus, we can now use the more generic "memory" name for the DT nodes since we
> no longer use them for the carveout names.

That's wrong reason for doing this change. Also random names here change
nothing.

Best regards,
Krzysztof
