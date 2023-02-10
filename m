Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B758C636CD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Feb 2023 14:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbjBJOFx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Feb 2023 09:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbjBJOFv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Feb 2023 09:05:51 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D966A72F;
        Fri, 10 Feb 2023 06:05:51 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1402266020EA;
        Fri, 10 Feb 2023 14:05:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676037949;
        bh=Mg5W77u46QtJnxyyYRaiHGd8a7BtM7ERXGTfWn6ygxk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oLTedfdjpgMf83Yv75H+d+BhU+L0JIKbeYwUbWHsCQNMYwDK1KpA0QXIOL9bdrwSo
         upVUugkn6xDlMCzvyKGVPKVF9wtpE1yoNWLyWX61KHOSQgFyk1WlnVjOPJ8bD/7QH8
         XKYWy9zrkLB4RS2tZWZHvr66iXOrJtkbgJL4UzwV1Zoh9LRpeqI2tcA2hqGmMhh3tQ
         g23dFVLKK1kr0Nd6nW8fm4G9LJ3+SS75MO6C5TG/IIpn4sZjA/Y2arJXWjlvQW2smY
         9vEC/SYbatCK6KOoSS1TAxPQ5t5/oN2ryF6D6MRZdyDwkSSKvKWFudr9abjST4IeEc
         MQstltXGJ23eA==
Message-ID: <d7a432a4-0f78-47b9-3737-90734e629878@collabora.com>
Date:   Fri, 10 Feb 2023 15:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 02/12] arm64: dts: mediatek: mt8183-kukui: Update the
 node name of SCP rpmsg subnode
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
 <20230210085931.8941-3-tinghan.shen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 10/02/23 09:59, Tinghan Shen ha scritto:
> Align the node name with the definition in SCP bindings.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


