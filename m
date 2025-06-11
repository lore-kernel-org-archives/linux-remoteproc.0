Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEE25E824;
	Wed, 11 Jun 2025 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633864; cv=pass; b=BBIEjtRzh2JZ8O8yZcE/ILH7XBSEVM1dqOxZrOpVxJ9vsbKPg2Vay8wludguRqAPAhKJ6TtriJ1QOhWmpBzYQI8yzxZBVcIAki8clZ/1m1sRq6AAf7u/dbyhNOSOnMRs94PHOvYOxFe0K2LHcU4OKtiSwsMDIS4MUEnKFqQo7Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633864; c=relaxed/simple;
	bh=VnSbD1P4ZjAZCmO2ADIJNQ7jUY0E3k9VW+EXMPbQOn4=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=MAEkIK1k/hP04EyQ4nkmGR32/BqxPyxf4MxDjS265+srTYhAhOjrop5SKdgNzss4ap6BUbEeeZ9pkE6QOKyxuzzE6Y5raEnubiqwYNX6X8pjs/yn/Ct2AVjRz/B65mR+oDDp8z7y6TT7Vw1H/E8hDI1D8RIuzJ1p+SIifpYyibU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=a+pYiCO4; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="a+pYiCO4"
ARC-Seal: i=1; a=rsa-sha256; t=1749633823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kO7V+IP0kjxzIQrvpS/6WXoN0TFYQnAdYvQGYN+M9EESRHDfLx2LCr1edGpmh9cjbvAT5xwjplUUPKz+umH5NtVuLrTULPRkrGqrV7In1UfBxOqixKddCXdCIgW3NaauDabDKpWYmoZTfURa2Di7RLaEpcuxpdYs5lRG0cOfqOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749633823; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KzDcoJuyvrXRTjMEF0wU3nDIzXU2u1U4shVlfR4W+g0=; 
	b=FE+KHIohmMpt4W6j3U8MwU1rB1n8R4l99wCSWzLGlsbxKUeyw9ZZze9ZOxdsUY/AYSoxbmBM7WfFx5sW3ZHAVzRNhe2uBX5hwN2IGwpBTrCrz4jpHiEpI7HWK3tUjBe7g3W4cki8S2aYUr0K8RRG3etZQ/chDm9qNKG7Q/N3VTY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749633823;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KzDcoJuyvrXRTjMEF0wU3nDIzXU2u1U4shVlfR4W+g0=;
	b=a+pYiCO4nqHRRMmAzxo1pgcIPNgGvRa5/G8eM0OyG/USjABXBKDmOp62M8xqS8bB
	stmSILeijgOv1bjOGGKKYq7grIZS1kSuVn+yn/qK76nKny0gHR6FCgxnZF8X7UD9eH2
	brtIG723Rdy5/3HT1CcNH7Ypk9dPzmd59RdcC/Kc=
Received: by mx.zohomail.com with SMTPS id 1749633819809581.0689137008978;
	Wed, 11 Jun 2025 02:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chen Wang" <unicorn_wang@outlook.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <PN0P287MB22589781F2D49353E7C66C46FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1847f2ae7cdd9de8.639eddc348629bd0.78776f2b552d9090@Jude-Air.local>
Date: Wed, 11 Jun 2025 09:23:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



On 11/06/2025 17:01, Chen Wang wrote:
> On 2025/6/8 10:37, Junhui Liu wrote:
>> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> processor typically running RTOS.
>=20
> In the cover email, I saw that remoteproc also uses mailbox as the=20
> underlying communication. So I guess some mailbox-related properties=20
> will need to be added to the bindings? I suggest that these should be=20
> determined before officially merging this bindings.

Yes, thanks for your suggestion. I will try to add mailbox-related
properties and functions in the bindings and driver in v2, since the
mailbox driver has been merged. At the very least, I will ensure the
mailbox-related properties are included in the bindings.

>=20
> Thanks=EF=BC=8C
>=20
> Chen
>=20
>>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>   .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 +++++++++++++++=
+++++++
>>   1 file changed, 68 insertions(+)
>>
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
>> +    description:
>> +      The name of the firmware file to load for this remote processor, r=
elative
>> +      to the firmware search path (typically /lib/firmware/).
>> +
>> +  memory-region:
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
>> +
>> +    c906l-rproc {
>> +        compatible =3D "sophgo,cv1800b-c906l";
>> +        firmware-name =3D "c906l-firmware.elf";
>> +        memory-region =3D <&c906l_mem>;
>> +        resets =3D <&rst 294>;
>> +        sophgo,syscon =3D <&sec_sys>;
>> +    };
>>

--=20
Best regards,
Junhui Liu
