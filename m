Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D426E175;
	Mon, 28 Jul 2025 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753722837; cv=pass; b=fvPB4eiD7H+oAhubaUq9qQr+MdSOIhSlPbC2f97dkS944YDVJaeoao/Dglr2FRz6ZvTAK4s2fCf30oqtQoM9IhHfEX0BpVmbdsSd8HPsMADuNNso4B9IcBuAnw+uNMoU0mp/BQfWN1d1dRHN3ljCjsLp7C7Bsk6Xvb/urdxDeUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753722837; c=relaxed/simple;
	bh=EZLm0hWPwWbOCXSmaGl+GP6kZweDgiIZF7XOG7Q81Jc=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=mF3fDWe5cJvv9pxizc8VppDM0dZ2nXKxr0PeKWLcYbfLIr8bltUeM7a5jzup2oqGU5ahLg56Zvfqcijx/P3JlOXFhaEDx9ttzMZIJbKs7JxugAEVANzXUxcS/6QS9pYUbceef+mIt1Z+Y4k7M8EoZBjxA7y7mmK3E4WL2XqB8Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=aArmC+xR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="aArmC+xR"
ARC-Seal: i=1; a=rsa-sha256; t=1753722797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DyeAj1vuOJX4gjpudAMnSDJhzX2qgPiz0DuR0Tt1JU/ZcSC/UsHvndDivcenloRdTkILKKSlxF1Ca5zpCaMR4I5vfcCbgANhdz2A9e44OmzlCg0C21OVKbRGcFPO1Zt8F7f2OG1fIW3dLFhkRgkFw9hxtrBT6WRA5V1fOGUmo2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753722797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7nyI91Gx9WQnBf9pyvb0BXaqUgm6dK2RhJMrNVE6CmM=; 
	b=CZjkeooRlycc6Dx2U93rSmgTX+y4K5veGDh0fAKEGZB77kVSIAC2c1gZlHhCJPD0RPfkzoOZIx7wxarydXlqpC3kUVl/kIUqL2rL65n1rifqNr2XCdakWor1+j0A+SiliuzoIyqv8MGLVmqC9A/a5lQMwtUeu1upkuV8KW9XsHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753722797;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7nyI91Gx9WQnBf9pyvb0BXaqUgm6dK2RhJMrNVE6CmM=;
	b=aArmC+xRg0/DrzPIr0y1SP32KRg+iZ922Xd8/MVsJeUNw8cCbu471AAFYdfIYHzM
	991JLY2yILIIoa+zR71Zj9egMIkOr771Ml/sa+g9T8e9ByCjX5hgDGoZA9ToljB1RzG
	bvqeA5SCM5KvJ/JwAQefHK9j2WA0mTJ+JIaxgV9c=
Received: by mx.zohomail.com with SMTPS id 1753722795361320.37867733484927;
	Mon, 28 Jul 2025 10:13:15 -0700 (PDT)
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
In-Reply-To: <3864e374-b045-4317-85bf-ec3a2d3d7940@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <185679960f220550.906528684e28f712.ba6c1f3fdd9df549@Mac>
Date: Mon, 28 Jul 2025 17:13:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 28/07/2025 15:11, Krzysztof Kozlowski wrote:
> On 28/07/2025 13:03, Junhui Liu wrote:
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  mbox-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  mboxes:
>=20
> First go mboxes, then mboxes-names. ALWAYS.

Thanks, I will fix the order in the next version.

>=20
>> +    description:
>> +      This property is required only if the rpmsg/virtio functionality i=
s used.
>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>> +    items:
>> +      - description: mailbox channel to send data to C906L
>> +      - description: mailbox channel to receive data from C906L
>> +
>> +  memory-region:
>> +    description:
>> +      List of phandles to reserved memory regions used by the remote pro=
cessor.
>> +      The first region is required and provides the firmware region for =
the
>> +      remote processor. The following regions (vdev buffer, vrings) are =
optional
>> +      and are only required if rpmsg/virtio functionality is used.
>> +    minItems: 1
>=20
> Why isn't this constrained?

Do you mean a maxItems should be added here?

>=20
>> +    items:
>> +      - description: firmware region
>> +      - description: vdev buffer
>> +      - description: vring0
>> +      - description: vring1
>> +    additionalItems: true
>=20
> No, drop. This needs to be constrained.

My intention is that RPMsg/OpenAMP is not the only use case for
remoteproc. There are scenarios where the remoteproc is just used for
booting the remote processor without any communication with Linux. In
such case, only the firmware region is needed, and the other regions may
not be necessary.

Additionally, the remote processor might reserve extra memory for custom
buffers or other firmware-specific purposes beyond virtio/rpmsg.
Therefore, I think only the firmware region should be required and
constrained, while allowing flexibility for additional/custom memory
regions as needed.

>=20
>=20
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  sophgo,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the SEC_SYS region, used for configuration of the rem=
ote
>> +      processor.
>> +
>> +required:
>> +  - compatible
>> +  - firmware-name
>> +  - memory-region
>> +  - resets
>> +  - sophgo,syscon
>=20
> Why mboxes are not required?

The reason is similar to "memory-region" above. The mboxes property is
only needed when RPMsg/virtio communication is used. For some use cases,
the remote processor does not need to communicate with Linux at all, so
the mailbox is not required. Would it be necessary to require the mboxes
property even in scenarios where mailbox communication is not involved?

>=20
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    c906l-rproc {
>=20
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicet=
ree-basics.html#generic-names-recommendation

Thanks for the information, I will change the node name to a generic
"remoteproc" in the example. (Although it's not in the list, I think
it's generic enough)

>=20
>=20
> Best regards,
> Krzysztof

--=20
Best regards,
Junhui Liu

