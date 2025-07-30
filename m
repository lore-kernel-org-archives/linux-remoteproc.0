Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E71154426;
	Wed, 30 Jul 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753847880; cv=pass; b=H02Y0f2nY+xrcRpg70yIKJp3u+gVV7HucnoIhxzayURbooinh2ueJ5M9YXRLUzEDwMSVOcvw49IqRfSZQT1FRZlMiufO4fAsPR3sWOV0wHQmf2zqKRvaWvgFnN9dQNqSNflM0yuX3nJM+jBIrCde1602ADa7+zXEGhRsYDTbEto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753847880; c=relaxed/simple;
	bh=FxmCAKhtpdq267tUKD5rYiqEjhu/7j22O+gAW8Uw2BA=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=hZr5gm+mcDHbzR6on5ZfpYsB9IMdcdY6pcF8g/EFL+c2FU72XFaTLeQeHmnLO043Hmse8uZvGA6MwMAiyeEyIoKW9DLyaJdAgj5XvKfuVdSXJQT26GG12ag24Z4dU167Yk7/PvAwYlXue1ZGtYPULH5KZN+QMsxnv9PJwqM5TW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=AdgxG56R; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="AdgxG56R"
ARC-Seal: i=1; a=rsa-sha256; t=1753847840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NCuR8+FsGRD+jtnwdfMXS57jZARc++6hqANo5M4wHJXIuSmXFNDZJA+aAe8jF9nHRkYNMTGYOZbkoklz/QH+MYNAaJ9YSS4a/Hn7Jf6QsQzdJKGKcd3iM2w6sLxmYLioTyQYs6PESJsrHMezF7G2Gb9nnJ0UZz1v2SjTHqKXJVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753847840; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ASOku5JSU5RCbAivVDsH/TwJN9/qPsflUf5UEdZY4Mo=; 
	b=B5qiUKAGkt8yrocZXi+vDyEzG1JGHCwYFheflZLFOUJeDlSnJfkaTTHN1HwG0UmJ2uaauj3iYN0DwG2uyrQmB8MBxifdMnU8pE1jKJXf8raCNLdSOxHn0ktF+SXW8FaMU6Rrtk8V6jb4MCcgRa6Sg2CblZAYIDqtvmJd7EFt/K8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753847840;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ASOku5JSU5RCbAivVDsH/TwJN9/qPsflUf5UEdZY4Mo=;
	b=AdgxG56RP5DB/CKLfrO5XyJbqz+zw8NrzBq8JzcUEIJFwpTCI6B6ZoS3fLYSrjAG
	c9VhF2R7O4V9hQMgZSxHo7M19jJZbvSC2fMUElK4xT8F9ok5nbm7bJ6dsp2B4OslD35
	BJ7iJ02bePpUDvz1N2STaW0/s0AsKa39PVAtWMrE=
Received: by mx.zohomail.com with SMTPS id 1753847836673828.946911370315;
	Tue, 29 Jul 2025 20:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Inochi Amaoto" <inochiama@gmail.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
Date: Wed, 30 Jul 2025 03:57:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 29/07/2025 16:31, Inochi Amaoto wrote:
> On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
>> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> processor typically running RTOS.
>>=20
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++=
++++++
>>  1 file changed, 79 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-=
c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c90=
6l.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700=
ea4a695d2b57f81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.y=
aml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#=

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
>> +    maxItems: 1
>> +
>> +  mbox-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  mboxes:
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
>> +    items:
>> +      - description: firmware region
>> +      - description: vdev buffer
>> +      - description: vring0
>> +      - description: vring1
>> +    additionalItems: true
>> +
>=20
> Why not allocating these region dynamicly? I do not think firware is
> always avaible before staring. Allowing dynamic firmware give us max
> flexiblity.

I'm afraid it's not easy to do this.

For firmware region, the RTOS firmware usually needs a physical address
to link to, and I have researched and tested two RTOS (RT-Thread and
Zephyr) on the C906L, both of them do not support position-independent
execution or runtime relocation. Therefore, a reserved memory region is
needed to provide a fixed physical address for the RTOS firmware.
(In fact, there is already a reserved memory region for the C906L in
cv1800b-milkv-duo.dts)

For virtio-related regions, the RTOS firmware also needs to know the
shared memory regions for communications at compile time.

So, reserving memory through DT is necessary for now.

>=20
> Regards,
> Inochi

--=20
Best regards,
Junhui Liu

