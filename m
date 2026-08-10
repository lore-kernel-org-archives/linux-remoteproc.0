Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1C412BF1;
	Mon, 10 Aug 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373884; cv=none; b=TFROltack6jXYgTzjOG4hAH2fwHKorlDqJ9fQxEe7zmqfWJ6bXgkbUW2Arq+k0vNNCCv37/w65BGgMOflfocFZu5QqtgJbInbYIwN0QAPlFQyBaLPzkBR2h45FmWFTXBiAeO2trr/gIY/hNVI+jIzNQgMsK057CsdE3qqcMmUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373884; c=relaxed/simple;
	bh=Z+BxUGP0v5KLo0GZ0KERARfFywosbwzNXpW+Pln9l+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHoCAHMHDvXNID2Q9DV4JdpEXzD3AfBqYgPHmnS5LQpcqdAlZf42TmjPkOhBKVduUiBgOiY2t+Qupphp/RRdkMje+WUygrAtAi66oJZ2dEORivuDEXrA1tDuubJWgcaWZLGEujCFwL8ebjHlNSaDLsaq+iPZ5qVu2r2ahjI4RiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=wqPpHJvg; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="wqPpHJvg"
Received: from francesco-nb (93-35-5-212.ip52.fastwebnet.it [93.35.5.212])
	by mail11.truemail.it (Postfix) with ESMTPA id 27EF71F984;
	Mon, 10 Aug 2026 16:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786373878;
	bh=2VFa4gkN/MC1afzYI4GdGQGF4nVMqhTx+VvOx02Ma4I=; h=From:To:Subject;
	b=wqPpHJvguCOWz3azxcTJkLu8IeT87b6wUKuwgFapNDK2YwwNQkL5yZ05OpxhfSVH6
	 PTBkjeP8cfyKFzkC8B5HDUSMsLWMyfRQJnLbmwo11qUAqbSdK2CxZllX3nMt+Z0qQ6
	 qQIA9mm/kinVPTo3xq3MUEWnTLjYPcEvmkZxWhJnQsiwhzzsz03ScOWg/LOPvWqIah
	 RNB/pmgMVk1TzyWMc1wGy8bU+S2vmyq8mAiIW/H2IsKVTpVOpAe00Oj7elugN9gbuG
	 gTviMJjto/TXsUV9hD/juwCqlGKY5GiOPVHwIQK9rr8io2Ag6BBjpHQHWV01Q9BqS5
	 aZRruV3M65/vQ==
Date: Mon, 10 Aug 2026 16:57:55 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <20260810145755.GC81453@francesco-nb>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-5-laurentiumihalcea111@gmail.com>

On Thu, Jul 30, 2026 at 09:34:12AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  3 +
>  .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf..3f98132f5a32 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 000000000000..bc02864c6f88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>, <&vdev0vring0>,
> +				<&vdev0vring1>, <&rsc_table>;
> +		memory-region-names = "vdev0buffer", "vdev0vring0",
> +				      "vdev0vring1", "rsc-table";
> +	};

should we have a common dtsi, instead of having an overlay for each
board? something like arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi ?

the goal would be to avoid duplication, and to have the functionality
just working out of the box for all the boards that opt in for it.

Francesco

