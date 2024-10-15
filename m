Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52AB1EC006;
	Tue, 15 Oct 2024 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729023750; cv=none; b=dSL2rxiBSSzaV7dNTBBtiMtktGraMgQxEsQviD9AnKonoL4+8IccJ1+lv9GConG9Emfz7fjLt6SGpsE22YjpPFNsk8iH46JrudJKSUsqbjkZ0qZjAjOEMlFtNFiHv8INUnw8+5G3K0EavQT6A75Px9BoQ78V4Zz/udSCwg2rhxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729023750; c=relaxed/simple;
	bh=UWUU6krJtOL9KGlFLqj3zzr7nr2dBDOvGvKhRL72vuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH+zQBzQOdfHB4kA6cLJ3rkrRLWxL/tJvSUHg0wwgv6ZlH0L5LBOFSTPGUfqFhv0AK8SqJ9c8bbtP5u0Dx6o3R3hheACAQNVnLNFQ4GQYCYSbl5Ixhb0LFg83VRNkI6aBxw4UG+n52ISQq2LnZHxAn7w9sLrWhaBhC/DCE5yA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlbSFO4O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlbSFO4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC606C4CEC6;
	Tue, 15 Oct 2024 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729023749;
	bh=UWUU6krJtOL9KGlFLqj3zzr7nr2dBDOvGvKhRL72vuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XlbSFO4OQmdQ3fvTeEO3evC3mD+52YdtCglGkm7L6/rSZzSbinNRsdjlSJTRJnAA9
	 3c4sjjT+sSvPx9FKbv90E4DidlbynVYS90pURjYWdHy7Ym1w81nxyNjxxPZSer/WBF
	 KIcbUJToExlcTjoXmJFDbVirNmajbbk2DyW1eCBZdW2PXe7nXvuqknhxBKfGGcAKG7
	 Wx1xpcGvtsUtXtdAtbtAIdFKGb/0252Pw0/M8wIKn5Y0q/BdmTtEwUEYOhusBzxSeV
	 5lPF7Ga0eHLW8UkP35jNlvMYL/atfKUDBin+UVa113hxZcFN3waUFqMwPw/6/OnMFh
	 h1t2fTPW+DVDA==
Date: Tue, 15 Oct 2024 21:22:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valentina.FernandezAlanis@microchip.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterlin@andestech.com,
	dminus@andestech.com, Conor.Dooley@microchip.com,
	conor+dt@kernel.org, ycliang@andestech.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for
 Microchip IPC remoteproc
Message-ID: <20241015-distrust-chatty-9e723e670fef@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-5-valentina.fernandezalanis@microchip.com>
 <fc541e78-5304-42be-a844-70935d66f151@kernel.org>
 <82eae461-3cce-4e36-905c-34c147fabcb3@microchip.com>
 <f0da1029-c8df-40e7-8312-a41a87b7b940@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebRKqoIVG18m2cC+"
Content-Disposition: inline
In-Reply-To: <f0da1029-c8df-40e7-8312-a41a87b7b940@kernel.org>


--ebRKqoIVG18m2cC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 03:35:46PM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2024 14:09, Valentina.FernandezAlanis@microchip.com wrote:
> > On 16/09/2024 21:14, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know=
 the content is safe
> >>
> >> On 12/09/2024 19:00, Valentina Fernandez wrote:
> >>> Microchip family of RISC-V SoCs typically has or more clusters. These
> >>> clusters can be configured to run in Asymmetric Multi Processing (AMP)
> >>> mode
> >>
> >> A nit, subject: drop second/last, redundant "binding for". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >> See also:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicet=
ree/bindings/submitting-patches.rst#L18
> >>
> >>>
> >>> Add a dt-binding for the Microchip IPC Remoteproc platform driver.
> >>>
> >>
> >> Binding is for hardware, not driver. Please rephrase it to describe
> >> hardware.
> >>
> >>
> >>> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microch=
ip.com>
> >>> ---
> >>>   .../remoteproc/microchip,ipc-remoteproc.yaml  | 84 ++++++++++++++++=
+++
> >>>   1 file changed, 84 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/mic=
rochip,ipc-remoteproc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,i=
pc-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip=
,ipc-remoteproc.yaml
> >>> new file mode 100644
> >>> index 000000000000..1765c68d22cf
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remo=
teproc.yaml
> >>> @@ -0,0 +1,84 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-remotepr=
oc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Microchip IPC Remote Processor
> >>> +
> >>> +description:
> >>> +  Microchip family of RISC-V SoCs typically have one or more
> >>> +  clusters. These clusters can be configured to run in an Asymmetric
> >>> +  Multi Processing (AMP) mode where clusters are split in independent
> >>> +  software contexts.
> >>> +
> >>> +  This document defines the binding for the remoteproc component that
> >>> +  loads and boots firmwares on remote clusters.
> >>
> >> Don't say that binding is a binding for. Say what this hardware piece =
is.
> >>
> >>> +
> >>> +  This SBI interface is compatible with the Mi-V Inter-hart
> >>> +  Communication (IHC) IP.
> >>> +
> >>> +maintainers:
> >>> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: microchip,ipc-remoteproc
> >>
> >> That's quite generic. Basically this says it will handle IPC of all
> >> possible Microchip SoCs, not only RISC-V but also ARM and whatever you
> >> come up with.
> > IPC is the actual name of the hardware block described in this binding.=
=20
> > I'll update the description of the binding in v2 to mention this.
> >=20
> > Additionally, I'll rename the compatible to microchip,ipc-sbi-remotepro=
c=20
> > to further clarify that this binding is intended for devices using the=
=20
> > Microchip IPC hardware block and for devices with an SBI interface (RIS=
C-V).
>=20
> Well, still generic. Explain why this deserves exception from specific
> SoC compatibles.

If I understand this correctly, some degree of generic-ness is actually
intended here. The IPC/IHC (the name depends on whether or not it is RTL
for the FPGA fabric or a hardened version) isn't quite like some of the
other remoteproc things here, that are intended for programming a DSP or
similar with some firmware - it's intended for asymmetric
multiprocessing stuff, where some of the CPU cores run Linux and the
others are running something like freertos or zephyr, with an abstracted
interface provided by the firmware/SBI implementation. The mailbox side
of this is also implemented using an SBI abstraction (similar to PSCI or
SCMI, I never recall which) and also has a compatible that isn't tied to
specific soc.
Granted, the mailbox side does also have a IP core specific version, but
that is not intended to be consumed by the OS, but rather by the SBI
implementation (e.g. OpenSBI).

What this binding is supposed to be describing is the "generic" ecall
interface to a set of remote processors provided by the SBI
implementation. The platform you're running on is meant to be abstracted
away by use of ecalls etc, just as the mailbox is - which is why
Valentina went something not soc-specific here. I can see much more of
an argument for encoding the version of the protocol that is implemented
by the SBI firmware than for having a soc-specific set of compatibles
here.

--ebRKqoIVG18m2cC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw7O/wAKCRB4tDGHoIJi
0oHaAQDcB66qUv/rZ3n4eYXFQNmW6lkghVITam7nzpZJFxq/nwD+L/jTBBJxvAEo
mBKnoOyDEsehaMsVOUCJivIg7hy1NQc=
=uuwh
-----END PGP SIGNATURE-----

--ebRKqoIVG18m2cC+--
