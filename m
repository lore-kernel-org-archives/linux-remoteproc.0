Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB2B7081F;
	Mon,  1 Dec 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606162; cv=none; b=fy/lyFSykQWNx2dYnLcl7TIDjAZQ/vDGixTJ4lZCE2XGkW00rpbaOvEAjc32K1JEXdQIr2Qzvu5zNr46SbqnNvqMk26EKoEGBVDEDULycVIJmDsQH0w/0MmqtDTTQhvcgvTmAxwfb1TegN9bEiE8tprDe2qa2rvo/wOz3A+lFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606162; c=relaxed/simple;
	bh=r85JsunWmzVcpkVTxljVo7UGHdDjxktOk1tuBHycIDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0j+xvCX+LMKTidnJhGG9TKLDKr582+ODHLfV88wtiUJDkpqJUtg9PWE53JWtaKL+y0b9XyKq6+co0VPtUIOlwDtrOZz5Y5mwos7ix8sOVaEDS2E3T4g6U1SNwK3+7zdCz+cBXacQqOgWE1240E8K8RtEFxRMNHHlvLxxpuGlRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3Bn3s86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3Bn3s86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C42C4CEF1;
	Mon,  1 Dec 2025 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764606162;
	bh=r85JsunWmzVcpkVTxljVo7UGHdDjxktOk1tuBHycIDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O3Bn3s86/DHt712xrGvIivq8dvdEduYK2YI/CMMMMRT9zX1rw81+EKB19MMzmCSI+
	 F+n9UAR+8N+UkKYPdNCDrqRfncBuDw4CbzM5/lVwnpqrhe4Gidxmcov9qxIqatJc0Z
	 LAfxvuEHlZb9mBk3GZsJQMMhjrPToY0TuyOtVcCXu/EYxRe7KFwulnqj/Kt3aom/Oo
	 xeRHa4P6lqh87Kx1Vj007vLXthLaWWb68uvI51hqwZwgRdHOkI0R+GesuLcU3Hrv9l
	 QmIYJQLdpNrmpDy3N9dX6AaRBHuFUuF883tmu78dwi4daDqfdtbmZyVMfsNSZQEMpx
	 /dWqkXIT/fCdw==
Message-ID: <3425c0dd-8c3c-4780-8d1b-494f38282c46@kernel.org>
Date: Mon, 1 Dec 2025 17:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
To: Valentina.FernandezAlanis@microchip.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
 <20251125-aromatic-savvy-eagle-b81696@kuoka>
 <3e9f2caf-e3c6-4b59-b4e2-431e796399d7@microchip.com>
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
In-Reply-To: <3e9f2caf-e3c6-4b59-b4e2-431e796399d7@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2025 17:04, Valentina.FernandezAlanis@microchip.com wrote:
> On 25/11/2025 09:46, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Fri, Nov 21, 2025 at 02:21:56PM +0000, Valentina Fernandez wrote:
>>> Microchip family of RISC-V SoCs typically have one or more application
>>> clusters. These clusters can be configured to run in an Asymmetric
>>> Multi Processing (AMP) mode.
>>>
>>> Add a dt-binding for these application clusters.
>>>
>>> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>>> ---
>>>   .../microchip,ipc-sbi-remoteproc.yaml         | 95 +++++++++++++++++++
>>>   1 file changed, 95 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
>>> new file mode 100644
>>> index 000000000000..348902f9a202
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
>>> @@ -0,0 +1,95 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip IPC Remote Processor
>>> +
>>> +description:
>>> +  Microchip family of RISC-V SoCs typically have one or more
>>> +  clusters. These clusters can be configured to run in an Asymmetric
>>> +  Multi Processing (AMP) mode where clusters are split in independent
>>> +  software contexts.
>>> +
>>> +maintainers:
>>> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: microchip,ipc-sbi-remoteproc
>> This should be SoC specific compatible.
> There was some discussion on this in v1: 
> https://lore.kernel.org/all/20241015-distrust-chatty-9e723e670fef@spud/


I don't find anything from that explained in commit msg or device
description, so next time you send you will get exactly the same comment.

Best regards,
Krzysztof
