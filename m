Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73F286409;
	Mon,  5 Jan 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597039; cv=none; b=hoCHOGhq45ACEgC5R0nlPF7gX8H4HcBaswnBPE6uwJN6WaxHQNXJ0nKeKSDNJZ1hn6g9oWp4K/XwAZ/OGAInP7R4m1+vznx+v82l5OQ2Skr8Jn8MfF4RPwkLlKGMlzsa5fNwPyo+T9vZXrQhPNFSAuZsRB6FLpaqmi1MauyTbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597039; c=relaxed/simple;
	bh=Jq6lC7J1hp5isWtbeLH+lVSu/0ovVR2aVFoAtsWHH3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX8bgMaXE3Dz6YDbFZUiSfLgdysbF/pRvcLXSC3zZR+JLwJWCdF5+FMGwiQnMnOM/wMsDwVIkLv6FEy/KdmXTKAaY/VUPQCWnqUZL+SrVIRl8ZjjbWsxc3jWY4LHV2cLnbAHauP9VslONBGJorTN4ITm5SHiKFSEws/sQZo6BeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIrJDduF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIrJDduF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02D4C116D0;
	Mon,  5 Jan 2026 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767597039;
	bh=Jq6lC7J1hp5isWtbeLH+lVSu/0ovVR2aVFoAtsWHH3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EIrJDduFhLWhg1BM1TN2AQlXlsxTSjDz4N4CXdR3QuIjWvZlV6FwdqH/YFwbNchx2
	 dHFePLtKlY6n1kyDznCUVq4d1cbK7PsHQ/fROGkFls890LXlDRfD7gneHzWjGFJmgv
	 yWy2iv8q1Si9pBEgqr+4HJH62IYkYyPoLI2vKltjgBFsOzbccjK8CqkazMskiSj9nY
	 wI/SxyH4bHtBK8VBhMsh7QRtGv5lEt0+3oxzS6X72eKg9nw1pLY5olmw+Ii2yvjyfs
	 MjyBQwkvVCZuMCEXH7M1YyPSj7F1S+Y0PNG1Q+zP1iACKVhvkoqxURIUFoF228ZLkU
	 /CSHuWuQKzTCQ==
Message-ID: <18a350ed-bf1d-4700-81b0-02e1c2b85493@kernel.org>
Date: Mon, 5 Jan 2026 08:10:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core on
 TI K3 SoCs
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251231165102.950644-1-b-padhi@ti.com>
 <20251231165102.950644-2-b-padhi@ti.com>
 <20260102-shrewd-unnatural-lynx-b7d214@quoll>
 <3ac93229-3c37-4800-8e56-cbab13d4299d@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3ac93229-3c37-4800-8e56-cbab13d4299d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/01/2026 06:56, Padhi, Beleswar wrote:
> 
> On 1/2/2026 6:00 PM, Krzysztof Kozlowski wrote:
>> On Wed, Dec 31, 2025 at 10:21:00PM +0530, Beleswar Padhi wrote:
>>> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
>>> core in the Wakeup Voltage Domain which could be used to run secure
>>> services like Authentication. Add the device tree bindings document for
>>> this HSM M4F core.
>>>
>>> The added example illustrates the DT node for the HSM core present on K3
>>> J722S SoC.
>> A nit, subject: drop second/last, redundant "bindings for". The
>> "dt-bindings" prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>>   .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
>>>   1 file changed, 79 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>> new file mode 100644
>>> index 0000000000000..f61e4046843af
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>> Filename must match the compatible. Are you sure you are following
>> internal TI guidelines? Did you read them?
> 
> 
> Will address all comments in v2. Most of these issues exist with other
> upstreamed TI dt-bindings as well, will send out a separate cleanup
> series for those too.

This was not my question. Are you following carefully internal TI
guidelines to avoid common mistakes?


Best regards,
Krzysztof
