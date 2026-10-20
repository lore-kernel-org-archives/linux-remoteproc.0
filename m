Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498707;
	b=nz7g6S2eMB0ZKOYtATV+gYlll+Lfclr+s3MNtob/HV5yAq5DR3gsCeq4ix6lJcc2B3e5
	 2O/xkwpb2K0oMySf03aPBEuRiRJ6kviIjftxHoyZHMLyQRjnWEbsncViIDl0m89py3XxK
	 ZyLdPyAtCriBaET0QUTi5Nkua3Wo66QRV1Jfm3eO/GknLvI45QLPUk002N0kNG1jUNH3U
	 BOI43o+S73+BARDD8jBiNY00OsLFsMp6WSAtVZnIWjlz06dHqyH+Zm4Vj/B+srynPVAb3
	 HgY07O3ffk+ff8NxpVQr3jcwn9LSh0AVRKi8yINEBmambAA0pyeFNgbTF+cV1o4rweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498707;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yU6o+keIiSw29Qh3qTy6Rhe4KIjjNbDeXyqpDu2XIrY=;
	b=SdwV3Wm9Ktm1vSJMfRwKOTr1/otWDkCTsgVB07e+fYXYGIO1oMD2Le/dQl+R4Bm7x5vr
	 6vLbTopcJcuNFSafJyZQ7ykTRucwz9F5SprhAcgvcQ/6dUMFoy/k+mrsDT8KcJhDWY1Jq
	 QVwiVF3d91ROkhO0JXf0aJx4/ZSw2rG4MdppR0ybQaO13YQiEnQzu5reEPwti7XNiDl7y
	 BqKKHupyMdFcBi92vDrDTXK+gDLtnDSH3jBhVByR1Xib/9VjjavA+N9YCyewABVmfOrkX
	 0ZJCYgxJoH0EZc+9BITMxGAuvLTs/hUlzQ1xZe6yxUISRuvJYRx81LCeDvjK/fSbebw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9Zyp8h3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FE606A31B;
	Tue, 20 Oct 2026 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9Zyp8h3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289B31F000C4;
	Tue, 20 Oct 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498706;
	bh=yU6o+keIiSw29Qh3qTy6Rhe4KIjjNbDeXyqpDu2XIrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y9Zyp8h3kzMOtJAUw6zQMoqzKWJZaxancFv93lkG3Tdv35/8/+g5n/FCeYZ8pczdJ
	 FHiQxy7U69KaSDoFYFOulTz3zVvBdF7xA+U/6BvNbgZSln5iATJcbMelazyB07unGr
	 UfSegyHFTspPt/gVEaOJgSED7O6ieY29vJk5KfxEC/frmyInD6LkQQThT3DZBrWK1d
	 SXVmhgq67s2YGJfdZBrw+pupFAsVFGgDzbjwTGbyxEYPZZHHCQsXUkzuivZNTtkxph
	 FeFnB+8M+UOQzmSyU4q3N+DWZySe27fXD7tGrnBbC77P6QpX1VcoCmxooZwr7TzKZb
	 ywtUGBhUcfckw==
Message-ID: <835fb494-ad66-474e-9fbc-71a9dd7d7608@kernel.org>
Date: Tue, 20 Oct 2026 14:18:20 +0200
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: tanmay.shah@amd.com, Ben Levinsky <blevinsk@amd.com>
Cc: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Levinsky, Ben" <ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
 <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
 <0df4bfd4-2bcc-42fd-a22d-e704e4b41d5f@amd.com>
 <cbd2e370-c8f1-46c1-87a8-fa25fdf6ea97@kernel.org>
 <d89b656d-44cf-440a-8e06-6e13cef2dbe9@amd.com>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <d89b656d-44cf-440a-8e06-6e13cef2dbe9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2026 16:11, Shah, Tanmay wrote:
> 
> 
> On 10/16/2026 8:59 AM, Krzysztof Kozlowski wrote:
>> On 15/10/2026 17:31, Shah, Tanmay wrote:
>>> We use 'amd' vendor prefix for all new drivers & bindings. Also, there
>>> is dedicated IPI hardware which can be used as mailbox too, and we
>>> should distinguish it with this PL mailbox. So I that is included in the
>>> compatible string. (pl-mbox).
>>>
>>> If we are also to include SOC name as well (per compatible property
>>> guideline), then we should include one of the SOC name as well:
>>>
>>> So, I think 'amd,zynqmp-pl-mbox-2.1' is good.
>>>
>>> Krzysztof, are you okay with above name? The 2.1 is FPGA IP design
>>> version number and not the SOC version number. So in future let's say
>>> that FPGA IP design is improved then the name (pl-mbox) will remain
>>> same, but only version number will be updated i.e. (from 2.1 to 3.0). Is
>>> it okay if we explicitly mention this in the binding description?
>>
>> So you will release the same SoC with different versions of the block?
>>
> 
> Yes correct.

Well, then this does not look like SoC block at all.

Best regards,
Krzysztof
