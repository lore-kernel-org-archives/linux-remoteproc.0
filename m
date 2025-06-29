Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FFC1F92A;
	Sun, 29 Jun 2025 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751167190; cv=pass; b=sHOERtssWghjAO/F3UUeU3epe6vX5nUn/t++zIAHxw70Tjdsrxm32PqnVuaQAkmH6BeolZyBypBmoo0uHrqWrK+PYjzT+8zfJXRMjQ2Im+8rZNqk8pP52NU7rMX0Rz5lg5+25DEA/VFJidDMZHEaA27PSJbNlsl7ihZvA4BBhPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751167190; c=relaxed/simple;
	bh=IXzCyj1WhE1qAkg+a+KMkiT95cDVLugJv1Bi8PBIbXc=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=aKR6ZXyVVzt7ZCYkrjdJruySXC3o8VM6cB9eTZEZh9tMf8sgWrrstgNGGdSD5Mfi7/3rkr79NDzwU4TT+xsQCVFlNWG0MU/exkZ7UAuBDRh4fdotZcR7aY1mlUP4pv3CRIqMwBmdHZiF/VspVdbffpHE4KppGgt8r+ul4HXzOuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=TdOoCWJv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="TdOoCWJv"
ARC-Seal: i=1; a=rsa-sha256; t=1751167152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c4yg0VkzAxe6/1DNdK0m7HWg28vbCWKpN7647AxuXUIs4+J+5rDNErGq8UbeMNljwV/xVuI/0sxAnPN7hOYsdsuGCr9ok4v3rFqsU8ut8THmnixP2qtIcYIwownOETkyZK21I659cvXMH0P54yFoVCjV/2+3vPt16j8omvc7sOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751167152; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5sZgel47h61IZI/xBdVfE3mfXZ87n6o+GU/uHbeZ/ug=; 
	b=bRmxTnwIvSybezz3VhAoC9vuoZms4A9yUx0TMg/I9rDiESy6Skst7f1kaMkuWY7N/rlEgzYr7J2QRJ1IxoMXE9URKuFbd+/Wt/knayGd18AwcGmKjo/wbYnUSNz2rmC13BLp5aQKdxVUph3g5lY3l5q3hvmkV0dK86OvfFhI8so=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751167152;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5sZgel47h61IZI/xBdVfE3mfXZ87n6o+GU/uHbeZ/ug=;
	b=TdOoCWJvcKB2dULI/kgdt/2VVSmAs1dfEHjGWJVNfGP+9cviyJ7RvFhpNbPy2bHl
	eooGQ/vp9QZr9rK1RAdOJczhfeWcZLyO27ADykvZBtpUGvZnZr68wbWu1HxriJwwTUR
	W1OtdfKk4iwVBA3zNf1u8vybSyaNxCmsHGTOA3SM=
Received: by mx.zohomail.com with SMTPS id 1751167149312644.3787975589289;
	Sat, 28 Jun 2025 20:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Rob Herring" <robh@kernel.org>
In-Reply-To: <20250625191613.GA2059062-robh@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-remoteproc@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <184d653d449ed7b0.6a3574329a6ead7.ebc417e4db758a3b@Mac>
Date: Sun, 29 Jun 2025 03:19:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Rob,
Thanks for your review.

On 25/06/2025 14:16, Rob Herring wrote:
> On Sun, Jun 08, 2025 at 10:37:39AM +0800, Junhui Liu wrote:
>> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> processor typically running RTOS.
>>=20
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++=
++++++
>>  1 file changed, 68 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-=
c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c90=
6l.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5=
ef451883b0c3d4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.y=
aml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo C906L remote processor controller for CV1800B SoC
>> +
>> +maintainers:
>> +  - Junhui Liu <junhui.liu@pigmoral.tech>
>> +
>> +description:
>> +  Document the bindings for the C906L remoteproc component that loads an=
d boots
>> +  firmwares on the CV1800B SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv1800b-c906l
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
>=20
> Already has a type. You just need 'maxItems: 1'.

Will do.

>=20
>> +    description:
>> +      The name of the firmware file to load for this remote processor, r=
elative
>> +      to the firmware search path (typically /lib/firmware/).
>=20
> That's the same for every 'firmware-name' instance. So drop.
>=20
> Is there a default name?

The firmware name would be specified in the board device tree, and
there is no default value. For reference, an example value is provided
in the example DT.

>=20
>> +
>> +  memory-region:
>=20
>        maxItems: 1

I plan to add a description for the rpmsg-related regions in the next
version. Since the number of these regions may be flexible, I think I
will only add a minItems property to ensure the execution memory
region is specified.

>=20
>> +    description:
>> +      Phandle to a reserved memory region that is used to load the firmw=
are for
>> +      this remote processor. The remote processor will use this memory r=
egion
>> +      as its execution memory.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  sophgo,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the SEC_SYS region, used for configuration of the rem=
ote processor.
>> +
>> +required:
>> +  - compatible
>> +  - firmware-name
>> +  - memory-region
>> +  - resets
>> +  - sophgo,syscon
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    reserved-memory {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <1>;
>> +        ranges;
>> +
>> +        c906l_mem: region@83f40000 {
>> +            reg =3D <0x83f40000 0xc0000>;
>> +            no-map;
>> +        };
>> +    };
>=20
> Drop. No need to show how /reserved-memory works here.

Will do.

>=20
>> +
>> +    c906l-rproc {
>> +        compatible =3D "sophgo,cv1800b-c906l";
>> +        firmware-name =3D "c906l-firmware.elf";
>> +        memory-region =3D <&c906l_mem>;
>> +        resets =3D <&rst 294>;
>> +        sophgo,syscon =3D <&sec_sys>;
>> +    };
>>=20
>>

--=20
Best regards,
Junhui Liu
