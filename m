Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B611DF755;
	Fri, 21 Nov 2025 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749714; cv=none; b=Us8vQ1aTb8f7//GzJWb8a5pFGDc4ztK7PAN4rrAiGb674wY9cLS4Wfl5GkFMUPipYW++hMuVoTQY2R6Nf1SLuE4XGwCdvaBDymNnA64+Fs+z6UNk5mVeTr277VhmrnUXf6ATbyI2JnWzpGbtHKlqznaD4tbDDEoc50ihfyV7CFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749714; c=relaxed/simple;
	bh=qWFdaRc8dGwhlojVuN8JsDy5PM4Z19NQu2lPhnzRQxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWGFgK02Q2RbeO21Al+t2f/52ZDoPITeeug5cTFQ6hjP0k9AlwjQ44F4gsGFBkjhHAbhZvwr/FC/T9zZexVbgfMYxrcjF7R+zp2eumfeoRxwrCuux5Cv9xAv9TyA/Y/Z4woRnistxBVfy5Dv3E0lTQu67Z2ke7ZQ1t+jUNEmpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ydo8dSWF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ydo8dSWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870E0C4CEF1;
	Fri, 21 Nov 2025 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749714;
	bh=qWFdaRc8dGwhlojVuN8JsDy5PM4Z19NQu2lPhnzRQxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydo8dSWFXQQiRpXHqAztXhM60d7GLuZ7jnGML4reMmoVituWqkNW8HsAPGoIqo4fm
	 JvhBHujfYnmCrrkBUuX2iof4jeoJcJvgkQ3NyOGIRn61LxBiGMkzfy7AgFkUw8Vmmx
	 4fYyDdVu0RnasvTnzsjjtWqryLUzl6DiEit/rM+yENHSOZ2XfW5RPOJHNYWhRflAZ1
	 +0HaXKHeb0A/TwXb+/db1+xRzcKKD6bW953Xi057V1ahHkHdMmrjqef3830SkJTJjM
	 ihlMu4rP2Y5lVD3M5Or4kJVZqJaZ9IwqXPMC6mBT91/YpC9EuLP+iKYlUsMHHE+TJe
	 /juJ1BestKfGw==
Date: Fri, 21 Nov 2025 18:28:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Message-ID: <20251121-doormat-splashy-1343ea24888a@spud>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Sa2gz/r1oDXaw4E"
Content-Disposition: inline
In-Reply-To: <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>


--6Sa2gz/r1oDXaw4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 02:21:56PM +0000, Valentina Fernandez wrote:
> Microchip family of RISC-V SoCs typically have one or more application
> clusters. These clusters can be configured to run in an Asymmetric
> Multi Processing (AMP) mode.
>=20
> Add a dt-binding for these application clusters.
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>
> ---
>  .../microchip,ipc-sbi-remoteproc.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchi=
p,ipc-sbi-remoteproc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-s=
bi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip=
,ipc-sbi-remoteproc.yaml
> new file mode 100644
> index 000000000000..348902f9a202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remo=
teproc.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remotepr=
oc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip IPC Remote Processor
> +
> +description:
> +  Microchip family of RISC-V SoCs typically have one or more
> +  clusters. These clusters can be configured to run in an Asymmetric
> +  Multi Processing (AMP) mode where clusters are split in independent
> +  software contexts.
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,ipc-sbi-remoteproc
> +
> +  mboxes:
> +    description:
> +      Microchip IPC mailbox specifier. To be used for communication with
> +      a remote cluster. The specifier format is as per the bindings,
> +      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> +    maxItems: 1
> +
> +  memory-region:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +      List of phandles to the reserved memory regions associated wih the=
 remoteproc
> +      device. This is variable and describes the memories shared with th=
e remote cluster
> +      (e.g. firmware, resource table, rpmsg vrings, etc.)
> +    items:
> +      anyOf:

Is this genuinely any of these, with no restrictions?
Can you have rsc-table and firmware?

> +        - description: region used for the resource table when firmware =
is started by the bootloader
> +        - description: region used for the remote cluster firmware image=
 section
> +        - description: virtio device (vdev) buffer
> +        - description: virtqueue for sending messages to the remote clus=
ter (vring0)
> +        - description: virtqueue for receiving messages from the remote =
cluster (vring1)
> +
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      anyOf:
> +        - const: rsc-table
> +        - const: firmware
> +        - const: buffer
> +        - const: vring0
> +        - const: vring1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - memory-region
> +  - memory-region-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // Early boot mode example - firmware started by bootloader
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        remoteproc {
> +            compatible =3D "microchip,ipc-sbi-remoteproc";
> +            mboxes=3D <&ihc 8>;
> +            memory-region =3D <&rsctable>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names =3D "rsc-table", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +
> +  - |
> +    // Late boot mode example - firmware started by Linux (remoteproc)
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        remoteproc {
> +            compatible =3D "microchip,ipc-sbi-remoteproc";
> +            mboxes=3D <&ihc 8>;
> +            memory-region =3D <&cluster_firmware>, <&vdev0buffer>,
> +                            <&vdev0vring0>, <&vdev0vring1>;
> +            memory-region-names =3D "firmware", "buffer",
> +                                  "vring0", "vring1";
> +        };
> +    };
> +...
> --=20
> 2.34.1
>=20

--6Sa2gz/r1oDXaw4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCvTgAKCRB4tDGHoIJi
0sA9AP94HeIUxLBJ65z3TggfSks/RBYE3Sbpi8OF5+n/5yjNaAEA4uVJyruCUejN
yh+vGrBowv9Xe6+UAp1NpnOwYD9kAwA=
=+jR9
-----END PGP SIGNATURE-----

--6Sa2gz/r1oDXaw4E--
