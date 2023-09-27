Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A77E810DA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Sep 2023 12:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjI0MZY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjI0MZY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:25:24 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2B9193;
        Wed, 27 Sep 2023 05:25:23 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5300F66072FA;
        Wed, 27 Sep 2023 13:25:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695817521;
        bh=3alifQHOTZ/qI3YlbbyRGBc8mUVf2wmTb8Mv6zKX9iE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NsL9hOLGKdjWajaVH114o3upsbIWtWm501MGIDavSoMA8kIqQY0P/Eg5hMDVVOzam
         pvTVpGsCUixwpI9DoNUYSc1VKVTaomnKLK3CZyAE4d/3lXWMbWH5WqkAx4h+f5tEnb
         N39+Kq+8vIdrRcWzKEQCve7I+OVqV6hiPCQ/aobAknzTFHAP7KBATAaSCn4dwnIkWV
         ad0bQ/CL8JQ49NAKC5AVM8+iK73VRMWwU/d8XWs+Ntt4y4TwZdz/LAIxAZumKkycXK
         0oA2urvSmpC+y952k+NICWuj78L6Dcm6Fdrwd8AQbMudGyqW4uS5xEnpo8eCU4FOFO
         v9W87iOUA6gcA==
Message-ID: <78e2b144-5267-158e-db82-8ba1a5a0e1fd@collabora.com>
Date:   Wed, 27 Sep 2023 14:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230926164513.101958-1-robh@kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230926164513.101958-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 26/09/23 18:45, Rob Herring ha scritto:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


