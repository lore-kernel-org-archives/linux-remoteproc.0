Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D71C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jul 2022 09:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiGDJ0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jul 2022 05:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiGDJ0C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jul 2022 05:26:02 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239F1BE17;
        Mon,  4 Jul 2022 02:26:01 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FFE26601604;
        Mon,  4 Jul 2022 10:25:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656926759;
        bh=8zvFYnOz1U946jUFE3WZkMYumMLtWeLYdXvCp8c/6z0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=chx49ZsnQDfd3zIx2uLPIhsslgwIKDzl3zWFNA51ciV4gsF183X2vUUSUnSzl2KXx
         92TDvvf+ASzxjWYcH/E+it48Evlop6RdanCAe/W+7V9XeRK2HNnkZGv3KoKIwcfKXP
         KIPLzbXgBWR7O6xFDdMJnmSnR7yE6MhKXZj9U2o1A/E1VWnN+D2P+A0OeU4u6jUkvR
         ouZwqRVIXq+Ju0nA610/aYEDB1hkdZe9bl2mNoUEcjOpWZPqFIiTX/xRhuEI5hYYLE
         c0fBPtGzUEUTjOd1ni25IQrIv7VdE2z7eIeTUHjeeNVi1BLtvHSH2U3W3uJ0Sls777
         kSr1BR2eotMdQ==
Message-ID: <73c6b04f-f98a-1dee-ff82-ec43a4fce155@collabora.com>
Date:   Mon, 4 Jul 2022 11:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] remoteproc: mediatek: enable cache for mt8186 SCP
Content-Language: en-US
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220701121229.22756-1-allen-kh.cheng@mediatek.com>
 <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701121229.22756-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 01/07/22 14:12, Allen-KH Cheng ha scritto:
> This patch is for enableing cache in SCP. There is not enough space
> on the SRAM of SCP. We need to run programs in DRAM. The DRAM power
> and latency is much larger than SRAM, so cache is used to mitigate
> the negative effects for performance. we set SCP registers for cache
> size before loading SCP FW. (8KB+8KB) and also adjust ipi_buf_offset
> in SRAM from 0x7bdb0 to 0x3BDB0 for enableing cache.
> 
> This patch was tested on MediaTek mt8186.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

