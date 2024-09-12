Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AF13C9C4;
	Thu, 12 Sep 2024 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161350; cv=none; b=tVL7yVuHKGQtk7xIHJUArej79K7Z9o4C+HjjYMC3oGZaJ45dsozjFA1Bfb1JjrSOxlNqfyfk1YVBWPqCcsuQjw0vA+vKey+dETwmfECwQ2bzi0qaPDsnuG8iOkAqTEtyFZ/3Mt9fBhJJplc1w2op66EEqpBWAvcvC4UTf5oYS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161350; c=relaxed/simple;
	bh=F2KHOAwtI2liyPV9p1o+B/TcQTeoG/9OurOUzOITgCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLrkGLuHZ7BlJMCqm+soP/TMhVXaHnqBe0sYz/ZAYXUcckcTDaV2Ui22DxOtB1BYiqYYiIJxNUYZexJaw34IDJJxI+jxJ04Q4V2wPc0kh80k2cKqMhTifawC3InimGR3xx4ZzKOERZPPnrz6ygR2EdXp2oq4VXTnO3ixnYdh8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6a1m6UN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6a1m6UN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF58C4CEC3;
	Thu, 12 Sep 2024 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161350;
	bh=F2KHOAwtI2liyPV9p1o+B/TcQTeoG/9OurOUzOITgCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6a1m6UN8+Mc8aa6OvJQtkMkFtlC/An2ncY7bN/TbuccIworuRnicIdjj5P5hqc+R
	 /7ZoY3Eq2dlhOeP1Qmd3MvKhDPnsK3oHckYnwNW78m8BHlfI1CvAMY9fiIv9cnBU3b
	 T1XWuFt3kWODI8xkFitIi8m9f8ssXfdUdEMDxuuc2x1oFTwudoqhqIM5Cyml/T0rqV
	 7SBIMn5ZF5iiCOfe3hAwcT7Niwk4azuxQDgYn6dTX7TM8PKn+8q7STiPQuKjGVe4xt
	 k9llevAIEppG9KN+L2mN3LLzcXvEhCs4NeOzImt+bhhAiVa1Wlys6Ocq33ox9cgftZ
	 VzzzCIMgWVHcg==
Date: Thu, 12 Sep 2024 18:15:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240912-wired-skirt-a758f0e1507c@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YivsFDfHFtw+N+Us"
Content-Disposition: inline
In-Reply-To: <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>


--YivsFDfHFtw+N+Us
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:00:22PM +0100, Valentina Fernandez wrote:
> Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> mailbox controller.

Before anyone else gets here, there's an erroneous "driver" in $subject
:)

> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>
> ---
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,s=
bi-ipc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.=
yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> new file mode 100644
> index 000000000000..dc2cbd5eb28f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Inter-processor communication (IPC) mailbox controller
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +description:
> +  The Microchip Inter-processor Communication (IPC) facilitates
> +  message passing between processors using an interrupt signaling
> +  mechanism.
> +  This SBI interface is compatible with the Mi-V Inter-hart
> +  Communication (IHC) IP.
> +  The microchip,sbi-ipc compatible string is inteded for use by software
> +  running in supervisor privileged mode (s-mode). The SoC-specific
> +  compatibles are inteded for use by the SBI implementation in machine
> +  mode (m-mode).

And it might be worth me pointing out to the !riscv folks that "SBI
implementation in machine mode" means that the
"microchip,miv-ihc-rtl-v2" compatible is intended for use by firmware
only.

Cheers,
Conor.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sbi-ipc
> +      - microchip,miv-ihc-rtl-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 5
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#mbox-cells":
> +    description:
> +      For the SBI "device", the cell represents the global "logical" cha=
nnel IDs.
> +      The meaning of channel IDs are platform firmware dependent. The
> +      SoC-specific compatibles are intended for use by the SBI implement=
ation,
> +      rather than s-mode software. There the cell would represent the ph=
ysical
> +      channel and do not vary depending on platform firmware.
> +    const: 1
> +
> +  microchip,ihc-chan-disabled-mask:
> +    description:
> +      Represents the enable/disable state of the bi-directional IHC chan=
nels
> +      within the MIV-IHC IP configuration. The mask is a 16-bit value, b=
ut only
> +      the first 15 bits are utilized.Each of the bits corresponds to
> +      one of the 15 IHC channels.
> +      A bit set to '1' indicates that the corresponding channel is disab=
led,
> +      and any read or write operations to that channel will return zero.
> +      A bit set to '0' indicates that the corresponding channel is enabl=
ed
> +      and will be accessible through its dedicated address range registe=
rs.
> +      The remaining bit of the 16-bit mask is reserved and should be ign=
ored.
> +      The actual enable/disable state of each channel is determined by t=
he
> +      IP block=E2=80=99s configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    default: 0
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sbi-ipc
> +    then:
> +      properties:
> +        reg: false
> +    else:
> +      required:
> +        - reg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,miv-ihc-rtl-v2
> +    then:
> +      properties:
> +        interrupt-names:
> +          items:
> +            pattern: "^hart-[0-5]+$"
> +
> +examples:
> +  - |
> +    mailbox {
> +      compatible =3D "microchip,sbi-ipc";
> +      interrupt-parent =3D <&plic>;
> +      interrupts =3D <180>, <179>, <178>;
> +      interrupt-names =3D "hart-1", "hart-2", "hart-3";
> +      #mbox-cells =3D <1>;
> +    };
> +  - |
> +    mailbox@50000000 {
> +      compatible =3D "microchip,miv-ihc-rtl-v2";
> +      microchip,ihc-chan-disabled-mask=3D  /bits/ 16 <0>;
> +      reg =3D <0x50000000 0x1C000>;
> +      interrupt-parent =3D <&plic>;
> +      interrupts =3D <180>, <179>, <178>;
> +      interrupt-names =3D "hart-1", "hart-2", "hart-3";
> +      #mbox-cells =3D <1>;
> +    };
> --=20
> 2.34.1
>=20

--YivsFDfHFtw+N+Us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMhwAAKCRB4tDGHoIJi
0ueGAQCjRtgOUFPYCV/NiX1IBYJRwc+sQaTW3AN/213MKFEm9gD9ELhr1G0y3nvJ
A9fm9nCT5PQy4F0MwaegNptVjGbC+Qo=
=L4tD
-----END PGP SIGNATURE-----

--YivsFDfHFtw+N+Us--
