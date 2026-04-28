Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6723EAB7;
	Tue, 28 Apr 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381935; cv=none; b=B1q3ddsG1rrnOfh3CN39inAZr/Qtef93DOevV3vR1xlL+nw80H4GLymE0R1lMl34TweOA3lh1P2PCqMAICrpmSWjk9GhLAihVcKBM7hagnt5iXqnDjs0HkNZI66SZysM7HThhpR6Zw9tckE+wiToooGHkOKaiZkJiKiOw9ag6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381935; c=relaxed/simple;
	bh=oW56JoPmFIS1i2yPhNaXLijroc14e37zIFPihlQOMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/3lS8gE8Qn8TBJ8XupAsWEVNTyOav5tKDNWt5eXbZ6fM5md8oh/El3p2Cf+PNR9llUijB9ukCJQY6/yNEkNfH8fWVPRaz7hks4+7Uq3b2kfG1zvh+51fbrRn5siskwoC0Z8K86cXag9oAWJNA6hm2ZlybDNToTjL0dDvxRERdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElKJwPIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElKJwPIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C66C2BCAF;
	Tue, 28 Apr 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777381935;
	bh=oW56JoPmFIS1i2yPhNaXLijroc14e37zIFPihlQOMSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ElKJwPImf5Upii6Z79TOzchXD4rG6CnZVMUQ2QQG+VXiUGjoBJMYbeJNod9IEIwCC
	 XR3Hne61aEXBi4F0nyqMxOmfsW67bXBfkFhqkULD1E/aLnr5ZGxVrZYblqfsiXJnZu
	 FXaSoZprxKSmiLXKH4Uo5HTkpHqK3b/2+MWaOJ4Ku7Kqai6/mesbDzeumkmvpXADXW
	 099r/HXbLZ9/BaydnVQWR6UW1SLgMciAGuSD5Uk6250KwUBNCZ3nj/sI940B2OxEr6
	 uAZOWhg5wXfR3PAtVeu6PjtKOuitgipATKnp1uC6cgJpCuYWFyqsSD7NyAWI02rETi
	 f0yl4eZYYiD9Q==
Message-ID: <b8193657-65ba-422b-b207-a75de419cd65@kernel.org>
Date: Tue, 28 Apr 2026 15:12:11 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <c2ee8499-2ba2-42b2-bacc-18166135abbb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2026 15:09, Michal Simek wrote:
> 
> 
> On 4/28/26 11:14, Krzysztof Kozlowski wrote:
>> On 28/04/2026 11:04, Michal Simek wrote:
>>>
>>>
>>> On 4/28/26 10:47, Krzysztof Kozlowski wrote:
>>>> On 28/04/2026 10:33, Michal Simek wrote:
>>>>>
>>>>>
>>>>> On 4/28/26 08:50, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
>>>>>>> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
>>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>>> execution.
>>>>>>>
>>>>>>> The binding models a soft-core processor subsystem instantiated in AMD
>>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>>> execution. The remoteproc device is represented as a child node whose
>>>>>>> reg property describes the firmware memory window in the processor-local
>>>>>>> address space. The parent bus node provides standard devicetree address
>>>>>>> translation through ranges so Linux can access the same BRAM through the
>>>>>>> system physical address space.
>>>>>>>
>>>>>>> A clock input feeds the soft-core processor subsystem, and an active-low
>>>>>>> reset GPIO holds the processor in reset until firmware loading
>>>>>>> completes. The firmware-name property is optional.
>>>>>>>
>>>>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>>>>> ---
>>>>>>>     .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>>>>>>>     1 file changed, 98 insertions(+)
>>>>>>>     create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..f16657dc0d9f
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>> @@ -0,0 +1,98 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: AMD BRAM-based Remote Processor
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>>>>>> +
>>>>>>> +description: |
>>>>>>> +  Soft-core processor subsystem instantiated in AMD programmable logic and
>>>>>>> +  using dual-port BRAM for firmware storage and execution.
>>>>>>
>>>>>> Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
>>>>>> completely different thing from SoC and there is a design WITHOUT SoC
>>>>>> using this remote proc?
>>>>>
>>>>> In 99% case this is going to be used on Xilinx SOC with programmable logic next
>>>>> to ARM core.
>>>>> soft core means - means VHDL/Verilog code synthesized to programmable
>>>>> logic/fpga. It means exact location in chip varies based on build and constraints.
>>>>>
>>>>> hard core - physical HW location - like ARM cores in our chip.
>>>>>
>>>>> (ARM is providing RTL/code that even ARM cores in fpga emulated platforms are
>>>>> actually used as soft cores).
>>>>>
>>>>> Not sure if you want me to talk about that 1% use cases which are also possible
>>>>> but don't think anybody will design them.
>>>>
>>>> Then I would treat it exactly like every other block of a SoC - you need
>>>> a SoC specific compatible. If there is a fallback, SoC specific
>>>> compatible should be used in the fallback as well - that's all already
>>>> documented in writing-bindings.
>>>
>>> But which SOC? We have ZynqMP, Versal, Versal NET, Versal Gen 2. And all of
>>> these will use this configuration.
>>> Do you want to list all of them?
>>
>> "Then I would treat it exactly like every other block of a SoC"
> 
> No issue. Here is snippet.
> 
>    properties:
>      compatible:
>        items:
>          - enum:
>              - xlnx,zynqmp-bram-rproc
>              - xlnx,versal-bram-rproc
>              - xlnx,versal-net-bram-rproc
>              - amd,versal2-bram-rproc
>          - const: amd,bram-rproc
> 
>    The example should also be updated:

Yes, except what I wrote earlier and is mentioned in the writing
bindings doc - the specific compatible should be also the fallback.

Best regards,
Krzysztof
