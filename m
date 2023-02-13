Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD19C636CC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Feb 2023 14:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjBMOxg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjBMOxZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Feb 2023 09:53:25 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2461C7F0;
        Mon, 13 Feb 2023 06:53:12 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A5EED660209A;
        Mon, 13 Feb 2023 14:53:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676299991;
        bh=0bj2of/sUN0oQJ69N2Pym5h89V1ivv1HeeJyDvv0zvo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bdQ/nXVIoUm86H0pJWSoU2q8r06of8n0QYwKY5S4YwEnqSIy1lxKHyUHR6Qv+GU1V
         cEd45h76x1Z2mVqF6QLftw9Azi1CrlEnICUQukMZrP9rjTDCFT4bDoKdMA+sbxy+ja
         5U0gtX7tysenbtgLE3g+qhawnQxly1h7FbPDaUBRxyhT0rR4vbdRgVyBFETenYQGjd
         AeWIjh6MATT9uijUIiGZtd+tcAEjIHFRHRa/thpvHz/t9PO6S24GmgLno/TJU18WZ8
         wiqioupTLHsIxYVojloYtmPk4/yy+ix68wqRfPeds+X2FcQV8B8/cfgV6l1dbrLxIK
         nZEcoB/0RNPUw==
Message-ID: <63062e24-e6d1-9749-62fc-20e9fcb80ac2@collabora.com>
Date:   Mon, 13 Feb 2023 15:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 06/12] remoteproc: mediatek: Extract remoteproc
 initialization flow
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
References: <20230213033758.16681-1-tinghan.shen@mediatek.com>
 <20230213033758.16681-7-tinghan.shen@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213033758.16681-7-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 13/02/23 04:37, Tinghan Shen ha scritto:
> This is the preparation for probing multi-core SCP. The remoteproc
> initialization flow is similar on cores and is reuesd to avoid
> redundant code.
> 
> The registers of config and l1tcm are shared for multi-core
> SCP. Reuse the mapped addresses for all cores.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


