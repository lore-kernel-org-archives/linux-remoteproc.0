Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25227C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 May 2022 08:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241207AbiEBIoL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 May 2022 04:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383852AbiEBIoF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 May 2022 04:44:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F8BF0E;
        Mon,  2 May 2022 01:40:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id A72391F403D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651480835;
        bh=D8YJoc2PcRQjfbBcH+ipLbCMGp+67jgyWRLQdA5wU+s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eZD9I7wAOF04f5zspCYpe65S9Eff6SOO/P1vrulREbaNgS3u4xjfQwNN0Xg9jfUWl
         u/hph2fpECj1BcIARGI8l++FijaIqEPW/EFarfvY0FApsLceAotL2mk9o1SFZl4AF9
         uD07tMnmYx2dZa6qNVx9CSeSJlhqSOWTrE0G6aB+uKTmi34TocvgUAJRD5R6cGpDyJ
         3PxGoeqkD2ulgsLtZgX2v9VNhBI3KLZmB3UrKRSb3DCw5BbncAq782jJFNSkXI9Iup
         s7T3rKRFYC5kT5+WVi6EIKc1alhQikleCHWrxe0i1Fpvi4DNXA7UVLY1Pp5ZtVEEeA
         0SKIEJlkNE8oQ==
Message-ID: <0b7101ec-96a2-cb02-7026-aa706dfef4cf@collabora.com>
Date:   Mon, 2 May 2022 10:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-3-nfraprado@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429211111.2214119-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 29/04/22 23:11, Nícolas F. R. A. Prado ha scritto:
> The SCP co-processor can optionally be passed a reserved memory region
> to use. Add this property in the dt-binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

