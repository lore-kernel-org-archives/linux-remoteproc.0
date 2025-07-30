Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5A1ACEDE;
	Wed, 30 Jul 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869183; cv=pass; b=hzeD1H1AGgXzVjWm5D0ViQ0GuIN3VSorQIYZR6EolPezk+3lSRLOQk7b94yY1TrEwSbXFxoIJ1EfF7q0oW7/T9I7BK7R6g/ArKiZ4cEWtL2N+6pPX87NNOONcebbu+wrhoCePYytoqc5gBoMLaHn+P1We040lxgU9QoU54gTxyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869183; c=relaxed/simple;
	bh=DiKsySkUNeC8bTjwLJK2Ud0Kbazs9swK/KS5X0fM58M=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=fbrnCbhbCNWn5clRYtMRgUf85JWiD+s6RnM2Kj0xf330la7jFEWsPblIi1mjX9vCu7U2a7jrY2cejAiAGwThQIQOQZ+NPjY3rxt5NMmz4exxKVe88Pmh12hXWtuAZDVK4Aos4nZfJ/aumjMqL4vhKWK6sl2cdjuNjAXMkyT/pzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=cSAX2A70; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="cSAX2A70"
ARC-Seal: i=1; a=rsa-sha256; t=1753869145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gcHqa9+feDNFMDsVs2TKqy6ps4OyVJb9cCdGcEtwBNrjmGjeKe2b9692OfNvTSkebS7TPb9T/ex/zfkfUW575UsaALHUdCu0wOhLY6Q87piyyd/UF+JylhluhCA3apMrNFK/qmYepeCWytfZXWN5JGER497ny75NlVN8ohay5PE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753869145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JwbmBBrKqJgjxoU8yUqfgZbbSm+7tkuGLcAqTkpXgSU=; 
	b=SX8fEUcfQE5eeW+CWLFaw6HQGGvEXoPtfXJEYTlBa3peeRDMVd921iLjYWZdYb1/FuZmw20Tj8xo3/zzI5haL5mTXxVkDMoRQ7wmRiGPmklYjPfrOvCcZM6orkSeVbFHrNQaSYgQ0lfCOvN6PWDBZ1Gi7ihxICZRbxffT7egj9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753869145;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JwbmBBrKqJgjxoU8yUqfgZbbSm+7tkuGLcAqTkpXgSU=;
	b=cSAX2A70YQVbB7mKDqeCL8nckPbab9p/s+ClAjOPv46etJFI1CNgCrlErrY9sW/E
	j2LOIQh7/ZcRJA7lFLxmkD01pPJ/UhNuDmVUtOp0Rb3uWm80B3QEOVCTZJCk2afelsA
	jEREZFw4erDxzPGDRaAXdf1tJFinStnRZNiB/5dE=
Received: by mx.zohomail.com with SMTPS id 1753869143747974.5396900815683;
	Wed, 30 Jul 2025 02:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <4137240e-a5c4-427b-900c-ae062aa9a9c8@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856feaf769f30d8.54513078e677e4a4.cf6de7e2e9832713@Jude-Air.local>
Date: Wed, 30 Jul 2025 09:52:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 30/07/2025 08:47, Krzysztof Kozlowski wrote:
> On 30/07/2025 05:31, Junhui Liu wrote:
>> On 29/07/2025 08:27, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 19:13, Junhui Liu wrote:
>>>>>
>>>>>> +    description:
>>>>>> +      This property is required only if the rpmsg/virtio functionali=
ty is used.
>>>>>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>>>>>> +    items:
>>>>>> +      - description: mailbox channel to send data to C906L
>>>>>> +      - description: mailbox channel to receive data from C906L
>>>>>> +
>>>>>> +  memory-region:
>>>>>> +    description:
>>>>>> +      List of phandles to reserved memory regions used by the remote=
 processor.
>>>>>> +      The first region is required and provides the firmware region =
for the
>>>>>> +      remote processor. The following regions (vdev buffer, vrings) =
are optional
>>>>>> +      and are only required if rpmsg/virtio functionality is used.
>>>>>> +    minItems: 1
>>>>>
>>>>> Why isn't this constrained?
>>>>
>>>> Do you mean a maxItems should be added here?
>>>>>>
>>>>>> +    items:
>>>>>> +      - description: firmware region
>>>>>> +      - description: vdev buffer
>>>>>> +      - description: vring0
>>>>>> +      - description: vring1
>>>>>> +    additionalItems: true
>>>>>
>>>>> No, drop. This needs to be constrained.
>>>>
>>>> My intention is that RPMsg/OpenAMP is not the only use case for
>>>
>>> We don't allow such syntax, that's not negotiable. Why 322 redundant
>>> memory regions are fine now?
>>>
>>>> remoteproc. There are scenarios where the remoteproc is just used for
>>>> booting the remote processor without any communication with Linux. In
>>>> such case, only the firmware region is needed, and the other regions ma=
y
>>>> not be necessary.
>>>>
>>>> Additionally, the remote processor might reserve extra memory for custo=
m
>>>> buffers or other firmware-specific purposes beyond virtio/rpmsg.
>>>> Therefore, I think only the firmware region should be required and
>>>> constrained, while allowing flexibility for additional/custom memory
>>>> regions as needed.
>>>
>>> So how does this work exactly without the rest? Remote processor boots
>>> and works fine? How do you communicate with it?
>>>
>>> Please describe exactly the usecase.
>>=20
>> Thank you for your clarification.
>>=20
>> The C906L remoteproc can run at two use cases:
>> 1. Standalone mode: Only the firmware region is used. In this case, the
>>    remoteproc driver loads the firmware into the firmware region and
>>    boots the C906L. The C906L runs independently, without communication
>>    with Linux, and the mailbox is not used.
>> 2. OpenAMP/RPMsg mode: The firmware region, vdev buffer, and vrings are
>>    used. In this scenario, the C906L runs firmware with OpenAMP support
>>    and communicates with Linux via the virtio memory regions and mailbox.=

>>=20
>> To summarize:
>> - Required: firmware region
>> - Optional: vdev buffer, vrings, mailbox
>=20
> How does your driver behave in (1)? Does it work?

The driver inits the firmware region and loads the firmware into it.
Then it sets the enable bit in the C906L's control register, set the
reset address for the C906L and deassert the reset bit for the C906L to boot=
 it.

Actually, the current driver only supports the first case, and it works.
The second case is not implemented yet, but I believe it can be
supported based on the current code structure. I originally intended to
submit the OpenAMP/RPMsg-related bindings together with the driver
implementation; however, I was advised to finalize the bindings in v1:

https://lore.kernel.org/linux-riscv/PN0P287MB22589781F2D49353E7C66C46FE75A@P=
N0P287MB2258.INDP287.PROD.OUTLOOK.COM/

--=20
Best regards,
Junhui Liu

