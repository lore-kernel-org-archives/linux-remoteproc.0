Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78722DCC1A;
	Wed, 25 Jun 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883119; cv=none; b=khrTeJMC4TGz3FlweBBxlLTMD5gE0Xwc0Nmi4hezXAVV0eRcf4TvE3c/FnrONwfZcvr6RyG/uSwzEAm/ujUYhBV9CR+Jqo3LF+xSs+vZPO21bKIEON0E4tSroRau16KnLcZIqEAUD7d9fWyIlXdUjt133JuAfukK542izuazw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883119; c=relaxed/simple;
	bh=TziOv0cm8azgsxSTr1XbfSHXohOwDnljw555dksH0d0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kpQP5zCehxR3OAOmFt/0Z2P+mAykl/vveS69kiEfGDxgLWS4fdkjJRvO8PryZpG7DTstJbZR0l9It1y3KsJSBuTnEvKaOSHrmit1RuY1KfHq2uzvzAwSWmTO+/shDP0cewGF8goKeosFfN3kPONQIbfV6EHRTBHRoHJ6PGKDHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbWsS7Tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbWsS7Tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E348C4CEF2;
	Wed, 25 Jun 2025 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750883119;
	bh=TziOv0cm8azgsxSTr1XbfSHXohOwDnljw555dksH0d0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BbWsS7TvvcQOXUDiR1RQKIoUGhBretA5etFDHMA/VgYxIUwUe0h5CUh71IQNJun9a
	 kO5WbZmvPC3d43pDdg01pdyGTPNkcK27IUD4fc+Ug5I/YB27ssZfWWPtd3nbE6h39w
	 srb6lW5QC8V6HS33obz5sKGX9uXI/xlb7EJjGnSSm1LimV5lKhaa/22zY+Ln5wH6BD
	 GCF7fL0drw6+h1RY3tXBNkuqTIBVN/J0axjzYafv/yNXnTjvXvVlBpzWaTWmb/+3+l
	 NNr5cTYwjLhdKGz1ceGRS099s2+U04cg3dK4PCKx+y9HxQ8+WFIpqvPih+wXk82xmi
	 4/MX9h+cz6qRw==
Date: Wed, 25 Jun 2025 15:25:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
Message-Id: <175088289381.2146689.9089577049350520635.robh@kernel.org>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95


On Wed, 25 Jun 2025 10:23:26 +0800, Peng Fan (OSS) wrote:
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
> 
> In patch 2, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
> 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Patchset was tested with below boot images when the patchset based on next-20250526:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
> 
> Patchset was tested again with rebase on next-20250623
> 
> Patchset is re-based on next-20250603.
> 
> Thanks for Daniel/Frank helping review the patchset before posting out to list.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
> - Add lmid and cpuid in driver patch 2.
> - Add i.MX95 lmid and cpuid in patch 3
> - Rebased to linux-next-6-23 and tested with this new rebased version
> - Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
> - Daniel's R-b are still kept after talk with Daniel
> - Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com
> 
> Changes in v2:
> - Typo fix in patch 2 commit message
> - Move the m7 address mapping array from patch 2 to patch 3
> - Add R-b from Daniel to patch 3
> - Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com
> 
> ---
> Peng Fan (5):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add support for System Manager API
>       remoteproc: imx_rproc: Add support for i.MX95
>       arm64: dts: imx95: Add SCMI LMM/CPU nodes
>       arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  45 +++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
>  drivers/remoteproc/imx_rproc.c                     | 138 ++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |   5 +
>  5 files changed, 195 insertions(+), 2 deletions(-)
> ---
> base-commit: fda740558acb4303fcf377e5cf9139f795b1d85b
> change-id: 20250525-imx95-rproc-1-20bb74ddc8af
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit fda740558acb4303fcf377e5cf9139f795b1d85b not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250625 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#





