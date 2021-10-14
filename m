Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66DBC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE3A7610F9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhJNNeF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:34:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49112 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhJNNeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Oct 2021 09:34:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 0B50A1F44822
Subject: Re: [PATCH v7 5/6] rpmsg: change naming of mediatek rpmsg property
To:     Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-6-tinghan.shen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <5785005e-499f-bb39-b47d-97c5dad38d4d@collabora.com>
Date:   Thu, 14 Oct 2021 15:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924033935.2127-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 24/09/21 05:39, Tinghan Shen ha scritto:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---

I agree with this change, though, you forgot to change the same in
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
