Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46431CABA;
	Thu, 19 Sep 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740279; cv=none; b=szDETeYX2k9LwJvf2GNTg6K2RsR8mQGr2RIEcuUjRQJYJkB5aEg7YV54CNv5NhyfBY0xeO9IBE2WNLU0sxHmg6fcd2grCWdfIe8hSPaWvTp2igao8yRsyeTzn8TBxLlzbpCYnhfR2DKFpdxjlqTvZZMWyf0pGAyZbC4cNuUaYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740279; c=relaxed/simple;
	bh=VJ/w9KvYWfGEMh7f+UtSWlzn3vMDtAd5TpcQAK1f8H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwyYColQ+iUiPKhdGZ2x31lF2d9R4sCTPcAI1oU8iAJFQugq1nvA0qXR+/fBosOGMfTT39mOuzhBJOwYz/tUOwwQAEYD8S7Q3VNWj/FImffbDjBByf7NATpPFY2YNZEibBu9fsjSOhEpcPSx3KcavsqXZHXYsZizlppHSiqSwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbWjCrAX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbWjCrAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A990C4CEC5;
	Thu, 19 Sep 2024 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726740279;
	bh=VJ/w9KvYWfGEMh7f+UtSWlzn3vMDtAd5TpcQAK1f8H4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pbWjCrAX6MIJAuIY/EXYHRWcDufaMM8WC6X2qQ0vq0zd4pCojdNk+zcE3UpbUSVw5
	 nwsU8ll11W/G11h9EXaXbRGsfUcqG7dt9t2KuDesAG1fMYNjuVbj0YFbTrU02RlxHt
	 Gvqogw611UvI+rO5KV07Avgtf/jZ82r+V2/ENzluFdVP1PiqZei3lrk7GmxxdhZ3JA
	 HvMzGlSCPHnN0tCVfu6kpU3SaYfP/2ysREZV4seeYdJ/Ellmw1Iu5roTueljHM9mMd
	 m972maQOdR+hf6ywvaXTMm8NI85JfGAua0jg6u0JPXaF+hA3zvfr3PU734+9x72xcp
	 E5iGN6ksZVQgg==
Message-ID: <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
Date: Thu, 19 Sep 2024 12:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
 Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org,
 sudeep.holla@arm.com, robin.murphy@arm.com
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240919093517.GA43740@e130802.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2024 11:35, Abdellatif El Khlifi wrote:
> Hi Krzysztof,
> 
>>> Add devicetree binding schema for the External Systems remote processors
>>>
>>> The External Systems remote processors are provided on the Corstone-1000
>>> IoT Reference Design Platform via the SSE-710 subsystem.
>>>
>>> For more details about the External Systems, please see Corstone SSE-710
>>> subsystem features [1].
>>>
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets.
>>
>>> [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
>>>
>>> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>>> ---
>>>  .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
>>>  1 file changed, 90 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>> new file mode 100644
>>> index 000000000000..827ba8d962f1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
>>> @@ -0,0 +1,90 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: SSE-710 External System Remote Processor
>>> +
>>> +maintainers:
>>> +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>>> +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
>>> +
>>> +description: |
>>
>> dt-preserve-formatting
> 
> Do you mean I should remove the '|' please ? (I didn't find examples of use of
> dt-preserve-formatting in Documentation/devicetree/bindings/)
> 
>>
>>> +  SSE-710 is an heterogeneous subsystem supporting up to two remote
>>> +  processors aka the External Systems.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - arm,sse710-extsys
>>> +
>>> +  firmware-name:
>>> +    description:
>>> +      The default name of the firmware to load to the remote processor.
>>> +
>>> +  '#extsys-id':
>>
>> '#' is not correct for sure, that's not a cell specifier.
>>
>> But anyway, we do not accept in general instance IDs.
> 
> I'm happy to replace the instance ID with  another solution.
> In our case the remoteproc instance does not have a base address
> to use. So, we can't put remoteproc@address
> 
> What do you recommend in this case please ?

Waiting one month to respond is a great way to drop all context from my
memory. The emails are not even available for me - gone from inbox.

Bus addressing could note it. Or you have different devices, so
different compatibles. Tricky to say, because you did not describe the
hardware really and it's one month later...

Best regards,
Krzysztof

