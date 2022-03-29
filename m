Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D19DC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Mar 2022 02:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiC2CsE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Mar 2022 22:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiC2CsE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Mar 2022 22:48:04 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF74119E089;
        Mon, 28 Mar 2022 19:46:21 -0700 (PDT)
X-UUID: a2d4e9fdb21c4d9982f56cf738eac8c0-20220329
X-UUID: a2d4e9fdb21c4d9982f56cf738eac8c0-20220329
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 297248282; Tue, 29 Mar 2022 10:46:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 29 Mar 2022 10:46:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 10:46:14 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     <xiaobing.shi@mediatek.com>
CC:     <bjorn.andersson@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <matthias.bgg@gmail.com>
Subject: Re: [PATCH] remoteproc: avoid array index out of bounds in debugfs file
Date:   Tue, 29 Mar 2022 10:46:14 +0800
Message-ID: <20220329024614.9783-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220328123413.18169-1-xiaobing.shi@mediatek.com>
References: <20220328123413.18169-1-xiaobing.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Xiaobing,

> There is a negative offset of an on-stack array that causes an out of
> bounds issue when someone called with a zero 'count' argument to
> syswrite().
> 
> 	buf[count - 1]
> 
> We should add an extra check in rproc_coredump_write() to prevent the
> access.
> 
> Signed-off-by: Xiaobing shi <xiaobing.shi@mediatek.com>

Thanks for the patch.
However, Alistair has fixed this issue:
https://lore.kernel.org/all/20220119232139.1125908-1-adelva@google.com/

Thanks,
Miles
