Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A91C7EE23
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jun 2023 07:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjFGHrW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jun 2023 03:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbjFGHqw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jun 2023 03:46:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82142701;
        Wed,  7 Jun 2023 00:45:01 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E05F96606EF8;
        Wed,  7 Jun 2023 08:44:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686123900;
        bh=qKBTThrWJPvkW3/ukkDh8Gpa+twvl1LzQgBuxexuNh8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ks9wnzTGOGxYZZuvMmfV3iLXEmndXhdvvGRgRbv41lfvHrN7A7PI5E6tcWjACYXpN
         PdvSnjw8Hl+PT3hWXAOhUznp0ZmroHSof+nJMrqxNwe4xqesZsLzgVXD05bsTI66vW
         jA0rzc9JkePq2X8450tJF+Yq5AuHzrV6tftB4MlIshVkVwCSxKAh4kWqZzUcBqFTAN
         MG4oBYGUGNo1i8LYHy0ojxDsVpxu3xHVRi1v10Ht3PxnfYltnmgts9aquekqBpDr+n
         asSSiTjX/8VJ49oKN0kXjb31fYJPmM4NHhuDDFbLYSFZmM57L5yiXTYK5ht0j1fgQo
         o8LUBT4+Fi0Kg==
Message-ID: <cbb191c3-abf8-f1b4-b8b5-cd142bf9edf5@collabora.com>
Date:   Wed, 7 Jun 2023 09:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v13 06/11] remoteproc: mediatek: Probe multi-core SCP
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
 <20230607072222.8628-7-tinghan.shen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607072222.8628-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 07/06/23 09:22, Tinghan Shen ha scritto:
> The difference of single-core SCP and multi-core SCP device tree is
> the presence of child device nodes described SCP cores. The SCP
> driver populates the platform device and checks the child nodes
> to identify whether it's a single-core SCP or a multi-core SCP.
> 
> Add the remoteproc instances of multi-core SCP to the SCP cluster list.
> When the SCP driver is removed, it cleanup resources by walking
> through the cluster list.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


