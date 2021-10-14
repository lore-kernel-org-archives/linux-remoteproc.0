Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246ACC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0788B60F23
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhJNNfC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:35:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49142 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJNNfB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 09:35:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 818421F44C59
Subject: Re: [PATCH v7 6/6] arm64: dts: mt8183: change rpmsg property name
To:     Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-7-tinghan.shen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <db6c72b4-20d7-3c20-3714-72299cf08c5d@collabora.com>
Date:   Thu, 14 Oct 2021 15:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924033935.2127-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 24/09/21 05:39, Tinghan Shen ha scritto:
> The the rpmsg property name is changed to "mediatek," to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8e9cf36a9a41..bc4bbcf457ee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -754,7 +754,7 @@
>   
>   	cros_ec {
>   		compatible = "google,cros-ec-rpmsg";
> -		mtk,rpmsg-name = "cros-ec-rpmsg";
> +		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};
>   };
>   
> 
Please reflect this change in
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Apart from that,
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
