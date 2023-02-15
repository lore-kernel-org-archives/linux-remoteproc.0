Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A067EC636CC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Feb 2023 20:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjBOU5U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Feb 2023 15:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjBOU5H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Feb 2023 15:57:07 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AD114FC37;
        Wed, 15 Feb 2023 12:53:58 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B769B143D;
        Wed, 15 Feb 2023 12:53:40 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C113F881;
        Wed, 15 Feb 2023 12:52:55 -0800 (PST)
Date:   Wed, 15 Feb 2023 20:50:56 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Bastian Germann <bage@debian.org>
Cc:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: allwinner: a64: Add hwspinlock node
Message-ID: <20230215205056.5aac7550@slackpad.lan>
In-Reply-To: <20230215203711.6293-6-bage@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
        <20230215203711.6293-6-bage@debian.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 15 Feb 2023 21:37:10 +0100
Bastian Germann <bage@debian.org> wrote:

Hi,

> Add the hwspinlock to A64 which is already implemented for A31.
> 
> Signed-off-by: Bastian Germann <bage@debian.org>

This looks alright to me, but there is still the debate what to do with
the names properties. So holding any tags back until this is resolved.

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 77b5349f6087..f2ecc21f06ed 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -851,6 +851,17 @@ wdt0: watchdog@1c20ca0 {
>  			clocks = <&osc24M>;
>  		};
>  
> +		hwspinlock: hwlock@1c18000 {
> +			compatible = "allwinner,sun50i-a64-hwspinlock",
> +				     "allwinner,sun6i-a31-hwspinlock";
> +			reg = <0x01c18000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SPINLOCK>;
> +			clock-names = "ahb";
> +			resets = <&ccu RST_BUS_SPINLOCK>;
> +			reset-names = "ahb";
> +			#hwlock-cells = <1>;
> +		};
> +
>  		spdif: spdif@1c21000 {
>  			#sound-dai-cells = <0>;
>  			compatible = "allwinner,sun50i-a64-spdif",

