Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF7DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 09:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CB6260FE8
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 09:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236758AbhKHJu6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 04:50:58 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:39542 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232818AbhKHJu5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 04:50:57 -0500
X-UUID: 3ee690613a8d4cecb71755dac53b3aae-20211108
X-UUID: 3ee690613a8d4cecb71755dac53b3aae-20211108
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1011212809; Mon, 08 Nov 2021 17:48:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 8 Nov 2021 17:48:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 8 Nov 2021 17:48:08 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: remoteproc: rproc_va_to_pa returns invalid physical address when using sparse memory model
Date:   Mon, 8 Nov 2021 17:48:08 +0800
Message-ID: <20211108094808.1993-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On my arm platform with CONFIG_SPARSEMEM=y, when the virtual address comes
from ioremap, which map to a reserved memory region, rproc_va_to_pa
returns a invalid address. (no iommu)

It's because the corresponding struct page and section not present.
And then __page_to_pfn read the page->flags in the returned page which
is actually an invalid address.
(When CONFIG_SPARSMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n, kernel get the
section the page belong to in flags field.)

I'm looking for suggestion to properly fix this problem.
Could you please give us some suggestion?
